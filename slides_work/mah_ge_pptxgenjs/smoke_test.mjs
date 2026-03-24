import PptxGenJS from "npm:pptxgenjs";
const pptx = new PptxGenJS();
pptx.defineLayout({ name: "C", width: 10, height: 7.5 });
pptx.layout = "C";
const slide = pptx.addSlide();
slide.addText("test", { x: 1, y: 1, w: 2, h: 0.5, fontFace: "Microsoft YaHei", fontSize: 18 });
await pptx.writeFile({ fileName: "smoke_test.pptx" });
console.log("ok");
