# DANNI 项目说明

## 1. 项目简介

DANNI 是围绕中国医药行业 MAH（Marketing Authorization Holder）制度改革开展的经济学研究项目。当前研究重点是：MAH 改革是否通过改变原研药机会的商业化路线，提高原研药创新激励。

当前主轴已经调整为“路线选择 + 商业化摩擦”机制：

- 企业先选择原研药 R&D 强度。
- 成功机会出现后，企业在内部生产、MAH 式委托生产、转让/许可/出售、放弃之间选择商业化路线。
- MAH 进入模型的方式不是直接提高科学发现效率，也不是直接降低临床试验成本，而是扩展可行商业化路线并降低保留上市许可且使用合格受托生产商时的商业化摩擦。

## 2. 当前主轴文件

截至 2026-05-19，当前论文主轴只指向以下文件：

| 文件 | 当前定位 | 使用规则 |
|---|---|---|
| `paper/manuscript/mah_route_indicator_friction_model.tex` | 当前主轴 TeX 文件 | 后续理论、识别、经验映射和论文写作的默认入口 |
| `paper/manuscript/mah_route_indicator_friction_refs.bib` | 当前主轴参考文献库 | 当前主轴 TeX 文件使用的 BibTeX 文件 |
| `paper/output/mah_route_indicator_friction_model.pdf` | 当前本地 PDF 产物 | 当前主轴文件的 PDF 输出位置 |

后续任何“主稿”“主文档”“当前论文”的表述，默认指向 `paper/manuscript/mah_route_indicator_friction_model.tex`，除非另有明确说明。

旧版 `main.tex`、`paper/src/` 内容、`paper/MAH_Policy/` 内容、旧生成稿和旧 PDF 输出不再作为当前主轴，只作为项目进展历史路径保留。

## 3. `paper/` 与 `output/` 目录规则

从 2026-05-19 起，`paper/` 和根目录 `output/` 的职责严格分开：

| 目录 | 定位 | 规则 |
|---|---|---|
| `paper/` | 当前论文生产区 | 当前主轴 TeX、BibTeX、论文图形、LaTeX 构建脚本和当前论文 PDF 都归入这里的子目录 |
| `output/` | 项目级对外交付区 | 只放明确要对外发送、提交或打包的项目级最终材料；不放当前论文的日常 LaTeX 编译产物 |
| `oldfiles/` | 历史归档区 | 旧主稿、旧输出、旧交付材料和旧工作目录统一归档到这里 |

判断规则：如果文件是“当前论文源码、论文 PDF、论文图形或 LaTeX 编译产生的东西”，放在 `paper/` 下；如果文件是“已经准备对外发送或提交的项目级交付包”，才放在根目录 `output/` 下；如果文件来自旧版本或旧工作流，放入 `oldfiles/`。

`paper/` 根目录本身不直接存放主轴 TeX、BibTeX、PDF 或 LaTeX 编译中间文件。当前结构如下：

| 目录或文件 | 用途 | 规则 |
|---|---|---|
| `paper/manuscript/` | 当前主轴源码 | 只放当前正在推进的 TeX/BibTeX 源文件 |
| `paper/output/` | 当前主轴 PDF 输出 | 正式或候选 PDF 统一放在这里 |
| `paper/build/` | 临时编译目录 | 只用于 LaTeX 中间文件；成功编译后默认删除对应临时目录 |
| `paper/figs/` | 当前论文图形资源 | 后续论文图形放在这里 |
| `paper/bib/` | 备用文献或样式资源目录 | 不作为当前主轴 BibTeX 文件的默认位置 |
| `paper/build.ps1` | 当前主轴编译入口 | 默认编译当前主轴 |
| `paper/build_tex.ps1` | 通用 TeX 编译脚本 | 可指定 TeX 文件、输出名和编译引擎 |

根目录 `output/` 的规则：

- 不作为当前论文编译输出目录。
- 不放 `.aux`、`.log`、`.bbl`、`.out`、`.toc` 等 LaTeX 中间文件。
- 不放当前主轴的日常候选 PDF；当前主轴 PDF 固定在 `paper/output/`。
- 只有在明确生成“对外发送、提交、打包”的项目级最终材料时，才新建有含义的子目录，例如 `output/submission_YYYYMMDD/` 或 `output/advisor_package_YYYYMMDD/`。
- 若无法判断某个 PDF 应放在哪里，默认不要放入根目录 `output/`；先放入 `paper/output/` 或归档到 `oldfiles/`。

编译当前主轴时，优先使用：

```powershell
.\paper\build.ps1
```

