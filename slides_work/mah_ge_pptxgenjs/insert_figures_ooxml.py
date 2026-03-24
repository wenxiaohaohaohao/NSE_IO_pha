from __future__ import annotations

import argparse
import re
import zipfile
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path
import xml.etree.ElementTree as ET

from PIL import Image

EMU_PER_INCH = 914400
P_NS = "http://schemas.openxmlformats.org/presentationml/2006/main"
A_NS = "http://schemas.openxmlformats.org/drawingml/2006/main"
R_NS = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"
REL_NS = "http://schemas.openxmlformats.org/package/2006/relationships"

ET.register_namespace("a", A_NS)
ET.register_namespace("p", P_NS)
ET.register_namespace("r", R_NS)
ET.register_namespace("", REL_NS)


@dataclass(frozen=True)
class Slot:
    slide: int
    asset: str
    x: float
    y: float
    w: float
    h: float


SLOTS = [
    Slot(4, "image3.png", 0.74, 1.52, 4.46, 4.36),
    Slot(13, "image5.jpeg", 0.82, 1.66, 4.58, 4.52),
    Slot(19, "image7.png", 0.86, 2.56, 3.84, 2.86),
    Slot(19, "image8.png", 5.04, 2.56, 3.84, 2.86),
    Slot(20, "image4.png", 5.04, 1.86, 3.78, 3.94),
    Slot(21, "image9.png", 0.90, 2.36, 3.96, 3.50),
    Slot(21, "image10.png", 5.06, 2.36, 3.96, 3.50),
    Slot(22, "image11.jpeg", 0.90, 1.96, 3.96, 3.50),
    Slot(22, "image12.jpeg", 5.06, 1.96, 3.96, 3.50),
]

INNER_LEFT = 0.08
INNER_TOP = 0.08
INNER_RIGHT = 0.08
INNER_BOTTOM = 0.26
INNER_FILL = "F6F2EA"
INNER_LINE = "D7D1C5"
INNER_LINE_WIDTH = "7620"


def qn(namespace: str, tag: str) -> str:
    return f"{{{namespace}}}{tag}"


def inches_to_emu(value: float) -> int:
    return int(round(value * EMU_PER_INCH))


def next_numeric_suffix(values: list[str], prefix: str) -> int:
    best = 0
    for value in values:
        match = re.fullmatch(rf"{re.escape(prefix)}(\d+)", value or "")
        if match:
            best = max(best, int(match.group(1)))
    return best + 1


def inner_box(slot: Slot) -> tuple[int, int, int, int]:
    left = inches_to_emu(slot.x + INNER_LEFT)
    top = inches_to_emu(slot.y + INNER_TOP)
    width = inches_to_emu(slot.w - INNER_LEFT - INNER_RIGHT)
    height = inches_to_emu(slot.h - INNER_TOP - INNER_BOTTOM)
    return left, top, width, height


def fit_image(asset_path: Path, box_left: int, box_top: int, box_width: int, box_height: int) -> tuple[int, int, int, int]:
    with Image.open(asset_path) as img:
        img_width, img_height = img.size

    box_ratio = box_width / box_height
    img_ratio = img_width / img_height

    if img_ratio >= box_ratio:
        width = box_width
        height = int(round(width / img_ratio))
    else:
        height = box_height
        width = int(round(height * img_ratio))

    left = box_left + int(round((box_width - width) / 2))
    top = box_top + int(round((box_height - height) / 2))
    return left, top, width, height


def build_cover_shape(shape_id: int, left: int, top: int, width: int, height: int, name: str) -> ET.Element:
    sp = ET.Element(qn(P_NS, "sp"))

    nv_sp_pr = ET.SubElement(sp, qn(P_NS, "nvSpPr"))
    ET.SubElement(nv_sp_pr, qn(P_NS, "cNvPr"), {"id": str(shape_id), "name": name})
    ET.SubElement(nv_sp_pr, qn(P_NS, "cNvSpPr"))
    ET.SubElement(nv_sp_pr, qn(P_NS, "nvPr"))

    sp_pr = ET.SubElement(sp, qn(P_NS, "spPr"))
    xfrm = ET.SubElement(sp_pr, qn(A_NS, "xfrm"))
    ET.SubElement(xfrm, qn(A_NS, "off"), {"x": str(left), "y": str(top)})
    ET.SubElement(xfrm, qn(A_NS, "ext"), {"cx": str(width), "cy": str(height)})
    prst = ET.SubElement(sp_pr, qn(A_NS, "prstGeom"), {"prst": "rect"})
    ET.SubElement(prst, qn(A_NS, "avLst"))
    solid = ET.SubElement(sp_pr, qn(A_NS, "solidFill"))
    ET.SubElement(solid, qn(A_NS, "srgbClr"), {"val": INNER_FILL})
    line = ET.SubElement(sp_pr, qn(A_NS, "ln"), {"w": INNER_LINE_WIDTH})
    line_fill = ET.SubElement(line, qn(A_NS, "solidFill"))
    ET.SubElement(line_fill, qn(A_NS, "srgbClr"), {"val": INNER_LINE})
    ET.SubElement(line, qn(A_NS, "prstDash"), {"val": "solid"})
    return sp


