# MAH 模型更新包说明

版本日期：2026-07-17

## 1. 这份文件包解决什么问题

这份材料给合作者提供一个可独立阅读和核对的 MAH 模型版本。它包含：

1. 当前正式主文、技术附录和中文模型讲义；
2. 与正式 PDF 对应的 LaTeX 源文件和参考文献库；
3. 当前进度、模型完整度和剩余工作；
4. 从旧设定到当前设定的逐项修改记录；
5. 模型控制笔记，用于核对符号、方程依赖、Bellman accounting、比较静态和校准边界；
6. Ruixue Jia 与 Panle Jia Barwick 两篇中国医药行业研究的原文及其在本文中的准确位置。

## 2. 建议的阅读顺序

1. `COLLABORATOR_MEMO_CN.md`：先看文章主轴、当前结论和需要合作者判断的问题。
2. `formal/mah_route_indicator_friction_model.pdf`：正式主文，给出最短但完整的模型。
3. `formal/MAH_model_detailed_lecture_notes_CN.pdf`：29 页中文讲义，从 timing、payoff、logit、R&D、CMO 市场到 Bellman 逐步推导。
4. `formal/mah_route_indicator_friction_model_appendix.pdf`：完整技术附录，包含假设、证明、校准映射和扩展边界。
5. `MODEL_PROGRESS_AND_REVIEW_GUIDE_CN.md`：当前完整度、尚缺数据和推荐的下一步。
6. `REVISION_LOG_CN.md`：逐项查看本轮修改处理了什么理论风险。

## 3. 正式版本的识别规则

本包中只有 `formal/` 目录下的三份 PDF 被标记为本轮正式阅读版本：

| 文件 | 用途 | 当前状态 |
|---|---|---|
| `formal/mah_route_indicator_friction_model.pdf` | 主文模型 | 已编译并检查 |
| `formal/mah_route_indicator_friction_model_appendix.pdf` | 技术附录 | 已编译并检查 |
| `formal/MAH_model_detailed_lecture_notes_CN.pdf` | 中文详细讲义 | 已编译并检查 |

主文、附录和 BibTeX 的可编辑快照位于 `source/`；中文讲义的 LaTeX 源文件位于本包根目录。`notes/` 中的文件是模型设计和一致性控制材料，不是准备投稿的正文。

## 4. 当前文章主轴

文章研究的不是“MAH 是否普遍提高医药需求”，也不是“MAH 是否直接提高科学研发生产率”。主轴是：

> MAH 允许原研企业在保留药品上市许可和未来资产收益的同时，使用合格的外部生产支持。这个受监管的 holder--producer separation route 改变了项目未来可用的商业化路线集合和路线摩擦，因此提高了今天研发投入的预期商业化价值；但合格 CMO 支持的稀缺性会通过内生支持成本削弱这一效应。

因此，模型的因果链条是：

`MAH route availability / implementation intensity`

→ `retained entrusted route payoff`

→ `route inclusive value`

→ `current R&D effort and route-planning-stage project arrival`

→ `route choice and downstream realization`

→ `observed original-drug approvals, launches, and holder--producer separation`。

## 5. 当前模型边界

基准模型是一个带有单一内生支持市场的部分均衡模型。它闭合合格 CMO 支持市场，但不闭合产品市场、研发投入市场、自由进入退出、行业稳态分布或社会福利。

这个边界是有意设定的。当前论文要识别的是一条具体制度机制，而不是建立中国医药行业的完整通用均衡模型。进入、CES demand、GHM bargaining 和更完整的产业动态被保留为扩展或敏感性模块，不属于基准结论成立的必要条件。

## 6. 当前完整度的简要判断

按当前明确限定的研究范围，理论基准模型约为 **90%--92% 完成**。缺少的部分主要不是基本方程，而是数据支持下的定量执行。

| 维度 | 当前判断 |
|---|---:|
| 机制定义和制度映射 | 95% |
| timing、payoff 与 Bellman accounting | 95% |
| 路线选择、R&D 决策和比较静态 | 92% |
| CMO 支持市场闭合与存在唯一性 | 90% |
| observed outcome 和校准 moment 映射 | 85% |
| 真实数据下的参数校准或估计 | 40%--50% |
| 完整实证论文的端到端准备度 | 65%--70% |

