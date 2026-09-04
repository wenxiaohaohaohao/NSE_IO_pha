# MAH 模型更新材料包：组织选择 baseline（2026-09-04）

论文题目：**Regulatory Separation and Pharmaceutical Innovation: Evidence from China's MAH Reform**

本材料包对应 Git 分支 `codex/mah-model-rebuild`，模型来源提交为
`a5f7b1463c3b4e2d508c6ec2eb51772b30bc24a1`。它包含当前正式主文、
Technical Appendix、共享 BibTeX 数据库、完整推导稿、全部模型模块、
baseline recenter notes、inactive financing extension notes、可重复编译脚本
和验证记录。

## 本次核心修订

模型重新以 commercialization organization 为 baseline：

- 开发者类型为 $\theta_i=(a_i,k_i)\sim H(a,k)$；
- $a_i$ 是 project-advancement capability，$k_i$ 是 internal manufacturing
  capability；
- 对每个 $k_i>0$，内部生产在技术上可行，但弱能力会使 $c_I$ 和 $F_I$
  很高；没有正的 hard capability cutoff；
- MAH 只通过 $\tau_E(M)$ 使保留上市许可的委托生产路线可用；
- 路线选择是 $I/E/T/A$ 的确定性价值比较；
- project advancement 仍只有一个共同控制 $x_i$；
- CMO 市场仍只有一个 scalar clearing price；
- 主文只保留四个正式命题：organizational sorting、MAH-relevant set、
  project advancement、CMO equilibrium and scarcity attenuation。

融资机制没有删除。$\ell_i,J_I,J_E$ 和 financing corridor 被移入
Technical Appendix 中明确标注为 “Not part of the baseline” 的 inactive
extension。制造能力是 primary heterogeneity，融资是需要 pre-policy
measurement 和额外验证的 secondary test。当前 baseline 不预测专利数量，
也不把 Gu (2024) 的专利结果解释为本模型的内生结果。

## 建议阅读顺序

1. `formal/mah_route_indicator_friction_model.pdf`：正式主文，14 页。
2. `formal/mah_route_indicator_friction_model_appendix.pdf`：Technical Appendix，35 页。
3. `derivation/12_full_derivation_draft.pdf`：完整推导与边界检查，38 页。
4. `validation/finance_baseline_vs_recentered_comparison.md`：旧 finance baseline、
   新 organizational baseline 与 inactive finance extension 的一页比较。
5. `notes/baseline_recenter/`：七份逐步骤的模型清理与审核记录。

`derivation/` 另附 4 页 main-text candidate 和 35 页 appendix candidate，
便于单独审阅压缩版与证明版。

## TeX、PDF 与 BibTeX

`formal/` 直接提供合作者最常用的五个文件：

- 主文 `.tex` 和对应 `.pdf`；
- Technical Appendix `.tex` 和对应 `.pdf`；
- 两者共享的 `mah_route_indicator_friction_refs.bib`。

`source/` 是完整、可独立编译的工程副本，其中包括 manuscript、model
modules、`aer.bst` 与 PowerShell build scripts。

## Windows 下独立编译

在 PowerShell 中进入本材料包后运行：

```powershell
cd source
.\build.ps1 -KeepBuild
.\build_appendix.ps1 -KeepBuild
```

脚本使用本机 MiKTeX，按需要执行 LaTeX、BibTeX、LaTeX、LaTeX，并把
结果写入 `source/output/`。本包已经完成独立重编译和日志检查。

## 完整性与验证

- `validation/post_phase18_recenter_audit_20260904.md`：61 项模型、文件、
  编译与隔离检查，全部 PASS。
- `validation/post_phase18_recenter_notation_audit.md`：baseline notation audit。
- `validation/post_phase18_recenter_pdf_render_audit.md`：49 页视觉检查。
- `validation/post_phase18_recenter_change_log_20260904.md`：修改与 label 对照。
- `FILE_MANIFEST_SHA256.txt`：材料包全部 payload 文件的 SHA256。
- `VERSION.txt`：版本、来源提交、页数和正式 PDF hash。