def build_picture(shape_id: int, rel_id: str, left: int, top: int, width: int, height: int, name: str) -> ET.Element:
    pic = ET.Element(qn(P_NS, "pic"))

    nv_pic_pr = ET.SubElement(pic, qn(P_NS, "nvPicPr"))
    ET.SubElement(
        nv_pic_pr,
        qn(P_NS, "cNvPr"),
        {"id": str(shape_id), "name": name, "descr": name},
    )
    c_nv_pic_pr = ET.SubElement(nv_pic_pr, qn(P_NS, "cNvPicPr"))
    ET.SubElement(c_nv_pic_pr, qn(A_NS, "picLocks"), {"noChangeAspect": "1"})
    ET.SubElement(nv_pic_pr, qn(P_NS, "nvPr"))

    blip_fill = ET.SubElement(pic, qn(P_NS, "blipFill"))
    ET.SubElement(blip_fill, qn(A_NS, "blip"), {qn(R_NS, "embed"): rel_id})
    stretch = ET.SubElement(blip_fill, qn(A_NS, "stretch"))
    ET.SubElement(stretch, qn(A_NS, "fillRect"))

    sp_pr = ET.SubElement(pic, qn(P_NS, "spPr"))
    xfrm = ET.SubElement(sp_pr, qn(A_NS, "xfrm"))
    ET.SubElement(xfrm, qn(A_NS, "off"), {"x": str(left), "y": str(top)})
    ET.SubElement(xfrm, qn(A_NS, "ext"), {"cx": str(width), "cy": str(height)})
    prst = ET.SubElement(sp_pr, qn(A_NS, "prstGeom"), {"prst": "rect"})
    ET.SubElement(prst, qn(A_NS, "avLst"))
    return pic


def parse_xml(data: bytes) -> ET.Element:
    return ET.fromstring(data)


def xml_bytes(element: ET.Element) -> bytes:
    return ET.tostring(element, encoding="utf-8", xml_declaration=True)


def build_output_pptx(input_path: Path, output_path: Path, replacements: dict[str, bytes]) -> None:
    with zipfile.ZipFile(input_path) as zin, zipfile.ZipFile(
        output_path,
        "w",
        compression=zipfile.ZIP_DEFLATED,
    ) as zout:
        existing_names = set(zin.namelist())
        for info in zin.infolist():
            if info.filename in replacements:
                data = replacements[info.filename]
                zout.writestr(info, data)
            elif info.is_dir():
                zout.writestr(info, b"")
            else:
                zout.writestr(info, zin.read(info.filename))

        for name, data in replacements.items():
            if name not in existing_names:
                zout.writestr(name, data)


def insert_figures(input_path: Path, output_path: Path, assets_dir: Path) -> None:
    slots_by_slide: dict[int, list[Slot]] = defaultdict(list)
    for slot in SLOTS:
        slots_by_slide[slot.slide].append(slot)

    with zipfile.ZipFile(input_path) as zin:
        replacements: dict[str, bytes] = {}

        for slide_num, slide_slots in slots_by_slide.items():
            slide_path = f"ppt/slides/slide{slide_num}.xml"
            rels_path = f"ppt/slides/_rels/slide{slide_num}.xml.rels"

            slide_root = parse_xml(zin.read(slide_path))
            rels_root = parse_xml(zin.read(rels_path))
            sp_tree = slide_root.find(f".//{qn(P_NS, 'spTree')}")
            if sp_tree is None:
                raise RuntimeError(f"Missing spTree in {slide_path}")

            existing_shape_ids = [
                int(node.get("id"))
                for node in slide_root.findall(f".//{qn(P_NS, 'cNvPr')}")
                if node.get("id", "").isdigit()
            ]
            next_shape_id = max(existing_shape_ids, default=1) + 1

            existing_rids = [rel.get("Id", "") for rel in rels_root.findall(qn(REL_NS, "Relationship"))]
            next_rid_num = next_numeric_suffix(existing_rids, "rId")

            for slot in slide_slots:
                asset_path = assets_dir / slot.asset
                if not asset_path.exists():
                    raise FileNotFoundError(f"Missing asset: {asset_path}")

                media_path = f"ppt/media/{slot.asset}"
                replacements[media_path] = asset_path.read_bytes()

                rel_id = f"rId{next_rid_num}"
                next_rid_num += 1
                ET.SubElement(
                    rels_root,
                    qn(REL_NS, "Relationship"),
                    {
                        "Id": rel_id,
                        "Type": "http://schemas.openxmlformats.org/officeDocument/2006/relationships/image",
                        "Target": f"../media/{slot.asset}",
                    },
                )

                box_left, box_top, box_width, box_height = inner_box(slot)
                pic_left, pic_top, pic_width, pic_height = fit_image(
                    asset_path,
                    box_left,
                    box_top,
                    box_width,
                    box_height,
                )

                cover_name = f"FigureCover {slot.asset}"
                picture_name = f"Figure {slot.asset}"
                sp_tree.append(build_cover_shape(next_shape_id, box_left, box_top, box_width, box_height, cover_name))
                next_shape_id += 1
                sp_tree.append(build_picture(next_shape_id, rel_id, pic_left, pic_top, pic_width, pic_height, picture_name))
                next_shape_id += 1

            replacements[slide_path] = xml_bytes(slide_root)
            replacements[rels_path] = xml_bytes(rels_root)

    if input_path == output_path:
        temp_output = output_path.with_name(output_path.stem + "_tmp" + output_path.suffix)
        build_output_pptx(input_path, temp_output, replacements)
        temp_output.replace(output_path)
    else:
        build_output_pptx(input_path, output_path, replacements)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True)
    parser.add_argument("--output", required=True)
    parser.add_argument("--assets-dir", default="extracted_media")
    args = parser.parse_args()

    input_path = Path(args.input).resolve()
    output_path = Path(args.output).resolve()
    assets_dir = Path(args.assets_dir).resolve()

    insert_figures(input_path, output_path, assets_dir)
    print(f"Inserted figures into {output_path}")


if __name__ == "__main__":
    main()
