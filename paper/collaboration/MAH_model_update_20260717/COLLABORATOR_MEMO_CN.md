# 给合作者的 MAH 模型更新说明

日期：2026-07-17

## 一、这次更新后的核心判断

当前模型已经形成一个内部一致、可以正式讨论的基准版本。它解释的是 MAH 如何通过“新增并改善受监管的保留型委托生产路线”改变原研企业的预期商业化价值，而不是把 MAH解释成需求扩张、审批提速或科学生产率提高。

基准模型最重要的变化有四点：

1. 项目在最终临床、监管和商业实现之前进入 route-planning stage。企业必须在这一阶段规划生产和商业化路线，因此外部生产支持需求发生在最终实现之前。
2. 政策变量分成二元的制度开放 `M` 与连续的实施强度 `eta`。`M` 只做有限差分，`eta` 才做导数比较静态。
3. 委托生产路线不是免费且无限供给。模型闭合合格 CMO 支持市场，改革引致的需求会推高内生有效支持成本，从而削弱直接政策效应。
4. 观测到的原研药和 holder--producer split 都是研发、路线选择与路线实现三层共同作用的结果，不能直接等同于 route-choice probability。

## 二、文章的经济问题

很多研发型企业有较强的项目生成能力，但没有完整的内部生产能力。pre-MAH 条件下，这些企业即使产生了有价值的项目，也可能只能转让、出售、非保留型许可，或者放弃和延迟。MAH 开放一种新的 retained external route：企业可以保留上市许可和未来资产价值，同时委托合格生产者完成生产。

因此，MAH 改变的是创新者对研发项目未来可商业化路线的预期。当前研发投入的价值取决于未来路线集合、各路线实现概率、成本、保留收益、外部支持稀缺和 outside option。

模型的特征性预测不是“所有企业研发都上升”，而是：

1. 研发能力较强、内部生产能力较弱、且具备进入合格委托生产安排资格的企业反应更强；
2. holder--producer separation 应在 retained entrusted route 真正可行的项目和地区中上升；
3. 合格 CMO 支持越稀缺，政策效应越容易被支持成本上升所削弱；
4. 如果只发生审批能力改善或需求扩张，却没有相对提高 external retained route 的吸引力，则 holder--producer split 不必出现同样的变化。

## 三、基准模型的 timing

### Period t：研发投入

企业观察自身状态和预期制度环境，选择原研研发投入 `x_i`。研发生产率 `a_i` 把研发投入转化为进入下一期 route-planning stage 的项目到达率：

`lambda_i^plan = a_i x_i`。

这个对象不是已经临床成功、已经批准或已经上市的药品数量。

### Period t+1：路线规划和支持市场

每个到达 route-planning stage 的项目在可行路线集合中选择：

- `I`：内部生产并保留资产；
- `E`：委托合格外部生产者生产并保留资产；
- `T`：转让、出售或非保留型许可；
- `A`：放弃或延迟。

计划采用 `E` 的项目在最终结果未知时就需要一份合格生产支持 package，因此形成 CMO 支持需求。供需清算决定有效支持成本 `p_m^*(M, eta)`。

### Period t+1 后段：最终实现

项目经过临床、监管、生产准备、技术转移和实施等环节，最后以复合概率

`zeta_i^r = s_i chi_i^r`

成为观测到的批准、上市或保留型实现结果。`s_i` 是共同的下游临床和监管成功部分；`chi_i^r` 是路线特定的实施部分。当前批准侧数据通常只能约束二者的乘积，不能分别识别。

## 四、路线 payoff

内部生产路线：

`G_i^I = zeta_i^I (R_i^event + v) - C^I(k_i)`。

委托生产并保留资产的路线：

`G_i^E = zeta_i^E(eta,p_m) (Rbar_i^E + v) - p_m - tau_i^E(eta) - mu_i^E`。

转让路线：

`G_i^T = S_i - tau_i^T`。

放弃或延迟：

`G_i^A = 0`。

其中：

- `R^event` 是项目成功商业化时的一次性事件回报；
- `v` 是新增一个 retained product 进入企业资产 stock 的边际延续价值；
- `C^I(k_i)` 是内部生产路线的规划阶段资源成本，内部生产能力越强通常越低；
- `p_m` 是合格 CMO 支持的内生有效成本；
- `tau_i^E(eta)` 是 MAH 可改善的 external-route friction；
- `mu_i^E` 是制度实施后仍由 holder 承担的质量、监督、协调和技术转移负担。

成本项不乘 `zeta`，因为这些资源承诺在结果实现之前已经发生。保留型路线的回报和延续价值乘 `zeta`，因为只有实现后才能获得。

## 五、路线选择和 inclusive value

项目有 Type-I extreme-value 路线适配冲击，选择概率为标准 logit：

`P_i(r) = exp(G_i^r/sigma) / sum_l exp(G_i^l/sigma)`。

route-planning opportunity 的期望价值为：

`Gamma_i = sigma log sum_r exp(G_i^r/sigma)`。

位置归一化已经明确，因此这里的 log-sum 是准确的期望最大值，不额外留下 Euler constant。关键 envelope 结果是：

`partial Gamma_i / partial G_i^r = P_i(r)`。

这使政策对某条路线 payoff 的影响按照该路线被选择的概率进入项目总价值。

