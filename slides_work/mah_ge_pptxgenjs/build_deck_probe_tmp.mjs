import PptxGenJS from "npm:pptxgenjs";
import * as imageHelpers from "./pptxgenjs_helpers/image.js";
import * as layoutHelpers from "./pptxgenjs_helpers/layout.js";

const { imageSizingContain } = imageHelpers;
const { warnIfSlideHasOverlaps, warnIfSlideElementsOutOfBounds } =
  layoutHelpers;

const pptx = new PptxGenJS();
pptx.defineLayout({ name: "CUSTOM_4X3", width: 10, height: 7.5 });
pptx.layout = "CUSTOM_4X3";
pptx.author = "OpenAI Codex";
pptx.company = "OpenAI";
pptx.subject = "MAH鍒跺害銆佷紒涓氶噸缁勪笌鍖昏嵂鍒涙柊";
pptx.title = "鍒跺害鏀归潻涓庡尰鑽垱鏂帮細鍩轰簬MAH鍒跺害鐨勫垎鏋?;
pptx.lang = "zh-CN";
pptx.theme = {
  headFontFace: "Microsoft YaHei",
  bodyFontFace: "Microsoft YaHei",
  lang: "zh-CN",
};

const H = 7.5;

const FONT_HEAD = "Microsoft YaHei";
const FONT_BODY = "Microsoft YaHei";
const FONT_MONO = "Consolas";

const COLORS = {
  bg: "F6F2EA",
  paper: "FFFDF9",
  ink: "20313A",
  muted: "6B777F",
  teal: "1F5A62",
  tealSoft: "DDEDEE",
  rust: "C46A3A",
  rustSoft: "F3E4DA",
  olive: "7A8A58",
  oliveSoft: "E6ECD8",
  gold: "D8B36A",
  line: "D7D1C5",
  dark: "17323D",
  white: "FFFFFF",
  sky: "DDE7EF",
};

const TYPE_COLORS = {
  A: "1F5A62",
  B: "C46A3A",
  C: "7A8A58",
  E: "7C6A57",
  rd: "C46A3A",
  prod: "7A8A58",
  mix: "1F5A62",
  transition: "7C6A57",
};

const ASSET = (name) => `./extracted_media_white/${name}`;
const OUTPUT = "./8.鍒跺害鏀归潻涓庡尰鑽垱鏂癬1015_pptxgenjs_restructured.pptx";

let slideCounter = 0;

function addBg(slide) {
  slide.background = { color: COLORS.bg };
  slide.addShape("rect", {
    x: 0.32,
    y: 0.28,
    w: 9.36,
    h: 6.92,
    fill: { color: COLORS.paper },
    line: { color: COLORS.line, width: 1.1 },
    radius: 0.06,
  });
}

function addHeader(slide, section, title, subtitle = "") {
  addBg(slide);
  slide.addText(section.toUpperCase(), {
    x: 0.62,
    y: 0.42,
    w: 2.2,
    h: 0.24,
    fontFace: FONT_HEAD,
    fontSize: 9.5,
    bold: true,
    color: COLORS.teal,
    margin: 0,
    charSpace: 0.6,
  });
  slide.addText(title, {
    x: 0.62,
    y: 0.68,
    w: 7.7,
    h: 0.3,
    fontFace: FONT_HEAD,
    fontSize: 24,
    bold: true,
    color: COLORS.ink,
    margin: 0,
  });
  slide.addShape("line", {
    x: 0.62,
    y: 1.08,
    w: 1.3,
    h: 0,
    line: { color: COLORS.rust, width: 2.2 },
  });
  if (subtitle) {
    slide.addText(subtitle, {
      x: 2.02,
      y: 1.16,
      w: 6.2,
      h: 0.18,
      fontFace: FONT_BODY,
      fontSize: 10.5,
      color: COLORS.muted,
      margin: 0,
    });
  }
  slide.addText("MAH / organization / GE", {
    x: 7.85,
    y: 0.45,
    w: 1.3,
    h: 0.18,
    fontFace: FONT_BODY,
    fontSize: 8.6,
    color: COLORS.muted,
    align: "right",
    margin: 0,
  });
}

function addFooter(slide, num) {
  slide.addShape("line", {
    x: 0.62,
    y: 6.92,
    w: 8.62,
    h: 0,
    line: { color: COLORS.line, width: 0.9 },
  });
  slide.addText("鍒跺害鏀归潻涓庡尰鑽垱鏂?, {
    x: 0.68,
    y: 6.98,
    w: 2.8,
    h: 0.16,
    fontFace: FONT_BODY,
    fontSize: 8.5,
    color: COLORS.muted,
    margin: 0,
  });
  slide.addText(String(num), {
    x: 8.92,
    y: 6.96,
    w: 0.28,
    h: 0.18,
    fontFace: FONT_HEAD,
    fontSize: 9,
    color: COLORS.teal,
    bold: true,
    align: "right",
    margin: 0,
  });
}

function newSlide(section, title, subtitle = "") {
  slideCounter += 1;
  const slide = pptx.addSlide();
  addHeader(slide, section, title, subtitle);
  addFooter(slide, slideCounter);
  return slide;
}

function finalizeSlide(slide) {
  warnIfSlideHasOverlaps(slide, pptx, {
    ignoreLines: true,
    ignoreDecorativeShapes: true,
  });
  warnIfSlideElementsOutOfBounds(slide, pptx);
}

function addCard(slide, x, y, w, h, title, body, opts = {}) {
  const fill = opts.fill || COLORS.white;
  const titleColor = opts.titleColor || COLORS.ink;
  const bodyColor = opts.bodyColor || COLORS.ink;
  const accent = opts.accent || COLORS.teal;
  const titleSize = opts.titleSize || 14.5;
  const bodySize = opts.bodySize || 11.8;
  slide.addShape("rect", {
    x,
    y,
    w,
    h,
    fill: { color: fill },
    line: { color: opts.line || COLORS.line, width: 0.8 },
    radius: 0.06,
  });
  slide.addShape("rect", {
    x,
    y,
    w,
    h: 0.12,
    fill: { color: accent },
    line: { color: accent, width: 0 },
    radius: 0.06,
  });
  slide.addText(title, {
    x: x + 0.18,
    y: y + 0.2,
    w: w - 0.36,
    h: 0.22,
    fontFace: FONT_HEAD,
    fontSize: titleSize,
    bold: true,
    color: titleColor,
    margin: 0,
  });
  if (body) {
    slide.addText(body, {
      x: x + 0.18,
      y: y + 0.52,
      w: w - 0.36,
      h: h - 0.66,
      fontFace: FONT_BODY,
      fontSize: bodySize,
      color: bodyColor,
      margin: 0,
      valign: "top",
    });
  }
}

function estimateTextHeight(text, width, fontSize) {
  const charsPerLine = Math.max(10, Math.floor(width * 7.2));
  const lines = Math.max(1, Math.ceil(String(text).length / charsPerLine));
  return Math.max(0.32, 0.12 + lines * ((fontSize / 72) * 1.28));
}

function addBulletList(slide, bullets, x, y, w, opts = {}) {
  const fontSize = opts.fontSize || 13.5;
  const color = opts.color || COLORS.ink;
  const gap = opts.gap || 0.06;
  let cursor = y;
  for (const bullet of bullets) {
    const h = estimateTextHeight(bullet, w - 0.08, fontSize);
    slide.addText(bullet, {
      x,
      y: cursor,
      w,
      h,
      fontFace: FONT_BODY,
      fontSize,
      color,
      margin: 0,
      bullet: { indent: 14 },
      valign: "top",
    });
    cursor += h + gap;
  }
  return cursor;
}

function addTag(slide, text, x, y, w, fill, color = COLORS.ink) {
  slide.addShape("roundRect", {
    x,
    y,
    w,
    h: 0.26,
    fill: { color: fill },
    line: { color: fill, width: 0 },
    radius: 0.08,
  });
  slide.addText(text, {
    x,
    y: y + 0.045,
    w,
    h: 0.14,
    fontFace: FONT_BODY,
    fontSize: 8.8,
    bold: true,
    color,
    align: "center",
    margin: 0,
  });
}

function addPill(slide, x, y, w, h, label, fill, textColor = COLORS.white) {
  slide.addShape("roundRect", {
    x,
    y,
    w,
    h,
    fill: { color: fill },
    line: { color: fill, width: 0 },
    radius: 0.16,
  });
  slide.addText(label, {
    x,
    y: y + (h - 0.22) / 2,
    w,
    h: 0.22,
    fontFace: FONT_HEAD,
    fontSize: 12.5,
    bold: true,
    color: textColor,
    align: "center",
    margin: 0,
  });
}

function addArrowText(slide, text, x, y, w = 0.24, h = 0.22, size = 18) {
  slide.addText(text, {
    x,
    y,
    w,
    h,
    fontFace: FONT_HEAD,
    fontSize: size,
    bold: true,
    color: COLORS.rust,
    align: "center",
    margin: 0,
  });
}

function addImageWithFrame(slide, path, x, y, w, h, caption = "") {
  slide.addShape("rect", {
    x,
    y,
    w,
    h,
    fill: { color: COLORS.white },
    line: { color: COLORS.line, width: 0.8 },
    radius: 0.04,
  });
  slide.addImage({
    path,
    ...imageSizingContain(path, x + 0.08, y + 0.08, w - 0.16, h - 0.34),
  });
  if (caption) {
    slide.addText(caption, {
      x: x + 0.08,
      y: y + h - 0.18,
      w: w - 0.16,
      h: 0.1,
      fontFace: FONT_BODY,
      fontSize: 8.4,
      color: COLORS.muted,
      margin: 0,
      align: "center",
    });
  }
}