该脚本会：

- 从 `paper/manuscript/mah_route_indicator_friction_model.tex` 编译；
- 将 PDF 写入 `paper/output/mah_route_indicator_friction_model.pdf`；
- 将 `.aux`、`.bbl`、`.blg`、`.log`、`.out`、`.toc`、`.fdb_latexmk`、`.fls` 等中间文件限制在 `paper/build/<文件名>/`；
- 成功编译后删除对应的临时编译目录；
- 只有在调试时显式使用 `-KeepBuild`，才保留中间文件。

通用编译示例：

```powershell
.\paper\build_tex.ps1 -TexFile "manuscript\mah_route_indicator_friction_model.tex" -Engine pdflatex
```

## 4. 当前进度

- 当前主轴模型已经明确为 MAH 商业化路线选择与商业化摩擦机制。
- 当前主轴 TeX 和参考文献库已经从 `paper/` 根目录整理到 `paper/manuscript/`。
- 当前 PDF 产物已经从旧文件名 `mian_0519.pdf` 整理为 `paper/output/mah_route_indicator_friction_model.pdf`。
- 旧版主稿、旧整合稿、旧 `paper/src/` 内容、旧 `paper/MAH_Policy/` 工作目录和旧 `output/doc/` 输出已经归档到 `oldfiles/`，后续默认不读取、不修改、不作为当前主轴依据。
- 数据目录 `data/` 已包含审批口径匹配数据和 Excel -> Stata 的可复现转换脚本：
  - `data/minimal_matching_table_regtype_approvalonly_2012_2024.xlsx`
  - `data/minimal_matching_table_regtype_approvalonly_2012_2024_to_dta.do`
  - `data/minimal_matching_table_regtype_approvalonly_2012_2024.dta`
  - `data/minimal_matching_table_regtype_approvalonly_2012_2024_import.log`

## 5. 历史文件归档

以下内容已经移入 `oldfiles/`，只用于追溯早期思路、旧模型框架、旧输出或章节素材：

| 归档位置 | 当前定位 | 使用方式 |
|---|---|---|
| `oldfiles/paper/src/` | 旧 `paper/src` 全量归档 | 默认不再读取 |
| `oldfiles/paper/src/main.tex` | 历史主稿 | 只作为旧版理论框架参考 |
| `oldfiles/paper/src/generated_from_output_doc/` | 旧生成版整合稿目录 | 只用于追溯早期整合文本 |
| `oldfiles/paper/MAH_Policy/` | 旧 MAH_Policy 工作目录 | 只作为历史材料保留 |
| `oldfiles/output/doc/` | 旧输出目录 | 保存旧 PDF、旧修订稿、旧 slides、旧 coauthor/model notes 输出 |
| `oldfiles/output/doc/MAH_Policy.pdf` | 旧主文档 PDF 输出 | 只作为历史 PDF 产物 |
| `oldfiles/paper/section1_intro_with_explicit_cites_20260410_tnr.pdf` | 旧引言 PDF | 只作为历史输出 |

这些文件不应在后续任务中被误判为当前论文主轴。如果确实需要引用其中内容，应先说明其历史版本属性，再决定是否迁移到当前主轴文件。

## 6. 核心目录结构

- `literatures/`：文献与参考资料。
- `research_notes/`：研究笔记、计划、模型说明、导师沟通材料和旧讨论材料。
- `models/`：模型相关材料。
- `data/`：结构化数据、转换脚本和数据处理日志。
- `paper/`：当前论文源码、当前 PDF 输出、构建脚本和论文资源。
- `output/`：项目级对外交付区，不作为当前论文日常编译输出目录。
- `oldfiles/`：旧版主稿、旧整合稿和旧输出的归档目录。
- `tmp/`：本地临时目录。

## 7. 当前工作约定

- 修改当前论文时，只从 `paper/manuscript/mah_route_indicator_friction_model.tex` 开始。
- 修改文献引用时，同步检查 `paper/manuscript/mah_route_indicator_friction_refs.bib`。
- 不再把 `oldfiles/paper/src/`、`oldfiles/paper/MAH_Policy/` 或 `oldfiles/output/doc/MAH_Policy.pdf` 称为当前主稿。
- 不在 `paper/` 根目录直接保存 TeX、BibTeX、PDF 或 LaTeX 编译中间文件。
- 后续 LaTeX 编译输出统一进入 `paper/output/`，无用中间文件在成功编译后删除。
- 根目录 `output/` 只用于明确的项目级对外交付包；当前论文日常 PDF 不放在这里。