## 六、R&D 选择

企业解决：

`max_x beta a_i x_i E[Gamma_i] - (kappa/2) x_i^2`。

一阶条件给出内部解：

`x_i^* = beta a_i E[Gamma_i] / kappa`，前提是 inclusive value 为正；一般写成其正部。

二阶导数为 `-kappa < 0`，所以目标函数严格凹，最优解唯一。

这个式子说明研发能力 `a_i` 有双重作用：它直接提高项目生成效率，也放大 route value 改变对研发投入的反应。

## 七、CMO 支持市场

CMO 总需求包括改革之外已经存在的背景需求和 MAH 项目需求：

`D_m^tot(p;M,eta) = D_m^B(p) + integral a_i x_i^*(M,eta,p) P_i(E|M,eta,p) dH_i`。

这里不乘 `zeta_i^E`，因为支持 package 在最终实现之前就要规划和占用。每个计划采用 `E` 的项目需求一份 package。

供给为 `S_m(p)`，均衡由

`S_m(p_m^*) = D_m^tot(p_m^*;M,eta)`

决定。连续性、边界条件、供给严格上升和总需求严格下降保证均衡存在且唯一。

隐函数定理给出：

`dp_m^*/deta = D_eta^tot / (S_p - D_p^tot)`。

当实施强度提高使 MAH 项目需求外移时，均衡支持成本通常上升。总政策效应因此等于直接 route improvement 减去或加上价格反馈，不能机械写成正值。

## 八、二元制度开放与连续实施强度

`M` 是二元路线开放变量，不能对它求导。pre-MAH 到 post-MAH 的效应是把 `E` 加入 route set 的有限变化：

`Delta Gamma_i^set = sigma log[1 + exp(G_i^E/sigma)/Q_i^old] > 0`。

`eta` 是 post-MAH 内部的连续实施强度。固定支持成本时：

`dGamma_i/deta = P_i(E) G_i,eta^E`。

考虑均衡支持成本后：

`dGamma_i/deta = P_i(E)[G_i,eta^E + G_i,p^E (dp_m^*/deta)]`。

该式是当前 attenuation 机制的核心。

## 九、观测结果和份额

委托生产路线的观测流量为：

`N_E^obs = integral a_i x_i^* P_i(E) zeta_i^E dH_i`。

正确的 aggregate observed entrusted share 是 retained `E` 流量占所有 retained `I/E` 实现流量的比例。它必须使用 `a_i x_i^* P_i(r) zeta_i^r` 加权，不能把企业层 route-choice probability 简单平均。

只有在一个足够窄、同质、且只比较 `I` 与 `E` 的 cell 内，观测 log odds 才简化为：

`log[s_iE^obs/(1-s_iE^obs)] = (G_i^E-G_i^I)/sigma + log(zeta_i^E/zeta_i^I)`。

共同的 `s_i` 只在这种窄 cell 比率中消去。在异质企业聚合前不能一般性约掉。pre-MAH 的 `E` 路线不可行，零份额是结构性零值，也不能直接塞入 log odds。

## 十、Bellman accounting

企业原有 retained-product stock 为 `n_it`。其条件期望转移为：

`E_t[n_i,t+1] = (1-delta)n_it + a_i x_it sum_r P_i(r) rho^r zeta_i^r`，

其中 `rho^I=rho^E=1`，`rho^T=rho^A=0`。

仿射值函数写成 `V_t(n_it)=A_t+v_t n_it`。边际延续价值满足：

`v_t = pi + beta(1-delta)v_t+1`，

稳态时：

`v = pi/[1-beta(1-delta)]`。

约化 Bellman 中 `Gamma` 已经包含路线事件回报和新 retained asset 的增量 continuation value，因此不能再另外添加一遍新项目 stock value。当前版本已经消除了这一潜在双重计算。

## 十一、与两篇中国医药行业文献的关系

Ruixue Jia et al. (2023) 主要研究 drug-review reform、审批延迟和监管能力。在当前符号中，它更接近改变共同成功部分 `s_i`、等待成本或普遍 approval friction。

Panle Jia Barwick et al. (2026) 主要研究 NRDL 改革带来的市场规模和需求激励。在当前符号中，它更接近改变 `R_i^r` 一类市场回报对象。

本文的 MAH 机制主要改变 route availability、`tau_i^E`、`chi_i^E` 和内生 `p_m^*`。三种机制可能同时存在，但对 holder--producer split、异质性和 CMO scarcity 的预测不同，因此实证上必须区分。

## 十二、当前完成度和需要合作者重点判断的事项

按基准模型既定范围，理论部分约 90%--92% 完成。当前最需要合作者判断的不是再增加一套大模型，而是以下三件事：

1. 论文是否应保持当前“route mechanism + one support-market closure”的窄主轴；
2. 实证数据是否足以构造 holder--producer links、pre-reform internal capability 和 CMO scarcity proxy；
3. 校准应只做 approval-side composite moments，还是已经有申请阶段面板可以进一步分解 `s_i` 与 `chi_i^r`。

如果这些数据暂时不存在，建议保持当前理论边界，不把 entry、full GE、welfare 或 full bargaining 添加到基准模型。它们会显著增加参数和识别负担，却不直接解决当前文章的核心证据问题。