function addMatrixSkeleton(slide, x, y, w, h, title, highlights = []) {
  const rows = ["rd", "prod", "mix", "transition"];
  const cols = ["to rd", "to prod", "to mix", "to trans.", "to exit"];
  slide.addText(title, {
    x,
    y: y - 0.22,
    w,
    h: 0.16,
    fontFace: FONT_HEAD,
    fontSize: 12,
    bold: true,
    color: COLORS.ink,
    margin: 0,
  });
  const leftW = 1.08;
  const headH = 0.44;
  const cellW = (w - leftW) / cols.length;
  const cellH = (h - headH) / rows.length;
  slide.addShape("rect", {
    x,
    y,
    w,
    h,
    fill: { color: COLORS.white },
    line: { color: COLORS.line, width: 0.8 },
  });
  slide.addShape("rect", {
    x,
    y,
    w,
    h: headH,
    fill: { color: COLORS.tealSoft },
    line: { color: COLORS.line, width: 0.8 },
  });
  for (let i = 0; i < cols.length; i += 1) {
    slide.addShape("line", {
      x: x + leftW + i * cellW,
      y,
      w: 0,
      h,
      line: { color: COLORS.line, width: 0.8 },
    });
    slide.addText(cols[i], {
      x: x + leftW + i * cellW + 0.02,
      y: y + 0.11,
      w: cellW - 0.04,
      h: 0.18,
      fontFace: FONT_BODY,
      fontSize: 9.3,
      bold: true,
      color: COLORS.ink,
      align: "center",
      margin: 0,
    });
  }
  for (let r = 0; r < rows.length; r += 1) {
    const rowY = y + headH + r * cellH;
    slide.addShape("line", {
      x,
      y: rowY,
      w,
      h: 0,
      line: { color: COLORS.line, width: 0.8 },
    });
    slide.addShape("rect", {
      x,
      y: rowY,
      w: leftW,
      h: cellH,
      fill: { color: COLORS.sky },
      line: { color: COLORS.line, width: 0.8 },
    });
    slide.addText(rows[r], {
      x: x + 0.04,
      y: rowY + (cellH - 0.16) / 2,
      w: leftW - 0.08,
      h: 0.16,
      fontFace: FONT_BODY,
      fontSize: 10.2,
      bold: true,
      color: COLORS.ink,
      align: "center",
      margin: 0,
    });
    for (let c = 0; c < cols.length; c += 1) {
      const cellX = x + leftW + c * cellW;
      const key = `${rows[r]}-${cols[c]}`;
      const diagonal = (r === 0 && c === 0) ||
        (r === 1 && c === 1) ||
        (r === 2 && c === 2) ||
        (r === 3 && c === 3);
      const highlighted = highlights.includes(key);
      slide.addShape("rect", {
        x: cellX,
        y: rowY,
        w: cellW,
        h: cellH,
        fill: {
          color: highlighted
            ? COLORS.rustSoft
            : diagonal
            ? COLORS.oliveSoft
            : COLORS.white,
        },
        line: { color: COLORS.line, width: 0.6 },
      });
      slide.addText(highlighted ? "閲嶇偣鏂瑰悜" : "寰呮洿鏂?, {
        x: cellX + 0.05,
        y: rowY + (cellH - 0.16) / 2,
        w: cellW - 0.1,
        h: 0.16,
        fontFace: FONT_BODY,
        fontSize: highlighted ? 8.5 : 8,
        color: highlighted ? COLORS.rust : COLORS.muted,
        align: "center",
        margin: 0,
      });
    }
  }
}

function titleSlide() {
  slideCounter += 1;
  const slide = pptx.addSlide();
  slide.background = { color: COLORS.bg };
  slide.addShape("rect", {
    x: 0,
    y: 0,
    w: 3.42,
    h: H,
    fill: { color: COLORS.dark },
    line: { color: COLORS.dark, width: 0 },
  });
  slide.addShape("rect", {
    x: 3.16,
    y: 0,
    w: 0.22,
    h: H,
    fill: { color: COLORS.rust },
    line: { color: COLORS.rust, width: 0 },
  });
  slide.addShape("ellipse", {
    x: 9.2,
    y: 0.2,
    w: 0.18,
    h: 0.18,
    fill: { color: COLORS.tealSoft, transparency: 30 },
    line: { color: COLORS.tealSoft, transparency: 100, width: 0 },
  });
  slide.addShape("ellipse", {
    x: 9.0,
    y: 0.5,
    w: 0.14,
    h: 0.14,
    fill: { color: COLORS.rustSoft, transparency: 24 },
    line: { color: COLORS.rustSoft, transparency: 100, width: 0 },
  });
  slide.addText("鍒跺害鏀归潻涓庡尰鑽垱鏂?, {
    x: 0.6,
    y: 1.2,
    w: 2.36,
    h: 0.52,
    fontFace: FONT_HEAD,
    fontSize: 26,
    bold: true,
    color: COLORS.white,
    margin: 0,
  });
  slide.addText("鍩轰簬 MAH 鍒跺害鐨勫垎鏋?, {
    x: 0.6,
    y: 1.9,
    w: 2.08,
    h: 0.34,
    fontFace: FONT_BODY,
    fontSize: 15.5,
    color: "D8E8E8",
    margin: 0,
  });
  slide.addText("浠庡鎵规彁閫熻蛋鍚戠粍缁囬噸鏋勩€佺姸鎬佽浆绉讳笌琛屼笟鍧囪　", {
    x: 0.6,
    y: 2.38,
    w: 2.16,
    h: 0.48,
    fontFace: FONT_BODY,
    fontSize: 12.8,
    color: "DCE6EA",
    margin: 0,
  });
  slide.addText("鐜嬪媷    鏉ㄦ櫒涓瑰Ξ    闄堟€濇槑", {
    x: 0.6,
    y: 5.45,
    w: 2.18,
    h: 0.2,
    fontFace: FONT_BODY,
    fontSize: 11.2,
    color: COLORS.white,
    margin: 0,
  });
  slide.addText("鍖椾含澶у鏂扮粨鏋勭粡娴庡鐮旂┒闄?, {
    x: 0.6,
    y: 5.73,
    w: 2.28,
    h: 0.18,
    fontFace: FONT_BODY,
    fontSize: 10.2,
    color: "DCE6EA",
    margin: 0,
  });
  slide.addText("浜屻€囦簩鍥涘勾鍗佹湀鍗佷簲鏃?, {
    x: 0.6,
    y: 6.05,
    w: 2.0,
    h: 0.18,
    fontFace: FONT_BODY,
    fontSize: 10.2,
    color: "DCE6EA",
    margin: 0,
  });
  slide.addText("杩欐閲嶆瀯鎶婃棫 deck 鐨勬牳蹇冭儗鏅繚鐣欎笅鏉ワ紝浣嗘妸涓荤嚎鏀规垚锛?, {
    x: 3.9,
    y: 0.94,
    w: 4.95,
    h: 0.22,
    fontFace: FONT_BODY,
    fontSize: 11,
    color: COLORS.muted,
    margin: 0,
  });
  addCard(
    slide,
    3.9,
    1.32,
    5.18,
    1.05,
    "1. MAH 涓嶅彧褰卞搷瀹℃壒閫熷害",
    "瀹冩敼鍙樹簡璋佽兘鎸佽瘉銆佽皝鑳藉鍖呫€佽皝鑳藉湪涓嶈嚜寤轰骇鑳界殑鎯呭喌涓嬪晢涓氬寲鍘熺爺鑽€?,
    { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.2 },
  );
  addCard(
    slide,
    3.9,
    2.58,
    5.18,
    1.05,
    "2. 閲嶇偣浠庘€滀紒涓氬垎鍖栤€濇帹杩涘埌鈥滀紒涓氱姸鎬佽浆绉烩€?,
    "鐪熸瑕佸睍绀虹殑鏄?A/B/C 绫诲瀷涔嬮棿濡備綍杩涘叆銆佸垏鎹€侀€€鍑猴紝浠ュ強 entry composition 濡備綍鏀瑰彉銆?,
    { accent: COLORS.rust, fill: COLORS.white, bodySize: 13.2 },
  );
  addCard(
    slide,
    3.9,
    3.84,
    5.18,
    1.05,
    "3. 缁撹浠?PE 鍒涙柊鏁堝簲鎵╁睍鍒?GE / welfare",
    "鍒涙柊澧炵泭銆佸鎵樼敓浜ч渶姹傘€佺敓浜ц€呭埄娑︿笌鍑€绂忓埄涓€璧疯繘鍏ヨ涓氬潎琛＄殑瑙ｉ噴妗嗘灦銆?,
    { accent: COLORS.olive, fill: COLORS.white, bodySize: 13.2 },
  );
  slide.addText("MAH / firm boundaries / GE", {
    x: 3.9,
    y: 5.28,
    w: 2.34,
    h: 0.16,
    fontFace: FONT_HEAD,
    fontSize: 10,
    bold: true,
    color: COLORS.teal,
    margin: 0,
  });
  slide.addText("PptxGenJS clean rebuild", {
    x: 7.32,
    y: 6.84,
    w: 1.4,
    h: 0.14,
    fontFace: FONT_BODY,
    fontSize: 8.5,
    color: COLORS.muted,
    align: "right",
    margin: 0,
  });
  finalizeSlide(slide);
}