这些比例是按“假设是否明确、方程是否闭合、命题是否可推导、数据是否可以执行”四项标准做的审查判断，不是统计估计。

## 7. 两篇 Jia 相关文献在哪里

### Ruixue Jia et al. (2023)

- 本包文件：`references/Jia et al - 2023 - Improving Regulation for Innovation.pdf`
- 原项目文件：`literatures/Jia 等 - 2023 - Improving Regulation for Innovation Evidence from.pdf`
- BibTeX key：`JiaMaYangZhang2023`
- 论文：Ruixue Jia, Xiao Ma, Jianan Yang, and Yiran Zhang, “Improving Regulation for Innovation: Evidence from China's Pharmaceutical Industry,” NBER Working Paper 31976, 2023.
- 在本文中的作用：审批延迟、审评能力和 approval-side regulation 的相邻机制。它帮助说明 MAH route mechanism 不应被写成一般性的审批加速机制。

### Panle Jia Barwick et al. (2026)

- 本包文件：`references/Barwick et al - 2026 - From Free Rider to Innovator.pdf`
- 原项目文件：`literatures/Barwick 等 - 2026 - From Free Rider to Innovator The Rise of China's Drug Development.pdf`
- BibTeX key：`BarwickXiaXia2026`
- 论文：Panle Jia Barwick, Hongyuan Xia, and Tianli Xia, “From Free Rider to Innovator: The Rise of China's Drug Development,” NBER Working Paper 34977, 2026.
- 在本文中的作用：NRDL、需求扩张和市场规模激励的相邻机制。它帮助说明 MAH route mechanism 不应被写成一般性的 demand shock。

两篇论文已经在主文 Introduction 和技术附录的模型定位部分正式引用。中文讲义另有一整节对比三种机制的符号位置、预测和识别含义。

## 8. 尚需补充的核心内容

1. 合格 CMO 支持价格、产能、匹配紧张度或交付周期的可用代理变量。
2. 申请阶段到批准阶段的项目状态面板，以区分 route-planning arrival 与 downstream realization。
3. 改革前企业内部生产能力、研发能力和 external-route eligibility 的可重复测量。
4. holder--producer links 与原研药批准数据的稳定匹配规则。
5. 基于实际样本的校准、模拟、标准误或敏感性区间。
6. 实证设计中对审批改革、NRDL、疾病类别需求变化和地区实施差异的区分。

在这些数据未准备好前，不应宣称已经完成 full structural identification，也不应把进入、福利或产业稳态当作已经估计的结果。

## 9. 编译和校验

项目中的正式编译入口为：

```powershell
.\paper\build.ps1 -KeepBuild
.\paper\build_appendix.ps1 -KeepBuild
.\paper\build_tex.ps1 -TexFile 'collaboration\MAH_model_update_20260717\MAH_model_detailed_lecture_notes_CN.tex' -Engine xelatex -OutputName 'MAH_model_detailed_lecture_notes_CN.pdf' -KeepBuild
```

三份 PDF 均使用项目本地 LaTeX 工具链重新生成。`FILE_MANIFEST_SHA256.txt` 记录最终文件的大小与 SHA256，便于确认传输后未被替换或损坏。

本轮最终验收结果：

| 检查 | 结果 |
|---|---|
| 主文 PDF | 13 页，编译通过 |
| 技术附录 PDF | 45 页，编译通过 |
| 中文详细讲义 PDF | 29 页，编译通过 |
| 未解析引用或文献 | 0 |
| 重复 LaTeX label | 0 |
| `Overfull`、公式缺失或 fatal error | 0 |
| 版面抽查 | 已渲染并检查标题、目录、对象表、核心推导、Bellman、校准和参考文献页面 |
| 模型控制笔记重建 | 两次重建 SHA256 相同：`B1AAF7C6CB8C56707E475864D88C52A5453F81C61BC8DA2909F26006078125B2` |
