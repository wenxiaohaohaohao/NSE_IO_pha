# Phase 1 独立人工复核（当前规格）

范围：沿用 September 1 模块，逐条对照原 note §6 及 v1.1 A/C/D/E；不以历史 PASS 替代本轮复核。不涉及后续 FOC、SOC、cutoff 或均衡存在性证明。

## 对象、维度与 timing

- 28 个对象登记行，各有唯一类别；O 和 Inc 有明确解释，Inc 与内部路线 I 区分。
- x_i 是项目开发／推进强度；x_i* 仅预留为其最优值，不在 Phase 1 声称已解出。
- a_i 的单位为 P/X，x_i 的单位为 X，因此 a_i x_i 的单位为 P；是同一决策 cohort 的预期项目数，不是批准数。
- rho_g 非负且和为 1，F_g 是条件分布，因此混合分布 F 合法。rho_g=0 不新增决策，也不强制类型响应排序。
- p_m 单位 C/B，Omega_i 单位 C/项目；它们在参数表达式首次使用前预留定义。M 先于 Omega_i(M,p_m) 定义。
- 政策唯一直达 tau_E；M=0 的无限 wedge 仅编码 E 不可用，路线标签集本身不构成第二政策渠道。
- x_i 在项目抽样、route choice、downstream realization 前选择。Stage 5 明确为同步均衡一致性，不是事后意外冲击。
- 内部生产不可行边界保留在有效规格 §8 与 QA；其公式与极限检验由已有 Phase 3 在本轮获准复核时处理，Phase 1 不提前写推导。
- 本阶段无待独立重推的 FOC/SOC；不把“无此对象”记录为后续证明已通过。

## 逐条红线：Phase 1 范围证据

以下 PASS 仅适用于当前 Phase 1 模块，不表示最终文稿已通过。

| ID | 本阶段结论 | 具体证据 |
|---|---|---|
| RL-01 | PASS | 一个共同 advancement control；novelty classifier 不构成两个研发方向 |
| RL-02 | PASS | theta=(a,k) 连续特征；无 A/B/C 永久企业类型 |
| RL-03 | PASS | 无多产品企业状态 |
| RL-04 | PASS | 无 entry/exit 对象或方程 |
| RL-05 | PASS | H 是外生分布，无 invariant-distribution 方程 |
| RL-06 | PASS | 无家庭、资本积累、BGP 或 welfare 对象 |
| RL-07 | PASS | 末段明确 M 不直改 a_i |
| RL-08 | PASS | q,m,F 均保持外生且 MAH invariant |
| RL-09 | PASS | s(q)、s_g(q) 明确外生且 MAH invariant |
| RL-10 | PASS | p_m* 预留内生解，明确不能直接下调 |
| RL-11 | PASS | E 下开发者仍持授权；与 T 区分 |
| RL-12 | PASS | 无 logit/inclusive-value 活跃对象；路线最优值待既有 Phase 4 复核 |
| RL-13 | PASS | 无 eta 或连续政策实施指数 |
| RL-14 | PASS | 未增加永久特征或基线状态；g 只是分类 |
| RL-15 | PASS | 原 manuscript 与 September 1 包哈希未改 |
| RL-16 | PASS | 无数据识别声明；实证对象尚未形式化 |
| RL-17 | PASS | 正式 TeX 给出定义与 timing；依赖图不代替后续推导 |
| RL-18 | PASS | 保留已有 label 与符号；x_i* 的预留定义进入登记表 |
| RL-19 | PASS | 无新增命题；依赖箭头明确不是无条件比较静态 |
| RL-20 | PASS | 无福利推论 |
| RL-21 | PASS | x_i 明确排除 upstream/patent-generating research |
| RL-22 | PASS | 明确不推出专利申请上升 |
| RL-23 | PASS | 明确不推出上游科学研究上升 |
| RL-24 | PASS | 不声称 breakthrough/original 必然上升 |
| RL-25 | PASS | 一个 x_i，无双控制、预算约束或融资状态 |
| RL-26 | PASS | patent applications 在控制之外；未将专利下降判为机制反例 |
| RL-27 | PASS | O/Inc 无响应排序；混合分布不赋予排序 |
| RL-28 | PASS | 问题仍是商业化组织与制造服务，无融资约束主机制 |

## 不改变本轮架构的修订

1. 用 v1.1 的 canonical definition 替换原“original-drug innovation investment / broader than pure clinical”措辞。
2. 保留 a_i x_i、M 和路线定义，不新增 payoffs、FOC 或市场。
3. 补充已有预留符号的首次定义顺序、O/Inc 类别解释和 x_i* 登记。
4. 历史后续文件中的扩展解释列入 affected_file_inventory.csv，等待其阶段复核；不改动它们的正式输出。

## 后续审计限制

有效规格已要求全部强制边界、六个核心命题和 novelty corollary。它们尚未在本轮通过证明审计。历史 Shi Gu evidence ledger 保留，最终引用前需版本/页表复核（P1，当前 Phase 1 不阻断）。