function buildSlides() {
  titleSlide();

  {
    const slide = newSlide(
      "Motivation",
      "Why MAH matters beyond approval speed",
      "鍖昏嵂鍗囩骇銆佸己鐩戠琛屼笟涓庡埗搴︿緵缁欑殑鍖归厤闂",
    );
    addTag(slide, "鍗佸洓浜?/ 鍖昏嵂鍋ュ悍", 0.62, 1.34, 1.45, COLORS.tealSoft);
    slide.addText(
      "鈥滃崄鍥涗簲鈥濇妸鍖昏嵂鍋ュ悍鍒椾负鐢熺墿缁忔祹閲嶇偣棰嗗煙锛岄棶棰樹笉鍙槸澶氬蹇锛岃€屾槸鍒跺害鑳藉惁鍖归厤浜т笟鍗囩骇銆?,
      {
        x: 0.62,
        y: 1.68,
        w: 8.2,
        h: 0.36,
        fontFace: FONT_BODY,
        fontSize: 15.2,
        color: COLORS.ink,
        margin: 0,
      },
    );
    addCard(
      slide,
      0.62,
      2.15,
      2.62,
      2.56,
      "浜т笟鍗囩骇鍘嬪姏",
      "涓浗鍖昏嵂浜т笟姝ｇ粡鍘嗏€滀豢鍒惰嵂 -> 鍒涙柊鑽€濃€滅敓浜у鍚?-> 鐮斿彂瀵煎悜鈥濈殑鍗囩骇锛屽垱鏂拌兘鍚︾ǔ瀹氳浆鍖栨垚涓烘牳蹇冪害鏉熴€?,
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13 },
    );
    addCard(
      slide,
      3.42,
      2.15,
      2.62,
      2.56,
      "寮虹洃绠″苟闈炶儗鏅櫔闊?,
      "鑽搧瀹¤瘎銆佹寔璇佽祫鏍笺€佸鎵樼敓浜ц鍒欎細鐩存帴褰卞搷璋佽兘杩涘叆銆佽皝鑳戒繚鏈夊垱鏂板洖鎶ャ€佽皝鏈夊姩鍔涙姇璧勫師鐮旇嵂銆?,
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 13 },
    );
    addCard(
      slide,
      6.22,
      2.15,
      2.62,
      2.56,
      "鐪熸鐨勯棶棰?,
      "鍦ㄥ綋鍓嶅彂灞曢樁娈碉紝MAH 鏄惁鏄竴椤规洿閫傚疁鐨勫埗搴﹀畨鎺掞紝骞堕€氳繃缁勭粐閲嶆瀯鑰屼笉浠呮槸瀹℃壒鎻愰€熸潵淇冭繘鍒涙柊锛?,
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 13 },
    );
    slide.addShape("rect", {
      x: 0.62,
      y: 5.03,
      w: 8.22,
      h: 1.2,
      fill: { color: COLORS.tealSoft },
      line: { color: COLORS.tealSoft, width: 0 },
      radius: 0.08,
    });
    slide.addText(
      "鏍稿績鐩磋锛氬埗搴︽敼闈╁鏋滄敼鍙樼殑鏄晢涓氬寲鎽╂摝涓庣粍缁囪竟鐣岋紝閭ｄ箞鏈€鍏堝嚭鐜扮殑浜嬪疄涓嶅簲鍙槸鈥滃垱鏂版洿澶氣€濓紝鑰屽簲鏄€滆皝鍦ㄥ垱鏂般€佽皝鍦ㄧ敓浜с€佽皝鍦ㄨ浆鍨嬧€濆彂鐢熷彉鍖栥€?,
      {
        x: 0.88,
        y: 5.34,
        w: 7.65,
        h: 0.44,
        fontFace: FONT_BODY,
        fontSize: 15,
        bold: true,
        color: COLORS.teal,
        margin: 0,
        align: "center",
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Motivation",
      "Main Question and Difference from Jia et al. (2023)",
      "浠庡鎵?鍖哄煙鍒涙柊鏁呬簨鎺ㄨ繘鍒?firm boundaries 涓庤涓氬潎琛?,
    );
    addCard(slide, 0.7, 1.46, 3.95, 4.66, "宸叉湁鏂囩尞鏇村儚鍦ㄩ棶浠€涔堬紵", "", {
      accent: COLORS.line,
      fill: "F8F6F1",
      line: COLORS.line,
    });
    addCard(
      slide,
      5.0,
      1.46,
      4.05,
      4.66,
      "杩欑瘒鏂囩珷鐨勬柊闂鏄粈涔堬紵",
      "",
      { accent: COLORS.teal, fill: COLORS.white, line: COLORS.line },
    );
    addBulletList(
      slide,
      [
        "鏀跨瓥鏄惁缂╃煭瀹¤瘎鏃堕暱銆佹敼鍠勫垱鏂扮幆澧冿紵",
        "鍖哄煙鎴栦紒涓氬眰闈㈢殑鍒涙柊鐢宠鏄惁澧炲姞锛?,
        "鏈哄埗鏇村鍋滅暀鍦ㄥ鎵广€佸競鍦哄噯鍏ャ€佷紒涓氭€ц川绛夌淮搴︺€?,
        "瑙ｉ噴閫氬父鏄?partial equilibrium锛氭斂绛栧啿鍑?-> 鍒涙柊缁撴灉銆?,
      ],
      0.92,
      2.05,
      3.42,
      { fontSize: 13.2, color: COLORS.muted, gap: 0.07 },
    );
    addBulletList(
      slide,
      [
        "MAH 鏄惁鏀瑰彉浜嗙爺鍙戞墍鏈夋潈涓庣敓浜ц兘鍔涗箣闂寸殑鍒跺害杈圭晫锛?,
        "浼佷笟鏄惁鍦?integrated / RD / production 涔嬮棿鍙戠敓閲嶇粍涓庣姸鎬佽浆绉伙紵",
        "鍒涙柊澧為噺鏉ヨ嚜 entrant composition銆乮ncumbent switching锛岃繕鏄袱鑰呭叡鍚屼綔鐢紵",
        "GE 灞傞潰涓婏紝濮旀墭鐢熶骇闇€姹傘€佺敓浜ц€呭埄娑︿笌鍑€绂忓埄濡備綍琚噸鏂板垎閰嶏紵",
      ],
      5.22,
      2.05,
      3.48,
      { fontSize: 13.2, color: COLORS.ink, gap: 0.07 },
    );
    slide.addShape("line", {
      x: 4.74,
      y: 1.8,
      w: 0,
      h: 3.92,
      line: { color: COLORS.line, width: 1.2 },
    });
    slide.addShape("rect", {
      x: 1.0,
      y: 5.35,
      w: 3.18,
      h: 0.42,
      fill: { color: COLORS.rustSoft },
      line: { color: COLORS.rustSoft, width: 0 },
      radius: 0.06,
    });
    slide.addText("鏃т富绾匡細瀹℃壒 / 鍒涙柊", {
      x: 1.0,
      y: 5.46,
      w: 3.18,
      h: 0.14,
      fontFace: FONT_HEAD,
      fontSize: 10.2,
      bold: true,
      color: COLORS.rust,
      align: "center",
      margin: 0,
    });
    slide.addShape("rect", {
      x: 5.28,
      y: 5.35,
      w: 3.48,
      h: 0.42,
      fill: { color: COLORS.tealSoft },
      line: { color: COLORS.tealSoft, width: 0 },
      radius: 0.06,
    });
    slide.addText("鏂颁富绾匡細杈圭晫 / 閲嶇粍 / GE", {
      x: 5.28,
      y: 5.46,
      w: 3.48,
      h: 0.14,
      fontFace: FONT_HEAD,
      fontSize: 10.2,
      bold: true,
      color: COLORS.teal,
      align: "center",
      margin: 0,
    });
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Institution",
      "Industry Upgrade and Reform Background",
      "鏃?deck 涓渶鍊煎緱淇濈暀鐨勪簨瀹炲熀纭€",
    );
    addImageWithFrame(
      slide,
      ASSET("image3.png"),
      0.74,
      1.52,
      4.46,
      4.36,
      "鍘?deck 鐨勮嵂鍝佹敞鍐岀敵璇疯秼鍔垮浘",
    );
    slide.addText("浠?2007 鍒?2023锛屽尰鑽垱鏂版椿鍔ㄤ笌鐩戠鏀归潻鍚屾鎺ㄨ繘銆?, {
      x: 5.52,
      y: 1.72,
      w: 3.05,
      h: 0.32,
      fontFace: FONT_HEAD,
      fontSize: 16,
      bold: true,
      color: COLORS.ink,
      margin: 0,
    });
    addBulletList(
      slide,
      [
        "浜т笟鍗囩骇鏂瑰悜宸茬粡浠庡寲瀛︿豢鍒惰嵂閫愭璧板悜鍒涙柊鑽笌鐢熺墿鑽€?,
        "2015 骞村悗鐨勮嵂鍝佸璇勫鎵规敼闈╋紝浣?MAH 鎴愪负鏈€鍏抽敭鐨勫埗搴﹁妭鐐逛箣涓€銆?,
        "鍥犳闇€瑕佹妸鈥滃垱鏂版暟閲忎笂鍗団€濅笌鈥滅粍缁囪竟鐣屾敼鍙樷€濇斁鍦ㄥ悓涓€寮犲浘閲岀悊瑙ｃ€?,
      ],
      5.52,
      2.2,
      3.0,
      { fontSize: 14, gap: 0.08 },
    );
    addCard(
      slide,
      5.44,
      4.4,
      3.2,
      1.28,
      "鏂板彊浜嬭鍋氱殑涓嶆槸鏇挎崲鑳屾櫙",
      "鑰屾槸鍦ㄨ繖涓€鑳屾櫙涔嬩笂锛屾妸鏁呬簨浠庘€滄敼闈╀績杩涘垱鏂扳€濇帹杩涘埌鈥滄敼闈╅噸鍐欎簡璋佽兘鍒涙柊銆佽皝鑳界敓浜с€佽皝鑳藉瓨娲烩€濄€?,
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 12.6 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Institution",
      "Pre-MAH Bundled Regime",
      "鎸佽瘉璧勬牸涓庣敓浜ц兘鍔涙崋缁戯紝鍒涙柊鎵€鏈夋潈闅句互鐙珛淇濈暀",
    );
    addPill(slide, 1.0, 2.04, 1.8, 0.5, "鐮斿彂鏈烘瀯 / 瀹為獙瀹?, TYPE_COLORS.B);
    addArrowText(slide, "鈫?, 2.98, 2.14);
    addPill(slide, 3.46, 2.04, 1.55, 0.5, "鎴愭灉杞", COLORS.rust);
    addArrowText(slide, "鈫?, 5.2, 2.14);
    addPill(
      slide,
      5.68,
      1.92,
      2.02,
      0.74,
      "鐢熶骇浼佷笟\n(鎸佽瘉 + 鐢熶骇)",
      TYPE_COLORS.A,
    );
    slide.addShape("rect", {
      x: 1.0,
      y: 3.02,
      w: 6.7,
      h: 1.1,
      fill: { color: COLORS.rustSoft },
      line: { color: COLORS.rustSoft, width: 0 },
      radius: 0.08,
    });
    slide.addText(
      "鍒跺害绾︽潫锛氳嫢鎯宠幏寰楁渶缁堝競鍦哄洖鎶ワ紝鐮斿彂涓讳綋閫氬父闇€瑕佹妸鎴愭灉杞粰鍏峰鐢熶骇璧勮川鐨勪竴浣撳寲浼佷笟锛屾垨鑰呰嚜宸辨壙鎷呭缓鍘備笌璧勮川鎴愭湰銆?,
      {
        x: 1.24,
        y: 3.34,
        w: 6.18,
        h: 0.44,
        fontFace: FONT_BODY,
        fontSize: 15,
        bold: true,
        color: COLORS.rust,
        margin: 0,
        align: "center",
      },
    );
    addCard(
      slide,
      7.86,
      1.72,
      1.36,
      3.92,
      "鍚箟",
      "",
      {
        accent: COLORS.dark,
        fill: "F8F6F1",
        line: COLORS.line,
        titleSize: 13.2,
      },
    );
    addBulletList(
      slide,
      [
        "鍒涙柊鎵€鏈夋潈涓庝骇鑳界粦瀹氥€?,
        "鍟嗕笟鍖栭棬妲涢珮銆?,
        "Integrated incumbents 鏇村崰浼樸€?,
        "濮旀墭鐢熶骇甯傚満涓嶅彂杈俱€?,
      ],
      8.02,
      2.3,
      1.02,
      { fontSize: 11.2, gap: 0.08 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Institution",
      "Post-MAH Separation of Ownership and Production",
      "MAH 鍏佽鐮斿彂涓讳綋鎸佽瘉锛岀敓浜у彲浠ュ鍖呯粰涓撲笟鍒堕€犱紒涓?,
    );
    addPill(
      slide,
      0.92,
      1.96,
      2.04,
      0.72,
      "MAH 鎸佽瘉涓讳綋\n(鐮斿彂鏈烘瀯 / 浼佷笟)",
      TYPE_COLORS.B,
    );
    addArrowText(slide, "鈫?, 3.12, 2.15, 0.3, 0.22, 20);
    addPill(slide, 3.48, 2.04, 1.88, 0.56, "淇濈暀鎵€鏈夋潈 / 鎸佽瘉", TYPE_COLORS.A);
    addArrowText(slide, "鈫?, 5.56, 2.15, 0.3, 0.22, 20);
    addPill(
      slide,
      5.92,
      1.96,
      2.18,
      0.72,
      "濮旀墭鐢熶骇浼佷笟\n(CMO / CDMO)",
      TYPE_COLORS.C,
    );
    slide.addShape("rect", {
      x: 1.0,
      y: 3.06,
      w: 7.18,
      h: 1.14,
      fill: { color: COLORS.tealSoft },
      line: { color: COLORS.tealSoft, width: 0 },
      radius: 0.08,
    });
    slide.addText(
      "鍒跺害鍚箟锛氬師鐮旇嵂 idea 鐨勫晢涓氬寲浠峰€间笉鍐嶅繀椤婚€氳繃鑷缓浜ц兘鎵嶈兘瀹炵幇锛孧AH 鎶娾€滄寔璇佲€濆拰鈥滅敓浜р€濇媶寮€锛屽鎵樺埗閫犲紑濮嬫湁浜嗗競鍦恒€?,
      {
        x: 1.22,
        y: 3.37,
        w: 6.72,
        h: 0.46,
        fontFace: FONT_BODY,
        fontSize: 15,
        bold: true,
        color: COLORS.teal,
        margin: 0,
        align: "center",
      },
    );
    addCard(slide, 8.36, 1.64, 0.92, 4.18, "鍙樺寲", "", {
      accent: COLORS.rust,
      fill: COLORS.white,
      titleSize: 12.8,
    });
    addBulletList(
      slide,
      ["RD 淇濇寔鎸佽瘉", "鐢熶骇涓撲笟鍖?, "澶栧寘闇€姹備笂鍗?, "杩涘叆闂ㄦ涓嬮檷"],
      8.46,
      2.26,
      0.72,
      { fontSize: 10.6, gap: 0.08 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Mechanism",
      "From Firm Differentiation to Firm-State Transitions",
      "杩欐槸涓€寮犳ˉ鎺?slide锛氭妸 old story 鎺ュ埌 new story 涓?,
    );
    addPill(slide, 4.26, 1.64, 1.38, 0.46, "A: integrated", TYPE_COLORS.A);
    addPill(slide, 1.48, 3.02, 1.46, 0.46, "B: RD type", TYPE_COLORS.B);
    addPill(slide, 7.02, 3.02, 1.62, 0.46, "C: production", TYPE_COLORS.C);
    addPill(slide, 4.18, 4.78, 1.54, 0.46, "E: entrants", TYPE_COLORS.E);
    addArrowText(slide, "鈫?, 3.48, 2.34, 0.26, 0.24, 18);
    addArrowText(slide, "鈫?, 6.1, 2.34, 0.26, 0.24, 18);
    addArrowText(slide, "鈫?, 3.4, 4.16, 0.26, 0.24, 18);
    addArrowText(slide, "鈫?, 6.16, 4.16, 0.26, 0.24, 18);
    slide.addText("A 鈫?B", {
      x: 2.86,
      y: 2.72,
      w: 0.6,
      h: 0.14,
      fontFace: FONT_BODY,
      fontSize: 9.8,
      color: COLORS.rust,
      margin: 0,
    });
    slide.addText("A 鈫?C", {
      x: 6.18,
      y: 2.72,
      w: 0.6,
      h: 0.14,
      fontFace: FONT_BODY,
      fontSize: 9.8,
      color: COLORS.rust,
      margin: 0,
    });
    slide.addText("B 鈫?A", {
      x: 2.84,
      y: 3.78,
      w: 0.6,
      h: 0.14,
      fontFace: FONT_BODY,
      fontSize: 9.8,
      color: COLORS.rust,
      margin: 0,
    });
    slide.addText("C 鈫?A", {
      x: 6.18,
      y: 3.78,
      w: 0.6,
      h: 0.14,
      fontFace: FONT_BODY,
      fontSize: 9.8,
      color: COLORS.rust,
      margin: 0,
    });
    addCard(
      slide,
      0.92,
      5.55,
      8.02,
      0.82,
      "MAH 鐨勬満鍒朵笉鏄浼佷笟鈥滆嚜鍔ㄦ洿鍒涙柊鈥濓紝鑰屾槸鍏堥檷浣庡晢涓氬寲鎽╂摝鍜岄噸缁勯棬妲涳紝鍐嶈瀵?entry銆乻witching銆乷utsourcing 涓?survival 涓€璧峰彉鍖栥€?,
      "",
      {
        accent: COLORS.teal,
        fill: COLORS.tealSoft,
        titleSize: 14.2,
        bodySize: 1,
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Facts",
      "Empirical Classification and Theory Mapping",
      "鎶?current four-way classification 缈昏瘧鎴愮悊璁虹姸鎬?,
    );
    const x = 0.82;
    const y = 1.7;
    const widths = [1.35, 2.1, 1.8, 2.95];
    const headers = ["缁忛獙鍒嗙被", "鍚箟", "鐞嗚鏄犲皠", "鍦ㄦ柊 deck 閲岀殑浣滅敤"];
    let cursorX = x;
    for (let i = 0; i < headers.length; i += 1) {
      slide.addShape("rect", {
        x: cursorX,
        y,
        w: widths[i],
        h: 0.5,
        fill: { color: i % 2 === 0 ? COLORS.tealSoft : COLORS.sky },
        line: { color: COLORS.line, width: 0.8 },
      });
      slide.addText(headers[i], {
        x: cursorX + 0.04,
        y: y + 0.16,
        w: widths[i] - 0.08,
        h: 0.16,
        fontFace: FONT_HEAD,
        fontSize: 10.8,
        bold: true,
        color: COLORS.ink,
        align: "center",
        margin: 0,
      });
      cursorX += widths[i];
    }
    const rows = [
      ["rd", "鐮斿彂浜哄憳鍗犱紭", "B", "鏈€鎺ヨ繎 theory 涓殑鐮斿彂涓撻棬鍖栦紒涓?],
      ["prod", "鐢熶骇浜哄憳鍗犱紭", "C", "鎵挎帴 outsourcing demand 鐨勭敓浜т晶"],
      ["mix", "鐮斿彂涓庣敓浜у悓鏃舵樉钁?, "A", "缁忛獙涓婄殑 integrated type"],
      [
        "transition",
        "鐭湡閲嶇粍鐘舵€?,
        "杩囨浮鐘舵€?,
        "淇濈暀鍦ㄥ疄璇侀噷锛屼絾涓嶄綔涓洪暱鏈熺悊璁虹被鍨?,
      ],
    ];
    for (let r = 0; r < rows.length; r += 1) {
      let rowX = x;
      const rowY = y + 0.5 + r * 0.76;
      for (let c = 0; c < headers.length; c += 1) {
        slide.addShape("rect", {
          x: rowX,
          y: rowY,
          w: widths[c],
          h: 0.76,
          fill: { color: COLORS.white },
          line: { color: COLORS.line, width: 0.8 },
        });
        slide.addText(rows[r][c], {
          x: rowX + 0.08,
          y: rowY + 0.16,
          w: widths[c] - 0.16,
          h: 0.38,
          fontFace: c === 0 ? FONT_HEAD : FONT_BODY,
          fontSize: c === 0 ? 11.4 : 10.8,
          bold: c === 0,
          color: c === 0
            ? TYPE_COLORS[rows[r][0]]
            : c === 2
            ? COLORS.teal
            : COLORS.ink,
          align: c === 0 || c === 2 ? "center" : "left",
          margin: 0,
          valign: "mid",
        });
        rowX += widths[c];
      }
    }
    slide.addShape("rect", {
      x: 0.92,
      y: 5.48,
      w: 7.92,
      h: 0.82,
      fill: { color: COLORS.rustSoft },
      line: { color: COLORS.rustSoft, width: 0 },
      radius: 0.08,
    });
    slide.addText(
      "鍏抽敭澶勭悊锛氭妸 empirical mix 瑙ｉ噴涓?integrated A锛屾妸 transition 瑙ｉ噴涓虹煭鏈熺粍缁囬噸鏋勭殑瑙傛祴鐘舵€併€傝繖鏍风悊璁哄拰瀹炶瘉灏辫兘瀵逛笂銆?,
      {
        x: 1.18,
        y: 5.77,
        w: 7.4,
        h: 0.22,
        fontFace: FONT_BODY,
        fontSize: 14,
        bold: true,
        color: COLORS.rust,
        margin: 0,
        align: "center",
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Facts",
      "What the First-Stage Facts Need to Show",
      "first-stage empirical goal = reorganization, not only more innovation",
    );
    addCard(
      slide,
      0.84,
      1.68,
      3.88,
      1.54,
      "1. Type shares over time",
      "鍏堢湅 rd / prod / mix / transition 鐨勫崰姣旇矾寰勶紝鍐嶇湅鍝簺鍙樺寲鏄湪 2016 浠ュ悗鍔犻€熺殑銆?,
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.1 },
    );
    addCard(
      slide,
      5.0,
      1.68,
      3.88,
      1.54,
      "2. Transition matrices",
      "閲嶇偣涓嶆槸鎶婃墍鏈夋暟瀛楅兘鍋氭弧锛岃€屾槸鐩綇 mix鈫抮d銆乵ix鈫抪rod銆乸rod鈫抦ix銆乺d鈫抦ix 浠ュ強鍚勭被鍨?exit銆?,
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 13.1 },
    );
    addCard(
      slide,
      0.84,
      3.54,
      3.88,
      1.54,
      "3. Entry composition",
      "鎶?entry鈫抮d/prod/mix/transition 鍗曠嫭鎷垮嚭鏉ワ紱涓嶈鍜?incumbent switching 娣峰湪涓€璧疯В閲娿€?,
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 13.1 },
    );
    addCard(
      slide,
      5.0,
      3.54,
      3.88,
      1.54,
      "4. Innovation reallocation",
      "鎶婂垱鏂版暟閲忋€佸垱鏂拌川閲忓拰鍒涙柊浠介鎸夌被鍨嬫媶寮€锛岀湅澧為噺鏉ヨ嚜鈥滄洿澶?rd firms鈥濊繕鏄€渞d 鍐呴儴鏇村己鈥濄€?,
      { accent: COLORS.gold, fill: COLORS.white, bodySize: 13.1 },
    );
    slide.addShape("rect", {
      x: 1.08,
      y: 5.52,
      w: 7.58,
      h: 0.78,
      fill: { color: COLORS.tealSoft },
      line: { color: COLORS.tealSoft, width: 0 },
      radius: 0.08,
    });
    slide.addText(
      "鍙湁鎶婅繖鍥涘眰浜嬪疄涓茶捣鏉ワ紝MAH 鐨勬満鍒舵晠浜嬫墠浼氫粠鈥滃垱鏂板洖褰掆€濆彉鎴愨€滆涓氱粍缁囬噸鏋勨€濄€?,
      {
        x: 1.24,
        y: 5.78,
        w: 7.22,
        h: 0.2,
        fontFace: FONT_BODY,
        fontSize: 14.2,
        bold: true,
        color: COLORS.teal,
        align: "center",
        margin: 0,
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Facts",
      "Pre-Policy Transition Matrix",
      "鍩虹嚎鐭╅樀鍏堢湅绋冲畾鎬с€侀€€鍑轰笌 within-regime transitions",
    );
    addMatrixSkeleton(
      slide,
      0.9,
      1.88,
      5.92,
      3.42,
      "Pre-policy row-share matrix",
    );
    addCard(slide, 7.08, 1.86, 1.88, 3.62, "鎿嶄綔瑙勫垯", "", {
      accent: COLORS.rust,
      fill: COLORS.white,
      titleSize: 12.8,
    });
    addBulletList(
      slide,
      [
        "鎺ㄨ崘 origin years = 2011-2014銆?,
        "涓嶈璁?2015鈫?016 璺ㄥ埗搴﹂樁娈垫薄鏌?pre matrix銆?,
        "鍏堝仛 counts锛屽啀鍋?row shares銆?,
        "杩欎竴椤垫渶閲嶈鐨勬槸璇诲瑙掔嚎涓?exit銆?,
      ],
      7.24,
      2.44,
      1.52,
      { fontSize: 10.6, gap: 0.07 },
    );
    slide.addShape("rect", {
      x: 1.0,
      y: 5.64,
      w: 5.68,
      h: 0.5,
      fill: { color: COLORS.oliveSoft },
      line: { color: COLORS.oliveSoft, width: 0 },
      radius: 0.05,
    });
    slide.addText(
      "杩欎竴椤电洰鍓嶆斁鐨勬槸妯℃澘缁撴瀯锛岀瓑 firm-year panel 鍥哄畾鍚庣洿鎺ュ洖濉湡瀹?row shares銆?,
      {
        x: 1.16,
        y: 5.8,
        w: 5.36,
        h: 0.14,
        fontFace: FONT_BODY,
        fontSize: 11.2,
        color: COLORS.olive,
        bold: true,
        margin: 0,
        align: "center",
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Facts",
      "Post-Policy Transition Matrix",
      "閲嶇偣涓嶅湪鈥滃叏閮ㄩ兘鍙樷€濓紝鑰屽湪鍏抽敭鏂瑰悜鐨勬鐜囨槸鍚︿笂鍗?,
    );
    addMatrixSkeleton(
      slide,
      0.9,
      1.88,
      5.92,
      3.42,
      "Post-policy row-share matrix",
      ["mix-to rd", "mix-to prod", "prod-to mix", "rd-to mix"],
    );
    addCard(slide, 7.08, 1.86, 1.88, 3.62, "璇绘硶", "", {
      accent: COLORS.teal,
      fill: COLORS.white,
      titleSize: 12.8,
    });
    addBulletList(
      slide,
      [
        "origin years = 2016-2022銆?,
        "鍏堝仛 post锛屽啀鎷?pilot / national銆?,
        "姣旇緝鍏抽敭 off-diagonal row shares銆?,
        "浣庨杞瀷鏃跺啀鍋?hazard / cumulative銆?,
      ],
      7.24,
      2.34,
      1.52,
      { fontSize: 10, gap: 0.04 },
    );
    slide.addShape("rect", {
      x: 1.0,
      y: 5.64,
      w: 5.68,
      h: 0.5,
      fill: { color: COLORS.rustSoft },
      line: { color: COLORS.rustSoft, width: 0 },
      radius: 0.05,
    });
    slide.addText(
      "濡傛灉鏀跨瓥鍚庡彧鏄€滃垱鏂版洿澶氣€濅絾缁勭粐鏂瑰悜涓嶅彉锛孏E 鍙欎簨灏辩珯涓嶄綇锛涙墍浠ュ叧閿槸鎶婅繖椤靛仛鎴愭満鍒惰瘉鎹€屼笉鏄楗般€?,
      {
        x: 1.1,
        y: 5.8,
        w: 5.5,
        h: 0.14,
        fontFace: FONT_BODY,
        fontSize: 11.2,
        color: COLORS.rust,
        bold: true,
        margin: 0,
        align: "center",
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Facts",
      "Entry Composition Must Be Separated from Incumbent Switching",
      "杩欎袱鏉¤竟闄呭湪缁忔祹瀛︿笂瀹屽叏涓嶅悓",
    );
    addCard(slide, 0.82, 1.76, 3.7, 3.76, "Entry margin", "", {
      accent: COLORS.olive,
      fill: COLORS.white,
    });
    addPill(slide, 1.32, 2.72, 1.28, 0.42, "entry", TYPE_COLORS.E);
    addArrowText(slide, "鈫?, 2.78, 2.8, 0.22, 0.2, 18);
    addPill(slide, 3.08, 2.38, 0.94, 0.38, "rd", TYPE_COLORS.rd);
    addPill(slide, 3.08, 2.94, 0.94, 0.38, "prod", TYPE_COLORS.prod);
    addPill(slide, 3.08, 3.5, 0.94, 0.38, "mix", TYPE_COLORS.mix);
    addPill(
      slide,
      3.08,
      4.06,
      0.94,
      0.38,
      "transition",
      TYPE_COLORS.transition,
    );
    slide.addText(
      "闂锛氭斂绛栧悗鏂拌繘鍏ヨ€呮槸鍚︽洿鍋忓悜 rd / biotech / 鍘熺爺鑽鍚戯紵",
      {
        x: 1.16,
        y: 4.62,
        w: 3.0,
        h: 0.32,
        fontFace: FONT_BODY,
        fontSize: 13.2,
        color: COLORS.ink,
        align: "center",
        margin: 0,
      },
    );
    addCard(slide, 5.0, 1.76, 4.0, 3.76, "Incumbent switching", "", {
      accent: COLORS.teal,
      fill: COLORS.white,
    });
    addPill(slide, 6.58, 2.36, 1.0, 0.42, "A", TYPE_COLORS.A);
    addPill(slide, 5.54, 3.42, 1.0, 0.42, "B", TYPE_COLORS.B);
    addPill(slide, 7.62, 3.42, 1.0, 0.42, "C", TYPE_COLORS.C);
    addArrowText(slide, "鈫?, 6.1, 2.84, 0.2, 0.2, 18);
    addArrowText(slide, "鈫?, 7.52, 2.84, 0.2, 0.2, 18);
    addArrowText(slide, "鈫?, 6.1, 4.1, 0.2, 0.2, 18);
    addArrowText(slide, "鈫?, 7.52, 4.1, 0.2, 0.2, 18);
    slide.addText("闂锛氱幇鏈変紒涓氭槸鍚﹀洜涓?MAH 鏇村鏄撲笓涓氬寲銆侀噸鏂版暣鍚堟垨閫€鍑猴紵", {
      x: 5.42,
      y: 4.62,
      w: 3.16,
      h: 0.32,
      fontFace: FONT_BODY,
      fontSize: 13.2,
      color: COLORS.ink,
      align: "center",
      margin: 0,
    });
    slide.addShape("rect", {
      x: 1.1,
      y: 5.78,
      w: 7.76,
      h: 0.42,
      fill: { color: COLORS.tealSoft },
      line: { color: COLORS.tealSoft, width: 0 },
      radius: 0.05,
    });
    slide.addText(
      "Do not mix these margins. entry composition tells us who wants to join the market; incumbent switching tells us how existing firms reorganize.",
      {
        x: 1.22,
        y: 5.91,
        w: 7.5,
        h: 0.16,
        fontFace: FONT_BODY,
        fontSize: 11.5,
        color: COLORS.teal,
        bold: true,
        align: "center",
        margin: 0,
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Facts",
      "Descriptive Differentiation Evidence Already Visible",
      "鏃?deck 閲屽凡鏈変竴寮犲緢鏈夌敤鐨勪笉鍚岀被鍨嬩紒涓氭暟閲忓彉鍖栬秼鍔垮浘",
    );
    addImageWithFrame(
      slide,
      ASSET("image5.jpeg"),
      0.82,
      1.66,
      4.58,
      4.52,
      "鍘?deck 鐨勪笉鍚岀被鍨嬩紒涓氭暟閲忓彉鍖栬秼鍔?,
    );
    addCard(
      slide,
      5.72,
      1.7,
      3.04,
      1.18,
      "What we can already say",
      "杩欏紶鍥捐嚦灏戣〃鏄庘€滀紒涓氬垎鍖栤€濆苟涓嶆槸鎶借薄姒傚康锛岃€屾槸 deck 涓凡缁忓嚭鐜扮殑鎻忚堪鎬т簨瀹炪€?,
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.1 },
    );
    addBulletList(
      slide,
      [
        "涓嬩竴姝ヨ鎶婃暟閲忚秼鍔垮崌绾ф垚 type shares over time銆?,
        "鍐嶆妸鍒涙柊鎸夌被鍨嬫媶寮€锛岀湅澧為噺绌剁珶鏉ヨ嚜璋併€?,
        "涔嬪悗鍐嶆斁 transition matrix 涓?entry composition锛屾暣鏉′簨瀹為摼灏辫兘闂悎銆?,
      ],
      5.76,
      3.2,
      2.94,
      { fontSize: 13.2, gap: 0.08 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Model",
      "Model Overview",
      "寮辨暣鍚堢殑鏂扮粨鏋勭粡娴庡鐗堟湰锛歞evelopment stage + organizational choice",
    );
    addCard(
      slide,
      0.84,
      1.76,
      2.34,
      1.86,
      "State variables",
      "浼佷笟鑳藉姏 z\n鍙戝睍闃舵 xi\n鍒跺害鍙橀噺 M 鈭?{0,1}",
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 15 },
    );
    addCard(
      slide,
      3.38,
      1.76,
      2.34,
      1.86,
      "Active types",
      "A = integrated\nB = RD specialized\nC = production specialized",
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 15 },
    );
    addCard(
      slide,
      5.92,
      1.76,
      2.94,
      1.86,
      "Outcomes",
      "innovation\nentry / exit\nproducer profits\nnet welfare",
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 15 },
    );
    addArrowText(slide, "鈫?, 1.88, 3.86, 0.24, 0.18, 22);
    addArrowText(slide, "鈫?, 4.44, 3.86, 0.24, 0.18, 22);
    addArrowText(slide, "鈫?, 7.28, 3.86, 0.24, 0.18, 22);
    slide.addShape("rect", {
      x: 1.04,
      y: 4.26,
      w: 7.74,
      h: 1.3,
      fill: { color: COLORS.sky },
      line: { color: COLORS.line, width: 0.8 },
      radius: 0.08,
    });
    slide.addText(
      "閫昏緫閾撅細 鍙戝睍闃舵涓庡埗搴﹂€傞厤 -> 鍟嗕笟鍖栨懇鎿︿笅闄?/ 閲嶇粍闂ㄦ涓嬮檷 -> A/B/C 涔嬮棿鐨勮繘鍏ャ€佸垏鎹笌閫€鍑?-> 鍒涙柊涓庤涓氬潎琛￠噸鎺?,
      {
        x: 1.34,
        y: 4.62,
        w: 7.14,
        h: 0.44,
        fontFace: FONT_BODY,
        fontSize: 17,
        bold: true,
        color: COLORS.teal,
        align: "center",
        margin: 0,
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Model",
      "Timing and Key Choices",
      "鎶婃ā鍨嬫敹鎴?JDE-friendly 鐨勪腑绛夊鏉傚害鐗堟湰",
    );
    const steps = [
      ["1. Entry", "娼滃湪杩涘叆鑰?E 鍐冲畾鏄惁浠?B / C 杩涘叆銆?],
      ["2. Idea & implementation", "B 浜х敓 idea锛屽苟鍐冲畾澶栧寘缁?C 杩樻槸杞洖 A銆?],
      ["3. Switching", "A/B/C 鍦ㄧ粍缁囪竟鐣屼箣闂村仛绂绘暎璋冩暣銆?],
      [
        "4. Exit / stationary equilibrium",
        "瀛樻椿銆侀€€鍑轰笌鍒嗗竷鍏卞悓鍐冲畾琛屼笟绋虫€併€?,
      ],
    ];
    let x = 0.86;
    for (let i = 0; i < steps.length; i += 1) {
      addCard(
        slide,
        x,
        2.08,
        1.95,
        2.96,
        steps[i][0],
        steps[i][1],
        {
          accent: i === 0
            ? COLORS.olive
            : i === 1
            ? COLORS.rust
            : i === 2
            ? COLORS.teal
            : COLORS.dark,
          fill: COLORS.white,
          bodySize: 12.6,
        },
      );
      if (i < steps.length - 1) {
        addArrowText(slide, "鈫?, x + 1.98, 3.38, 0.18, 0.2, 16);
      }
      x += 2.24;
    }
    slide.addShape("rect", {
      x: 1.0,
      y: 5.48,
      w: 7.86,
      h: 0.68,
      fill: { color: COLORS.rustSoft },
      line: { color: COLORS.rustSoft, width: 0 },
      radius: 0.05,
    });
    slide.addText(
      "杩欏洓鍧楀凡缁忚冻澶燂細涓夌被浼佷笟 + implementation 閫夋嫨 + 鐘舵€佽浆绉?+ 濮旀墭鐢熶骇甯傚満娓呯畻銆傛病鏈夊繀瑕佸啀鎶婅瀺璧勫悎鍚屾垨澶嶆潅骞惰喘缁撴瀯濉炶繘涓绘ā鍨嬨€?,
      {
        x: 1.2,
        y: 5.7,
        w: 7.46,
        h: 0.18,
        fontFace: FONT_BODY,
        fontSize: 13.4,
        color: COLORS.rust,
        bold: true,
        align: "center",
        margin: 0,
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Model",
      "Institutional Fit and Reduced Frictions",
      "鎶娾€滈€傚疁鍒跺害瀹夋帓鈥濆啓鎴?commercialization friction 涓?switching cost 鐨勪笅闄?,
    );
    addCard(
      slide,
      0.82,
      1.72,
      3.76,
      3.94,
      "Reduced-form objects",
      "",
      { accent: COLORS.teal, fill: COLORS.white },
    );
    slide.addText("Lambda(z, xi)", {
      x: 1.1,
      y: 2.32,
      w: 2.5,
      h: 0.28,
      fontFace: FONT_MONO,
      fontSize: 18,
      bold: true,
      color: COLORS.teal,
      margin: 0,
    });
    slide.addText(
      "institutional fit between firm capability and development stage",
      {
        x: 1.1,
        y: 2.64,
        w: 3.0,
        h: 0.34,
        fontFace: FONT_BODY,
        fontSize: 11.8,
        color: COLORS.muted,
        margin: 0,
      },
    );
    slide.addText("tau(z, xi, M) = base tau - M * Delta_tau * Lambda(z, xi)", {
      x: 1.1,
      y: 3.2,
      w: 3.1,
      h: 0.28,
      fontFace: FONT_MONO,
      fontSize: 13.4,
      color: COLORS.rust,
      margin: 0,
    });
    slide.addText(
      "kappa_sj(z, xi, M) = base kappa_sj - M * Delta_sj * Lambda(z, xi)",
      {
        x: 1.1,
        y: 3.78,
        w: 3.1,
        h: 0.28,
        fontFace: FONT_MONO,
        fontSize: 13.4,
        color: COLORS.rust,
        margin: 0,
      },
    );
    addCard(
      slide,
      5.0,
      1.72,
      3.88,
      3.94,
      "Interpretation",
      "",
      { accent: COLORS.rust, fill: COLORS.white },
    );
    addBulletList(
      slide,
      [
        "MAH 闄嶄綆 B 鍨嬩紒涓氭妸鍘熺爺鑽?idea 鍟嗕笟鍖栫殑鍒跺害鎽╂摝 tau銆?,
        "MAH 涔熼檷浣?A/B/C 涔嬮棿绂绘暎閲嶇粍鐨勯棬妲?kappa_sj銆?,
        "鍙戝睍闃舵瓒婇珮銆佷紒涓氳兘鍔涜秺寮猴紝杩欎袱涓笭閬撶殑鏀跨瓥鏁堝簲瓒婂ぇ銆?,
        "杩欏氨鏄€滄湁涓烘斂搴?+ 鏈夋晥甯傚満鈥濊繘鍏ユā鍨嬬殑鍦版柟銆?,
      ],
      5.26,
      2.26,
      3.3,
      { fontSize: 13.4, gap: 0.08 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Model",
      "Contract Manufacturing Market and GE",
      "B 鐨勫晢涓氬寲閫夋嫨涓?C 鐨勫彈鎵樼敓浜ц兘鍔涘湪琛屼笟鍐呴儴娓呯畻",
    );
    addPill(slide, 1.04, 2.12, 1.62, 0.5, "B: generate ideas", TYPE_COLORS.B);
    addArrowText(slide, "鈫?, 2.8, 2.22);
    addPill(slide, 3.26, 2.12, 2.0, 0.5, "implementation choice", COLORS.rust);
    addArrowText(slide, "鈫?, 5.48, 2.22);
    addPill(slide, 5.98, 2.12, 1.86, 0.5, "C: manufacturing", TYPE_COLORS.C);
    slide.addShape("rect", {
      x: 1.12,
      y: 3.0,
      w: 6.78,
      h: 1.24,
      fill: { color: COLORS.tealSoft },
      line: { color: COLORS.tealSoft, width: 0 },
      radius: 0.08,
    });
    slide.addText(
      "Market-clearing condition: D_m(p_m, xi; M) = S_m(p_m, xi; w)",
      {
        x: 1.46,
        y: 3.42,
        w: 6.08,
        h: 0.24,
        fontFace: FONT_MONO,
        fontSize: 16.2,
        bold: true,
        color: COLORS.teal,
        align: "center",
        margin: 0,
      },
    );
    addCard(slide, 8.08, 1.86, 0.92, 3.92, "GE", "", {
      accent: COLORS.dark,
      fill: COLORS.white,
      titleSize: 12.6,
    });
    addBulletList(
      slide,
      [
        "producer profits",
        "outsourcing demand",
        "entry composition",
        "innovation and welfare",
      ],
      8.18,
      2.36,
      0.7,
      { fontSize: 10.4, gap: 0.08 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Model",
      "State Transitions, Stationary Equilibrium, and Welfare",
      "鍑€绂忓埄鏄鏁堝簲涓庤礋鏁堝簲姣旇緝鍚庣殑鏉′欢鎬х粨璁?,
    );
    addPill(slide, 0.96, 2.14, 1.12, 0.42, "entry", TYPE_COLORS.E);
    addArrowText(slide, "鈫?, 2.14, 2.2, 0.24, 0.2, 18);
    addPill(slide, 2.54, 1.72, 1.0, 0.42, "A", TYPE_COLORS.A);
    addPill(slide, 2.54, 2.52, 1.0, 0.42, "B", TYPE_COLORS.B);
    addPill(slide, 2.54, 3.32, 1.0, 0.42, "C", TYPE_COLORS.C);
    addArrowText(slide, "鈫?, 3.84, 2.44, 0.24, 0.3, 18);
    addArrowText(slide, "鈫?, 3.84, 3.24, 0.24, 0.3, 18);
    addArrowText(slide, "鈫?, 4.34, 2.98, 0.24, 0.2, 18);
    addPill(slide, 4.82, 2.86, 1.2, 0.44, "stationary dist.", COLORS.rust);
    addArrowText(slide, "鈫?, 6.16, 2.98, 0.24, 0.2, 18);
    addPill(slide, 6.62, 2.86, 1.18, 0.44, "welfare", COLORS.teal);
    addCard(slide, 7.98, 1.64, 1.0, 4.28, "+ / -", "", {
      accent: COLORS.olive,
      fill: COLORS.white,
      titleSize: 12.4,
    });
    addBulletList(
      slide,
      [
        "+ innovation gain",
        "+ reallocation gain",
        "- producer loss",
        "- adjustment cost",
      ],
      8.08,
      2.18,
      0.8,
      { fontSize: 10.6, gap: 0.08 },
    );
    slide.addShape("rect", {
      x: 0.96,
      y: 5.92,
      w: 6.84,
      h: 0.28,
      fill: { color: COLORS.rustSoft },
      line: { color: COLORS.rustSoft, width: 0 },
      radius: 0.04,
    });
    slide.addText(
      "Main message: welfare is not automatically positive; it depends on whether innovation and reallocation gains dominate producer-side losses and reorganization costs.",
      {
        x: 1.12,
        y: 6.0,
        w: 6.52,
        h: 0.12,
        fontFace: FONT_BODY,
        fontSize: 10.8,
        color: COLORS.rust,
        bold: true,
        align: "center",
        margin: 0,
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Empirics",
      "Empirical Design",
      "浜嬪疄鍏堣锛氬厛鎶?reduced-form銆乼ransition 鍜?reorganization 鍋氭墡瀹?,
    );
    addCard(
      slide,
      0.82,
      1.56,
      8.12,
      0.74,
      "褰撳墠鏈€浼樼粍鍚堜笉鏄厛鍐插畬鏁寸粨鏋勬ā鍨嬶紝鑰屾槸锛欴ID / event study + transition matrices + commercialization 璇佹嵁 + 涓瓑澶嶆潅搴﹁涓氭ā鍨嬨€?,
      "",
      { accent: COLORS.teal, fill: COLORS.tealSoft, titleSize: 14.2 },
    );
    addImageWithFrame(
      slide,
      ASSET("image7.png"),
      0.86,
      2.56,
      3.84,
      2.86,
      "鍖哄煙灞傞潰妯″瀷璁惧畾锛堝師 deck 鎴浘锛?,
    );
    addImageWithFrame(
      slide,
      ASSET("image8.png"),
      5.04,
      2.56,
      3.84,
      2.86,
      "浼佷笟灞傞潰妯″瀷璁惧畾锛堝師 deck 鎴浘锛?,
    );
    slide.addText(
      "鍖哄煙灞傞潰锛氱湅 MAH 瀵瑰垱鏂版暟閲忋€佺粨鏋勩€佽川閲忥紝浠ュ強涓庡彂灞曢樁娈靛尮閰嶅害鐨勪氦浜掓晥搴斻€?,
      {
        x: 0.98,
        y: 5.58,
        w: 3.58,
        h: 0.34,
        fontFace: FONT_BODY,
        fontSize: 11.6,
        color: COLORS.ink,
        margin: 0,
        align: "center",
      },
    );
    slide.addText(
      "浼佷笟灞傞潰锛氱湅 MAH 鏄惁閫氳繃浼佷笟鍒嗗寲鍜?rd-type 浼佷笟鎵╁紶鏉ユ帹鍔ㄥ垱鏂般€?,
      {
        x: 5.18,
        y: 5.58,
        w: 3.54,
        h: 0.34,
        fontFace: FONT_BODY,
        fontSize: 11.6,
        color: COLORS.ink,
        margin: 0,
        align: "center",
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Empirics",
      "What the Current Reduced-Form Evidence Already Says",
      "淇濈暀 old deck 鐨勭粨璁猴紝浣嗘妸瀹冧滑鏀惧埌 reorganization 涔嬪悗鏉ヨ",
    );
    addCard(
      slide,
      0.82,
      1.74,
      3.78,
      1.18,
      "H1: MAH raises innovation",
      "鍖哄煙涓庝紒涓氬眰闈㈢殑鍥炲綊閮芥敮鎸?MAH 瀵瑰垱鏂版暟閲忋€佺粨鏋勫拰璐ㄩ噺鍏锋湁姝ｅ悜浣滅敤銆?,
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.2 },
    );
    addCard(
      slide,
      0.82,
      3.06,
      3.78,
      1.18,
      "H2: effects are stronger where development and industry base fit",
      "鏀跨瓥璇曠偣涓庢洿楂樺彂灞曢樁娈点€佹洿寮轰骇涓氬熀纭€鐨勫湴鍖哄尮閰嶆椂锛屽垱鏂版晥搴旀洿鏄捐憲銆?,
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 12.8 },
    );
    addCard(
      slide,
      0.82,
      4.38,
      3.78,
      1.18,
      "H3: firm differentiation is the mechanism margin",
      "鍒涙柊鎻愬崌骞堕潪鍧囧寑鍙戠敓锛岃€屾槸鏇村彲鑳介€氳繃 rd-type 浼佷笟涓庣粍缁囬噸鏋勪紶瀵煎嚭鏉ャ€?,
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 12.8 },
    );
    addImageWithFrame(
      slide,
      ASSET("image4.png"),
      5.04,
      1.86,
      3.78,
      3.94,
      "鍘?deck 涓叧浜庡彂灞曢樁娈靛尮閰嶇殑鍥惧舰璇佹嵁",
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Empirics",
      "Dynamic Evidence: Event-Study Style Validation",
      "杩欎袱寮犲浘閫傚悎鏀惧湪 transition / innovation dynamics 涔嬪悗",
    );
    addBulletList(
      slide,
      [
        "鐩爣涓嶆槸璁╂墍鏈夌郴鏁伴兘鏄捐憲锛岃€屾槸楠岃瘉鍔ㄦ€佽矾寰勪笌鏀跨瓥鏃剁偣瀵归綈銆?,
        "濡傛灉鏈潵鍔犲叆 state-transition event study锛岃繖涓€椤靛氨鑳藉拰缁勭粐閲嶆瀯璇佹嵁骞舵帓鍑虹幇銆?,
      ],
      0.88,
      1.58,
      8.0,
      { fontSize: 12.8, gap: 0.06 },
    );
    addImageWithFrame(
      slide,
      ASSET("image9.png"),
      0.9,
      2.36,
      3.96,
      3.5,
      "浜嬩欢鐮旂┒鍥?1锛堝師 deck锛?,
    );
    addImageWithFrame(
      slide,
      ASSET("image10.png"),
      5.06,
      2.36,
      3.96,
      3.5,
      "浜嬩欢鐮旂┒鍥?2锛堝師 deck锛?,
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Empirics",
      "Robustness Checks",
      "鎶?placebo 涓庡垎甯冨紡绋冲仴鎬ф斁鍦ㄤ富缁撴灉鍚庨潰鍗冲彲",
    );
    addImageWithFrame(
      slide,
      ASSET("image11.jpeg"),
      0.9,
      1.96,
      3.96,
      3.5,
      "Kernel density estimate / DID distribution",
    );
    addImageWithFrame(
      slide,
      ASSET("image12.jpeg"),
      5.06,
      1.96,
      3.96,
      3.5,
      "Placebo test",
    );
    slide.addShape("rect", {
      x: 1.18,
      y: 5.72,
      w: 7.56,
      h: 0.5,
      fill: { color: COLORS.tealSoft },
      line: { color: COLORS.tealSoft, width: 0 },
      radius: 0.05,
    });
    slide.addText(
      "杩欎簺鍥捐瘉鏄庯細鐜版湁 reduced-form 缁撴灉骞朵笉鏄畬鍏ㄧ敱鍋剁劧鍒嗗竷鎴栨満姊板櫔闊抽┍鍔ㄣ€傛柊 deck 鍙渶瑕佹妸瀹冧滑鏀惧湪鏇撮潬鍚庣殑鈥滈獙璇佲€濅綅缃€?,
      {
        x: 1.34,
        y: 5.88,
        w: 7.24,
        h: 0.16,
        fontFace: FONT_BODY,
        fontSize: 11.6,
        color: COLORS.teal,
        bold: true,
        align: "center",
        margin: 0,
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Discussion",
      "Welfare and GE Interpretation",
      "鎶婃斂绛栫粨璁轰粠鈥滃垱鏂版洿澶氣€濇敼鍐欐垚鈥滃噣鏁堝簲鍙栧喅浜庝袱绫诲姏閲忕殑姣旇緝鈥?,
    );
    addCard(
      slide,
      0.86,
      1.82,
      1.92,
      1.48,
      "Dynamic innovation gain",
      "鍘熺爺鑽?idea 鏇村鏄撹鍟嗕笟鍖栵紝闀挎湡鍒涙柊婵€鍔辨洿寮恒€?,
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 12.2 },
    );
    addCard(
      slide,
      3.0,
      1.82,
      1.92,
      1.48,
      "Resource reallocation gain",
      "RD 涓?manufacturing 鐨勪笓涓氬寲鍒嗗伐鎻愰珮浜嗚祫婧愰厤缃晥鐜囥€?,
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 12.2 },
    );
    addCard(
      slide,
      5.14,
      1.82,
      1.92,
      1.48,
      "Producer-side loss",
      "浼犵粺 integrated producer 鐨勫埄娑︿笌绉熼噾鍙兘鍙楀埌鎸ゅ帇銆?,
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 12.2 },
    );
    addCard(
      slide,
      7.28,
      1.82,
      1.46,
      1.48,
      "Adjustment cost",
      "缁勭粐杈圭晫閲嶆瀯鏈韩鏈夊浐瀹氭垚鏈€?,
      { accent: COLORS.dark, fill: COLORS.white, bodySize: 12.2 },
    );
    slide.addShape("rect", {
      x: 1.18,
      y: 3.82,
      w: 7.34,
      h: 1.22,
      fill: { color: COLORS.rustSoft },
      line: { color: COLORS.rustSoft, width: 0 },
      radius: 0.1,
    });
    slide.addText(
      "鍥犳锛孧AH 鐨?welfare 缁撹搴斿綋鍐欐垚鏉′欢鎬х殑锛歕n濡傛灉鍒涙柊涓庨噸閰嶇疆甯︽潵鐨勬敹鐩婂ぇ浜庣敓浜ц€呭埄娑︽崯澶卞拰缁勭粐璋冩暣鎴愭湰锛屽噣绂忓埄涓烘锛涘弽涔嬪垯鏈繀銆?,
      {
        x: 1.5,
        y: 4.16,
        w: 6.74,
        h: 0.52,
        fontFace: FONT_BODY,
        fontSize: 16,
        bold: true,
        color: COLORS.rust,
        align: "center",
        margin: 0,
      },
    );
    addBulletList(
      slide,
      [
        "杩欎篃瑙ｉ噴浜嗕负浠€涔?producer-side response 涓?contract manufacturing evidence 寰堥噸瑕併€?,
        "GE 瑙嗚涓嶆槸鎶婃ā鍨嬪仛澶э紝鑰屾槸鎶婃斂绛栧奖鍝嶇殑鍙楃泭鏂逛笌鍙楁崯鏂瑰悓鏃剁撼鍏ヨВ閲娿€?,
      ],
      1.18,
      5.42,
      7.4,
      { fontSize: 12.8, gap: 0.06 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Conclusion",
      "Main Mechanism and Contribution",
      "涓€鍙ヨ瘽鎬荤粨锛歁AH 鏀瑰彉鐨勪笉鍙槸鍒涙柊婵€鍔憋紝鑰屾槸鍒涙柊鐨勭粍缁囨柟寮?,
    );
    slide.addShape("rect", {
      x: 0.92,
      y: 1.58,
      w: 8.0,
      h: 0.88,
      fill: { color: COLORS.tealSoft },
      line: { color: COLORS.tealSoft, width: 0 },
      radius: 0.08,
    });
    slide.addText(
      "MAH changes not only innovation incentives, but also the organization of innovation.",
      {
        x: 1.18,
        y: 1.88,
        w: 7.48,
        h: 0.24,
        fontFace: FONT_HEAD,
        fontSize: 18,
        bold: true,
        color: COLORS.teal,
        align: "center",
        margin: 0,
      },
    );
    addCard(
      slide,
      0.92,
      2.9,
      2.42,
      2.56,
      "Fact contribution",
      "鎶?reorganization銆乪ntry composition銆乮nnovation reallocation 鏀惧埌鍚屼竴鏉＄粡楠岃瘉鎹摼閲屻€?,
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.4 },
    );
    addCard(
      slide,
      3.6,
      2.9,
      2.42,
      2.56,
      "Theory contribution",
      "鎶?A/B/C 缁勭粐鐘舵€併€乮mplementation 閫夋嫨涓庡鎵樼敓浜у競鍦哄祵鍒颁竴涓腑绛夊鏉傚害 GE 妗嗘灦閲屻€?,
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 13.4 },
    );
    addCard(
      slide,
      6.28,
      2.9,
      2.42,
      2.56,
      "Policy contribution",
      "鎶?MAH 瑙ｉ噴鎴愰€傚疁褰撳墠鍙戝睍闃舵鐨勫埗搴︿緵缁欙紝鑰屼笉鏄绔嬬殑瀹℃壒渚垮埄鍖栧伐鍏枫€?,
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 13.4 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Conclusion",
      "Next Steps",
      "鎶婃柊 deck 鍙樻垚瀹屾暣璁烘枃涓荤嚎鐨勬渶鐭矾寰?,
    );
    addCard(
      slide,
      0.92,
      1.82,
      1.84,
      2.8,
      "1. Lock the type rules",
      "鍥哄畾 four-way classification 瑙勫垯锛屽苟纭繚 pre / post 浣跨敤瀹屽叏鐩稿悓鐨勫垽瀹氭爣鍑嗐€?,
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 12.6 },
    );
    addCard(
      slide,
      2.98,
      1.82,
      1.84,
      2.8,
      "2. Build the transition panel",
      "鍏堝仛 pre / post transition matrices锛屽啀鎶?entry 浠?switching 閲屾媶鍑烘潵銆?,
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 12.6 },
    );
    addCard(
      slide,
      5.04,
      1.82,
      1.84,
      2.8,
      "3. Add commercialization evidence",
      "琛ュ鎵樼敓浜с€佹寔璇併€丆MO / CDMO 涓庣敓浜т晶缁忚惀鍝嶅簲鐨勬枃鏈垨璐㈠姟璇佹嵁銆?,
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 12.6 },
    );
    addCard(
      slide,
      7.1,
      1.82,
      1.84,
      2.8,
      "4. Finalize the model",
      "鍙湁鍦?reorganization 浜嬪疄娓呮鍚庯紝鍐嶆妸 formal model 瀹氱锛岄伩鍏嶆ā鍨嬪ぇ浜庝簨瀹炪€?,
      { accent: COLORS.dark, fill: COLORS.white, bodySize: 12.6 },
    );
    slide.addShape("rect", {
      x: 1.08,
      y: 5.18,
      w: 7.68,
      h: 0.92,
      fill: { color: COLORS.rustSoft },
      line: { color: COLORS.rustSoft, width: 0 },
      radius: 0.08,
    });
    slide.addText(
      "璋㈣阿锛乗n杩欑増 deck 宸茬粡鎶?old PPT 鐨勮儗鏅€佸綋鍓嶇粨鏋滃拰鏂扮殑 firm-transition / GE 鍙欎簨鎺ュ埌浜嗕竴璧枫€?,
      {
        x: 1.3,
        y: 5.42,
        w: 7.24,
        h: 0.42,
        fontFace: FONT_HEAD,
        fontSize: 17,
        bold: true,
        color: COLORS.rust,
        align: "center",
        margin: 0,
      },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }
}

async function main() {
  buildSlides();
  await pptx.writeFile({ fileName: OUTPUT });
  console.log(`Wrote ${OUTPUT}`);
}

main().catch((error) => {
  console.error(error);
  Deno.exit(1);
});

