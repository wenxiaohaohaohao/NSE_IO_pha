# MAH 模型更新材料包（2026-09-01）

论文题目：**Regulatory Separation and Pharmaceutical Innovation: Evidence from China's MAH Reform**

本材料包对应 Git 分支 `codex/mah-model-rebuild`，来源提交为 `8a99cc3bcebd51b5db025550a201e0eec273a8f0`。它包含当前正式主文、Technical Appendix、完整 TeX 源文件、BibTeX 数据库、appendix 依赖模块以及可重复编译脚本。

## 建议阅读顺序

1. `formal/mah_route_indicator_friction_model.pdf`：主文，12 页。
2. `formal/mah_route_indicator_friction_model_appendix.pdf`：Technical Appendix，32 页。

`formal/` 中的两份 PDF 是本次交付的正式阅读版本。

## 源文件结构

- `source/manuscript/mah_route_indicator_friction_model.tex`：主文 TeX。
- `source/manuscript/mah_route_indicator_friction_model_appendix.tex`：Technical Appendix TeX。
- `source/manuscript/mah_route_indicator_friction_refs.bib`：主文与附录共享的 BibTeX 数据库。
- `source/manuscript/aer.bst`：论文使用的 bibliography style；为提高跨机器可重复性，随包原样提供。
- `source/manuscript/*.bbl`：已生成的 bibliography 文件，便于快速查看；正式重编译仍建议运行完整 BibTeX 流程。
- `source/model_rebuild/*.tex`：Technical Appendix 通过 `\input` 调用的 11 个模型模块。
- `source/build.ps1`、`source/build_appendix.ps1`、`source/build_tex.ps1`：Windows PowerShell 构建脚本。

## Windows 下完整编译

在 PowerShell 中进入本材料包，然后运行：

```powershell
cd source
.\build.ps1 -KeepBuild
.\build_appendix.ps1 -KeepBuild
```

脚本按需要执行 LaTeX、BibTeX、LaTeX、LaTeX，并把结果写到 `source/output/`。脚本会优先识别本机 MiKTeX；只要 `pdflatex` 和 `bibtex` 已在 `PATH` 中，也可在其他安装环境运行。

## 其他系统下手工编译

先进入 `source/manuscript/`，分别对两个基名执行：

```text
pdflatex <basename>.tex
bibtex <basename>
pdflatex <basename>.tex
pdflatex <basename>.tex
```

请从 `source/manuscript/` 目录启动编译，以保持 appendix 的 `../model_rebuild/` 相对路径有效。

## 验证与完整性

- `validation/BUILD_VALIDATION.md` 记录本材料包的独立编译、引用、页数和依赖边界检查。
- `FILE_MANIFEST_SHA256.txt` 记录 ZIP 内每个 payload 文件的 SHA256。
- `VERSION.txt` 记录版本、分支和提交信息。

本包不包含旧模型 technical memo、旧讲义、内部 specification/audit 文件、编译缓存或文献全文；这些文件不是当前正式稿的编译依赖，也不属于本次合作者交付。
