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
pptx.subject = "MAH制度、企业重组与医药创新";
pptx.title = "制度改革与医药创新：基于MAH制度的分析";
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
const OUTPUT = "./8.制度改革与医药创新_1015_pptxgenjs_restructured.pptx";

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
  slide.addText("制度改革与医药创新", {
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
      slide.addText(highlighted ? "重点方向" : "待更新", {
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
  slide.addText("制度改革与医药创新", {
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
  slide.addText("基于 MAH 制度的分析", {
    x: 0.6,
    y: 1.9,
    w: 2.08,
    h: 0.34,
    fontFace: FONT_BODY,
    fontSize: 15.5,
    color: "D8E8E8",
    margin: 0,
  });
  slide.addText("从审批提速走向组织重构、状态转移与行业均衡", {
    x: 0.6,
    y: 2.38,
    w: 2.16,
    h: 0.48,
    fontFace: FONT_BODY,
    fontSize: 12.8,
    color: "DCE6EA",
    margin: 0,
  });
  slide.addText("王勇    杨晨丹妮    陈思明", {
    x: 0.6,
    y: 5.45,
    w: 2.18,
    h: 0.2,
    fontFace: FONT_BODY,
    fontSize: 11.2,
    color: COLORS.white,
    margin: 0,
  });
  slide.addText("北京大学新结构经济学研究院", {
    x: 0.6,
    y: 5.73,
    w: 2.28,
    h: 0.18,
    fontFace: FONT_BODY,
    fontSize: 10.2,
    color: "DCE6EA",
    margin: 0,
  });
  slide.addText("二〇二四年十月十五日", {
    x: 0.6,
    y: 6.05,
    w: 2.0,
    h: 0.18,
    fontFace: FONT_BODY,
    fontSize: 10.2,
    color: "DCE6EA",
    margin: 0,
  });
  slide.addText("这次重构把旧 deck 的核心背景保留下来，但把主线改成：", {
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
    "1. MAH 不只影响审批速度",
    "它改变了谁能持证、谁能外包、谁能在不自建产能的情况下商业化原研药。",
    { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.2 },
  );
  addCard(
    slide,
    3.9,
    2.58,
    5.18,
    1.05,
    "2. 重点从“企业分化”推进到“企业状态转移”",
    "真正要展示的是 A/B/C 类型之间如何进入、切换、退出，以及 entry composition 如何改变。",
    { accent: COLORS.rust, fill: COLORS.white, bodySize: 13.2 },
  );
  addCard(
    slide,
    3.9,
    3.84,
    5.18,
    1.05,
    "3. 结论从 PE 创新效应扩展到 GE / welfare",
    "创新增益、委托生产需求、生产者利润与净福利一起进入行业均衡的解释框架。",
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
      "医药升级、强监管行业与制度供给的匹配问题",
    );
    addTag(slide, "十四五 / 医药健康", 0.62, 1.34, 1.45, COLORS.tealSoft);
    slide.addText(
      "“十四五”把医药健康列为生物经济重点领域，问题不只是多审快审，而是制度能否匹配产业升级。",
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
      "产业升级压力",
      "中国医药产业正经历“仿制药 -> 创新药”“生产导向 -> 研发导向”的升级，创新能否稳定转化成为核心约束。",
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13 },
    );
    addCard(
      slide,
      3.42,
      2.15,
      2.62,
      2.56,
      "强监管并非背景噪音",
      "药品审评、持证资格、委托生产规则会直接影响谁能进入、谁能保有创新回报、谁有动力投资原研药。",
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 13 },
    );
    addCard(
      slide,
      6.22,
      2.15,
      2.62,
      2.56,
      "真正的问题",
      "在当前发展阶段，MAH 是否是一项更适宜的制度安排，并通过组织重构而不仅是审批提速来促进创新？",
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
      "核心直觉：制度改革如果改变的是商业化摩擦与组织边界，那么最先出现的事实不应只是“创新更多”，而应是“谁在创新、谁在生产、谁在转型”发生变化。",
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
      "从审批/区域创新故事推进到 firm boundaries 与行业均衡",
    );
    addCard(slide, 0.7, 1.46, 3.95, 4.66, "已有文献更像在问什么？", "", {
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
      "这篇文章的新问题是什么？",
      "",
      { accent: COLORS.teal, fill: COLORS.white, line: COLORS.line },
    );
    addBulletList(
      slide,
      [
        "政策是否缩短审评时长、改善创新环境？",
        "区域或企业层面的创新申请是否增加？",
        "机制更多停留在审批、市场准入、企业性质等维度。",
        "解释通常是 partial equilibrium：政策冲击 -> 创新结果。",
      ],
      0.92,
      2.05,
      3.42,
      { fontSize: 13.2, color: COLORS.muted, gap: 0.07 },
    );
    addBulletList(
      slide,
      [
        "MAH 是否改变了研发所有权与生产能力之间的制度边界？",
        "企业是否在 integrated / RD / production 之间发生重组与状态转移？",
        "创新增量来自 entrant composition、incumbent switching，还是两者共同作用？",
        "GE 层面上，委托生产需求、生产者利润与净福利如何被重新分配？",
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
    slide.addText("旧主线：审批 / 创新", {
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
    slide.addText("新主线：边界 / 重组 / GE", {
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
      "旧 deck 中最值得保留的事实基础",
    );
    addImageWithFrame(
      slide,
      ASSET("image3.png"),
      0.74,
      1.52,
      4.46,
      4.36,
      "原 deck 的药品注册申请趋势图",
    );
    slide.addText("从 2007 到 2023，医药创新活动与监管改革同步推进。", {
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
        "产业升级方向已经从化学仿制药逐步走向创新药与生物药。",
        "2015 年后的药品审评审批改革，使 MAH 成为最关键的制度节点之一。",
        "因此需要把“创新数量上升”与“组织边界改变”放在同一张图里理解。",
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
      "新叙事要做的不是替换背景",
      "而是在这一背景之上，把故事从“改革促进创新”推进到“改革重写了谁能创新、谁能生产、谁能存活”。",
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 12.6 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Institution",
      "Pre-MAH Bundled Regime",
      "持证资格与生产能力捆绑，创新所有权难以独立保留",
    );
    addPill(slide, 1.0, 2.04, 1.8, 0.5, "研发机构 / 实验室", TYPE_COLORS.B);
    addArrowText(slide, "→", 2.98, 2.14);
    addPill(slide, 3.46, 2.04, 1.55, 0.5, "成果转让", COLORS.rust);
    addArrowText(slide, "→", 5.2, 2.14);
    addPill(
      slide,
      5.68,
      1.92,
      2.02,
      0.74,
      "生产企业\n(持证 + 生产)",
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
      "制度约束：若想获得最终市场回报，研发主体通常需要把成果转给具备生产资质的一体化企业，或者自己承担建厂与资质成本。",
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
      "含义",
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
        "创新所有权与产能绑定。",
        "商业化门槛高。",
        "Integrated incumbents 更占优。",
        "委托生产市场不发达。",
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
      "MAH 允许研发主体持证，生产可以外包给专业制造企业",
    );
    addPill(
      slide,
      0.92,
      1.96,
      2.04,
      0.72,
      "MAH 持证主体\n(研发机构 / 企业)",
      TYPE_COLORS.B,
    );
    addArrowText(slide, "→", 3.12, 2.15, 0.3, 0.22, 20);
    addPill(slide, 3.48, 2.04, 1.88, 0.56, "保留所有权 / 持证", TYPE_COLORS.A);
    addArrowText(slide, "→", 5.56, 2.15, 0.3, 0.22, 20);
    addPill(
      slide,
      5.92,
      1.96,
      2.18,
      0.72,
      "委托生产企业\n(CMO / CDMO)",
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
      "制度含义：原研药 idea 的商业化价值不再必须通过自建产能才能实现，MAH 把“持证”和“生产”拆开，委托制造开始有了市场。",
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
    addCard(slide, 8.36, 1.64, 0.92, 4.18, "变化", "", {
      accent: COLORS.rust,
      fill: COLORS.white,
      titleSize: 12.8,
    });
    addBulletList(
      slide,
      ["RD 保持持证", "生产专业化", "外包需求上升", "进入门槛下降"],
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
      "这是一张桥接 slide：把 old story 接到 new story 上",
    );
    addPill(slide, 4.26, 1.64, 1.38, 0.46, "A: integrated", TYPE_COLORS.A);
    addPill(slide, 1.48, 3.02, 1.46, 0.46, "B: RD type", TYPE_COLORS.B);
    addPill(slide, 7.02, 3.02, 1.62, 0.46, "C: production", TYPE_COLORS.C);
    addPill(slide, 4.18, 4.78, 1.54, 0.46, "E: entrants", TYPE_COLORS.E);
    addArrowText(slide, "↙", 3.48, 2.34, 0.26, 0.24, 18);
    addArrowText(slide, "↘", 6.1, 2.34, 0.26, 0.24, 18);
    addArrowText(slide, "↗", 3.4, 4.16, 0.26, 0.24, 18);
    addArrowText(slide, "↖", 6.16, 4.16, 0.26, 0.24, 18);
    slide.addText("A → B", {
      x: 2.86,
      y: 2.72,
      w: 0.6,
      h: 0.14,
      fontFace: FONT_BODY,
      fontSize: 9.8,
      color: COLORS.rust,
      margin: 0,
    });
    slide.addText("A → C", {
      x: 6.18,
      y: 2.72,
      w: 0.6,
      h: 0.14,
      fontFace: FONT_BODY,
      fontSize: 9.8,
      color: COLORS.rust,
      margin: 0,
    });
    slide.addText("B → A", {
      x: 2.84,
      y: 3.78,
      w: 0.6,
      h: 0.14,
      fontFace: FONT_BODY,
      fontSize: 9.8,
      color: COLORS.rust,
      margin: 0,
    });
    slide.addText("C → A", {
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
      "MAH 的机制不是让企业“自动更创新”，而是先降低商业化摩擦和重组门槛，再诱导 entry、switching、outsourcing 与 survival 一起变化。",
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
      "把 current four-way classification 翻译成理论状态",
    );
    const x = 0.82;
    const y = 1.7;
    const widths = [1.35, 2.1, 1.8, 2.95];
    const headers = ["经验分类", "含义", "理论映射", "在新 deck 里的作用"];
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
      ["rd", "研发人员占优", "B", "最接近 theory 中的研发专门化企业"],
      ["prod", "生产人员占优", "C", "承接 outsourcing demand 的生产侧"],
      ["mix", "研发与生产同时显著", "A", "经验上的 integrated type"],
      [
        "transition",
        "短期重组状态",
        "过渡状态",
        "保留在实证里，但不作为长期理论类型",
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
      "关键处理：把 empirical mix 解释为 integrated A，把 transition 解释为短期组织重构的观测状态。这样理论和实证就能对上。",
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
      "先看 rd / prod / mix / transition 的占比路径，再看哪些变化是在 2016 以后加速的。",
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.1 },
    );
    addCard(
      slide,
      5.0,
      1.68,
      3.88,
      1.54,
      "2. Transition matrices",
      "重点不是把所有数字都做满，而是盯住 mix→rd、mix→prod、prod→mix、rd→mix 以及各类型 exit。",
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 13.1 },
    );
    addCard(
      slide,
      0.84,
      3.54,
      3.88,
      1.54,
      "3. Entry composition",
      "把 entry→rd/prod/mix/transition 单独拿出来；不要和 incumbent switching 混在一起解释。",
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 13.1 },
    );
    addCard(
      slide,
      5.0,
      3.54,
      3.88,
      1.54,
      "4. Innovation reallocation",
      "把创新数量、创新质量和创新份额按类型拆开，看增量来自“更多 rd firms”还是“rd 内部更强”。",
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
      "只有把这四层事实串起来，MAH 的机制故事才会从“创新回归”变成“行业组织重构”。",
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
      "基线矩阵先看稳定性、退出与 within-regime transitions",
    );
    addMatrixSkeleton(
      slide,
      0.9,
      1.88,
      5.92,
      3.42,
      "Pre-policy row-share matrix",
    );
    addCard(slide, 7.08, 1.86, 1.88, 3.62, "操作规则", "", {
      accent: COLORS.rust,
      fill: COLORS.white,
      titleSize: 12.8,
    });
    addBulletList(
      slide,
      [
        "推荐 origin years = 2011-2014。",
        "不要让 2015→2016 跨制度阶段污染 pre matrix。",
        "先做 counts，再做 row shares。",
        "这一页最重要的是读对角线与 exit。",
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
      "这一页目前放的是模板结构，等 firm-year panel 固定后直接回填真实 row shares。",
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
      "重点不在“全部都变”，而在关键方向的概率是否上升",
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
    addCard(slide, 7.08, 1.86, 1.88, 3.62, "读法", "", {
      accent: COLORS.teal,
      fill: COLORS.white,
      titleSize: 12.8,
    });
    addBulletList(
      slide,
      [
        "origin years = 2016-2022。",
        "先做 post，再拆 pilot / national。",
        "比较关键 off-diagonal row shares。",
        "低频转型时再做 hazard / cumulative。",
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
      "如果政策后只是“创新更多”但组织方向不变，GE 叙事就站不住；所以关键是把这页做成机制证据而不是装饰。",
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
      "这两条边际在经济学上完全不同",
    );
    addCard(slide, 0.82, 1.76, 3.7, 3.76, "Entry margin", "", {
      accent: COLORS.olive,
      fill: COLORS.white,
    });
    addPill(slide, 1.32, 2.72, 1.28, 0.42, "entry", TYPE_COLORS.E);
    addArrowText(slide, "→", 2.78, 2.8, 0.22, 0.2, 18);
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
      "问题：政策后新进入者是否更偏向 rd / biotech / 原研药导向？",
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
    addArrowText(slide, "↙", 6.1, 2.84, 0.2, 0.2, 18);
    addArrowText(slide, "↘", 7.52, 2.84, 0.2, 0.2, 18);
    addArrowText(slide, "↗", 6.1, 4.1, 0.2, 0.2, 18);
    addArrowText(slide, "↖", 7.52, 4.1, 0.2, 0.2, 18);
    slide.addText("问题：现有企业是否因为 MAH 更容易专业化、重新整合或退出？", {
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
      "旧 deck 里已有一张很有用的不同类型企业数量变化趋势图",
    );
    addImageWithFrame(
      slide,
      ASSET("image5.jpeg"),
      0.82,
      1.66,
      4.58,
      4.52,
      "原 deck 的不同类型企业数量变化趋势",
    );
    addCard(
      slide,
      5.72,
      1.7,
      3.04,
      1.18,
      "What we can already say",
      "这张图至少表明“企业分化”并不是抽象概念，而是 deck 中已经出现的描述性事实。",
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.1 },
    );
    addBulletList(
      slide,
      [
        "下一步要把数量趋势升级成 type shares over time。",
        "再把创新按类型拆开，看增量究竟来自谁。",
        "之后再放 transition matrix 与 entry composition，整条事实链就能闭合。",
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
      "弱整合的新结构经济学版本：development stage + organizational choice",
    );
    addCard(
      slide,
      0.84,
      1.76,
      2.34,
      1.86,
      "State variables",
      "企业能力 z\n发展阶段 xi\n制度变量 M ∈ {0,1}",
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
    addArrowText(slide, "↓", 1.88, 3.86, 0.24, 0.18, 22);
    addArrowText(slide, "↓", 4.44, 3.86, 0.24, 0.18, 22);
    addArrowText(slide, "↓", 7.28, 3.86, 0.24, 0.18, 22);
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
      "逻辑链： 发展阶段与制度适配 -> 商业化摩擦下降 / 重组门槛下降 -> A/B/C 之间的进入、切换与退出 -> 创新与行业均衡重排",
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
      "把模型收成 JDE-friendly 的中等复杂度版本",
    );
    const steps = [
      ["1. Entry", "潜在进入者 E 决定是否以 B / C 进入。"],
      ["2. Idea & implementation", "B 产生 idea，并决定外包给 C 还是转回 A。"],
      ["3. Switching", "A/B/C 在组织边界之间做离散调整。"],
      [
        "4. Exit / stationary equilibrium",
        "存活、退出与分布共同决定行业稳态。",
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
        addArrowText(slide, "→", x + 1.98, 3.38, 0.18, 0.2, 16);
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
      "这四块已经足够：三类企业 + implementation 选择 + 状态转移 + 委托生产市场清算。没有必要再把融资合同或复杂并购结构塞进主模型。",
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
      "把“适宜制度安排”写成 commercialization friction 与 switching cost 的下降",
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
        "MAH 降低 B 型企业把原研药 idea 商业化的制度摩擦 tau。",
        "MAH 也降低 A/B/C 之间离散重组的门槛 kappa_sj。",
        "发展阶段越高、企业能力越强，这两个渠道的政策效应越大。",
        "这就是“有为政府 + 有效市场”进入模型的地方。",
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
      "B 的商业化选择与 C 的受托生产能力在行业内部清算",
    );
    addPill(slide, 1.04, 2.12, 1.62, 0.5, "B: generate ideas", TYPE_COLORS.B);
    addArrowText(slide, "→", 2.8, 2.22);
    addPill(slide, 3.26, 2.12, 2.0, 0.5, "implementation choice", COLORS.rust);
    addArrowText(slide, "→", 5.48, 2.22);
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
      "净福利是正效应与负效应比较后的条件性结论",
    );
    addPill(slide, 0.96, 2.14, 1.12, 0.42, "entry", TYPE_COLORS.E);
    addArrowText(slide, "→", 2.14, 2.2, 0.24, 0.2, 18);
    addPill(slide, 2.54, 1.72, 1.0, 0.42, "A", TYPE_COLORS.A);
    addPill(slide, 2.54, 2.52, 1.0, 0.42, "B", TYPE_COLORS.B);
    addPill(slide, 2.54, 3.32, 1.0, 0.42, "C", TYPE_COLORS.C);
    addArrowText(slide, "↕", 3.84, 2.44, 0.24, 0.3, 18);
    addArrowText(slide, "↕", 3.84, 3.24, 0.24, 0.3, 18);
    addArrowText(slide, "→", 4.34, 2.98, 0.24, 0.2, 18);
    addPill(slide, 4.82, 2.86, 1.2, 0.44, "stationary dist.", COLORS.rust);
    addArrowText(slide, "→", 6.16, 2.98, 0.24, 0.2, 18);
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
      "事实先行：先把 reduced-form、transition 和 reorganization 做扎实",
    );
    addCard(
      slide,
      0.82,
      1.56,
      8.12,
      0.74,
      "当前最优组合不是先冲完整结构模型，而是：DID / event study + transition matrices + commercialization 证据 + 中等复杂度行业模型。",
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
      "区域层面模型设定（原 deck 截图）",
    );
    addImageWithFrame(
      slide,
      ASSET("image8.png"),
      5.04,
      2.56,
      3.84,
      2.86,
      "企业层面模型设定（原 deck 截图）",
    );
    slide.addText(
      "区域层面：看 MAH 对创新数量、结构、质量，以及与发展阶段匹配度的交互效应。",
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
      "企业层面：看 MAH 是否通过企业分化和 rd-type 企业扩张来推动创新。",
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
      "保留 old deck 的结论，但把它们放到 reorganization 之后来讲",
    );
    addCard(
      slide,
      0.82,
      1.74,
      3.78,
      1.18,
      "H1: MAH raises innovation",
      "区域与企业层面的回归都支持 MAH 对创新数量、结构和质量具有正向作用。",
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.2 },
    );
    addCard(
      slide,
      0.82,
      3.06,
      3.78,
      1.18,
      "H2: effects are stronger where development and industry base fit",
      "政策试点与更高发展阶段、更强产业基础的地区匹配时，创新效应更显著。",
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 12.8 },
    );
    addCard(
      slide,
      0.82,
      4.38,
      3.78,
      1.18,
      "H3: firm differentiation is the mechanism margin",
      "创新提升并非均匀发生，而是更可能通过 rd-type 企业与组织重构传导出来。",
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 12.8 },
    );
    addImageWithFrame(
      slide,
      ASSET("image4.png"),
      5.04,
      1.86,
      3.78,
      3.94,
      "原 deck 中关于发展阶段匹配的图形证据",
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Empirics",
      "Dynamic Evidence: Event-Study Style Validation",
      "这两张图适合放在 transition / innovation dynamics 之后",
    );
    addBulletList(
      slide,
      [
        "目标不是让所有系数都显著，而是验证动态路径与政策时点对齐。",
        "如果未来加入 state-transition event study，这一页就能和组织重构证据并排出现。",
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
      "事件研究图 1（原 deck）",
    );
    addImageWithFrame(
      slide,
      ASSET("image10.png"),
      5.06,
      2.36,
      3.96,
      3.5,
      "事件研究图 2（原 deck）",
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Empirics",
      "Robustness Checks",
      "把 placebo 与分布式稳健性放在主结果后面即可",
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
      "这些图证明：现有 reduced-form 结果并不是完全由偶然分布或机械噪音驱动。新 deck 只需要把它们放在更靠后的“验证”位置。",
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
      "把政策结论从“创新更多”改写成“净效应取决于两类力量的比较”",
    );
    addCard(
      slide,
      0.86,
      1.82,
      1.92,
      1.48,
      "Dynamic innovation gain",
      "原研药 idea 更容易被商业化，长期创新激励更强。",
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 12.2 },
    );
    addCard(
      slide,
      3.0,
      1.82,
      1.92,
      1.48,
      "Resource reallocation gain",
      "RD 与 manufacturing 的专业化分工提高了资源配置效率。",
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 12.2 },
    );
    addCard(
      slide,
      5.14,
      1.82,
      1.92,
      1.48,
      "Producer-side loss",
      "传统 integrated producer 的利润与租金可能受到挤压。",
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 12.2 },
    );
    addCard(
      slide,
      7.28,
      1.82,
      1.46,
      1.48,
      "Adjustment cost",
      "组织边界重构本身有固定成本。",
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
      "因此，MAH 的 welfare 结论应当写成条件性的：\n如果创新与重配置带来的收益大于生产者利润损失和组织调整成本，净福利为正；反之则未必。",
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
        "这也解释了为什么 producer-side response 与 contract manufacturing evidence 很重要。",
        "GE 视角不是把模型做大，而是把政策影响的受益方与受损方同时纳入解释。",
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
      "一句话总结：MAH 改变的不只是创新激励，而是创新的组织方式",
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
      "把 reorganization、entry composition、innovation reallocation 放到同一条经验证据链里。",
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 13.4 },
    );
    addCard(
      slide,
      3.6,
      2.9,
      2.42,
      2.56,
      "Theory contribution",
      "把 A/B/C 组织状态、implementation 选择与委托生产市场嵌到一个中等复杂度 GE 框架里。",
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 13.4 },
    );
    addCard(
      slide,
      6.28,
      2.9,
      2.42,
      2.56,
      "Policy contribution",
      "把 MAH 解释成适宜当前发展阶段的制度供给，而不是孤立的审批便利化工具。",
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 13.4 },
    );
    finalizeSlide(slide);
    if (slideCounter >= MAX_SLIDES) return;
  }

  {
    const slide = newSlide(
      "Conclusion",
      "Next Steps",
      "把新 deck 变成完整论文主线的最短路径",
    );
    addCard(
      slide,
      0.92,
      1.82,
      1.84,
      2.8,
      "1. Lock the type rules",
      "固定 four-way classification 规则，并确保 pre / post 使用完全相同的判定标准。",
      { accent: COLORS.teal, fill: COLORS.white, bodySize: 12.6 },
    );
    addCard(
      slide,
      2.98,
      1.82,
      1.84,
      2.8,
      "2. Build the transition panel",
      "先做 pre / post transition matrices，再把 entry 从 switching 里拆出来。",
      { accent: COLORS.rust, fill: COLORS.white, bodySize: 12.6 },
    );
    addCard(
      slide,
      5.04,
      1.82,
      1.84,
      2.8,
      "3. Add commercialization evidence",
      "补委托生产、持证、CMO / CDMO 与生产侧经营响应的文本或财务证据。",
      { accent: COLORS.olive, fill: COLORS.white, bodySize: 12.6 },
    );
    addCard(
      slide,
      7.1,
      1.82,
      1.84,
      2.8,
      "4. Finalize the model",
      "只有在 reorganization 事实清楚后，再把 formal model 定稿，避免模型大于事实。",
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
      "谢谢！\n这版 deck 已经把 old PPT 的背景、当前结果和新的 firm-transition / GE 叙事接到了一起。",
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
