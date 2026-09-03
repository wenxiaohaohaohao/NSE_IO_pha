# MAH 模型更新材料包：商业化融资约束版（2026-09-03）

论文题目：**Regulatory Separation and Pharmaceutical Innovation: Evidence from China's MAH Reform**

本材料包对应 Git 分支 `codex/mah-model-rebuild`，模型来源提交为
`059ffb825ec13fd9e650c025d630311c566baae8`。它包含当前正式主文、
Technical Appendix、共享 BibTeX 数据库、完整推导稿、模型模块、financing
revision notes、可重复编译脚本和验证记录。

## 本次核心更新

模型新增预定的商业化融资能力
\(\ell_i\)，开发者类型为
\(\theta_i=(a_i,k_i,\ell_i)\sim H(a,k,\ell)\)。内部生产和保留权利的
委托生产分别要求 \(J_I(m,k_i)\) 与 \(J_E(m)\) 的前期资金承诺：

- \(J_I,J_E\) 是 route financeability thresholds，不是新的 route costs；
- MAH 不增加融资供给，也不改变 \(\ell_i,J_I,J_E\)；
- MAH 允许开发者在保留上市许可的同时购买合格生产服务，因此可能减少
  为完整 vertical integration 必须筹集的资本；
- 当 \(J_E(m)\leq\ell_i<J_I(m,k_i)\) 时，开发者位于 financing corridor；
- 单一制度内，较高 \(\ell_i\) 弱扩展可行路线集合，但 MAH treatment effect
  对 \(\ell_i\) 没有全局单调性；
- project advancement 仍只有一个共同控制 \(x_i\)，融资只通过最优商业化
  价值 \(\Omega_i\) 影响它；
- CMO 市场仍只有一个 scalar clearing price，供给没有被政策直接改变。

本版不含 research--development allocation、patent-production function 或
专利数量预测。Gu (2024) 是重要的相邻实证研究，但本模型关注的是开发者能否
为 commercialization organization 提供资金，而不是在 research 与
development 之间重新分配固定预算。

## 建议阅读顺序

1. `formal/mah_route_indicator_friction_model.pdf`：正式主文，14 页。
2. `formal/mah_route_indicator_friction_model_appendix.pdf`：Technical Appendix，35 页。
3. `derivation/mah_full_derivation_financing_revision.pdf`：完整推导与边界检查，38 页。
4. `notes/finance_extension/`：七份分模块设计、accounting、nesting 和 empirical mapping notes。

`derivation/` 中另附 4 页 main-text candidate 和 35 页 appendix candidate，
便于合作者单独审阅模型压缩版与证明版。

## 源文件结构

- `source/manuscript/mah_route_indicator_friction_model.tex`：正式主文 TeX。
- `source/manuscript/mah_route_indicator_friction_model_appendix.tex`：正式附录 TeX。
- `source/manuscript/mah_route_indicator_friction_refs.bib`：共享 BibTeX 数据库。
- `source/manuscript/aer.bst`：bibliography style。
- `source/manuscript/*.bbl`：本次编译生成的 bibliography 文件。
- `source/model_rebuild/01_...tex` 至 `14_...tex`：当前模型模块、完整推导稿与 candidates。
- `source/build*.ps1`：Windows PowerShell 编译脚本。

材料包不包含已经 superseded 的 research--development/patent module。该模块
只保存在项目 Git archive 中，不是当前正式文稿的编译依赖。

## Windows 下完整编译

在 PowerShell 中进入材料包后运行：

```powershell
cd source
.\build.ps1 -KeepBuild
.\build_appendix.ps1 -KeepBuild
```

脚本按需要执行 LaTeX、BibTeX、LaTeX、LaTeX，并把结果写入
`source/output/`。本包已使用 MiKTeX 独立重编译；页数、文件大小、引用状态与
正式版本一致。PDF 内部 metadata 会因编译路径和时间不同而改变，因此不要求
重编译文件与正式 PDF 的二进制 SHA256 相同。

## 完整性与验证

- `validation/BUILD_VALIDATION.md`：包内独立编译、引用、版面与哈希核对。
- `validation/post_phase18_financing_revision_20260903.md`：数学和范围审计。
- `validation/post_phase18_financing_pdf_render_audit.md`：PDF 页面渲染抽查。
- `FILE_MANIFEST_SHA256.txt`：包内全部 payload 文件的 SHA256。
- `VERSION.txt`：版本、分支、提交与正式 PDF 哈希。
