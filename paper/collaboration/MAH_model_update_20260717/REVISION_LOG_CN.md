# MAH 模型本轮修改记录

版本日期：2026-07-17

## 1. Timing 与项目到达

### 原有风险

把 `a_i x_i` 写成已经成功或已经批准的项目数量，会使路线规划、CMO 支持需求和最终实现发生顺序冲突，也会导致实现概率重复或遗漏。

### 当前处理

- `lambda_i^plan=a_i x_i` 统一定义为进入 route-planning stage 的项目到达率。
- 路线选择和 CMO 支持需求发生在最终临床、监管和实施结果之前。
- 最终观测结果另乘 route-specific composite realization probability `zeta_i^r`。

### 影响

R&D、CMO demand 和 observed output 的 accounting 现在一致。

## 2. 二元制度开放与连续实施强度

### 原有风险

直接对二元 MAH indicator 求导在数学上没有意义，也会把“新增一条路线”和“既有路线质量改善”混在一起。

### 当前处理

- `M in {0,1}` 表示 retained external route 是否法律可行。
- `eta in [0,1]` 表示 post-MAH implementation intensity。
- `M` 使用 finite route-set comparison；`eta` 使用导数比较静态。
- 全文删除对 `M` 的不合法微分。

## 3. External-route eligibility

### 原有风险

若 `q_i^E=1` 被解释为企业已经匹配到生产者，CMO 市场中的稀缺和匹配成本会被提前假定掉。

### 当前处理

`q_i^E` 只表示企业具备进入合格委托生产安排的技术与监管资格，不表示已完成匹配。市场压力由 `p_m^*` 处理。

## 4. 实现概率分解

### 原有风险

审批成功、生产实施和路线实现没有清楚区分；内部路线有时被隐含归一化为必然实现。

### 当前处理

- 对 retained route 定义 `zeta_i^r=s_i chi_i^r`。
- `s_i` 是共同 downstream clinical/regulatory success 部分。
- `chi_i^r` 是 route-specific implementation 部分。
- 内部路线 `zeta_i^I` 不再被设为 1。
- 明确说明批准侧数据一般只能识别乘积，不能分解两个 primitive。

## 5. Route payoff accounting

### 原有风险

事件回报、原有产品 flow profit 和新增 retained asset continuation value 容易混在一起；成本是否应乘成功概率也不明确。

### 当前处理

- `R^event`：成功商业化时的事件回报。
- `pi n_it`：原有 retained stock 的当期 flow payoff。
- `v`：新增 retained asset 的边际 continuation value。
- `I/E` 回报与 continuation value 乘实现概率。
- 规划阶段已经承诺的内部资源成本、支持 package、route friction 和 holder burden 不乘实现概率。
- `T` 明确为不保留资产的 transfer / sale / out-licensing outside option。

## 6. Logit 与 inclusive value

### 原有风险

如果 EV1 shock 的位置没有归一化，inclusive value 可能缺少常数；当 inclusive value 进入 R&D 水平时，这个常数不能被忽略。

### 当前处理

- 明确 Type-I extreme-value shock 的 location normalization。
- 使用精确 log-sum inclusive value。
- 保留 `partial Gamma/partial G_r=P(r)` 的 envelope 结果。
- deterministic max 只作为 `sigma -> 0` 的极限，不与 logit baseline 混用。

## 7. R&D FOC 与 SOC

### 原有风险

R&D 一阶条件虽然存在，但项目到达、inclusive value 和折现关系没有统一；唯一性条件不充分展示。

### 当前处理

- 统一问题为 `max_x beta a_i x_i E[Gamma_i]-(kappa/2)x_i^2`。
- 给出内部解和正部解。
- 以 `-kappa<0` 证明严格凹与唯一性。
- observed output 在此后另乘 route choice 和 realization。

## 8. CMO 背景需求

### 原有风险

若 pre-MAH 时 CMO demand 为零或市场不存在，改革前后的均衡价格比较缺少共同市场基础。

### 当前处理

总需求加入模型外背景需求 `D_m^B(p)`，使 pre-MAH support market 仍然存在。MAH 项目需求是其上的增量需求。

## 9. CMO 项目需求不乘 realization

### 原有风险

把 `zeta_i^E` 乘进 CMO planning demand，会错误地假定只有最终成功的项目才提前占用生产准备支持。

### 当前处理

需求定义为 `integral a_i x_i^* P_i(E)dH_i`。每个计划采用 `E` 的项目需求一份支持 package，最终实现概率只进入 observed outcomes。

## 10. CMO 均衡存在、唯一与 IFT

### 原有风险

只写清算式而没有连续性、边界和单调性，不能保证均衡存在唯一；价格反馈符号也不透明。

### 当前处理

- 定义 excess supply `Z_m(p)=S_m(p)-D_m^tot(p)`。
- 连续性和两端边界保证存在。
- `S_p>0`、`D_p^tot<0` 保证唯一。
- 隐函数定理给出 `dp_m^*/deta=D_eta^tot/(S_p-D_p^tot)`。
- 比较静态把 direct route improvement 与 equilibrium price feedback 分开。

## 11. 市场 cell

### 原有风险

模型有时写一个全国统一 CMO 市场，有时又提出地区、剂型或技术异质性，市场边界不一致。

### 当前处理

用 `m` 表示独立 support-market cell；每个 cell 有 `H_m`、`H_C,m` 和 `p_m^*`。单一全国市场只是 one-cell special case。跨 cell 替代不在基准中暗含。

## 12. Route-set expansion 命题

### 原有风险

新增路线的价值变化与实施强度的边际变化没有严格分开。

### 当前处理

新增 `E` 路线的有限变化写成：

`Delta Gamma_i^set = sigma log[1+exp(G_i^E/sigma)/Q_i^old] > 0`。

这只证明 option value 增加，不自动证明 observed innovation 或 welfare 必然增加。

## 13. 实施强度与价格 attenuation

### 原有风险

只计算 `eta` 对 external payoff 的直接影响会忽略改革导致的支持价格上升。

### 当前处理

总导数统一为：

`dGamma_i/deta=P_i(E)[G_i,eta^E+G_i,p^E dp_m^*/deta]`。

正效应需要直接改善大于均衡价格反馈和其他负向实现效应。

## 14. 企业异质性

### 原有风险

“研发强、生产弱的企业反应更大”以前主要是直觉，缺少与公式的对应。

### 当前处理

- `a_i` 通过 R&D productivity 和政策响应的尺度进入。
- `k_i` 通过内部生产成本影响 `G_i^I`，进而改变 `P_i(E)`。
- 形式化 `k_i` 对 external-route relevance 和政策反应的作用。
- 结论附带 external eligibility、outside option 和 CMO price feedback 条件。

## 15. Aggregate observed share

### 原有风险

简单平均 `P_i(E)` 或用代表性企业 route probability 代替 observed holder--producer split，会遗漏企业规模、研发、路线实现和 sample composition。

### 当前处理

分子使用 `integral a_i x_i^* P_i(E) zeta_i^E dH_i`；分母只包含 retained `I/E` 实现流量。聚合 share 必须通过积分或模拟计算。

## 16. Log odds 的适用条件

### 原有风险

把 aggregate share 的 log odds 机械解释为 payoff gap；把 pre-MAH structural zero 放入 log odds；在异质样本中提前约掉共同成功概率。

### 当前处理

- 只有 homogeneous / narrow cell 且只比较 `I/E` 时使用闭式 log odds。
- 此时加入 `log(zeta_E/zeta_I)`。
- `s_i` 只在窄 cell 比率中约掉，不能在聚合前一般性约掉。
- pre-MAH `E` 不可行产生 structural zero，不能直接做有限 log odds。
- 推荐用 post-MAH implementation variation 或结构模型处理 extensive margin。

## 17. Bellman 与 stock transition

### 原有风险

新项目 continuation value 可能在 route payoff 和 stock transition 中重复计入；stock transition 也可能遗漏 realization。

### 当前处理

- expected transition 使用 `a_i x_i sum_r P_i(r) rho^r zeta_i^r`。
- `rho^I=rho^E=1`，`rho^T=rho^A=0`。
- 仿射值函数给出 `v_t=pi+beta(1-delta)v_t+1`。
- 约化 Bellman 中 `Gamma` 已含新 retained asset 的增量 continuation value，不再另加一遍新项目 stock value。

## 18. 文献定位

### 原有风险

Ruixue Jia 与 Panle Jia Barwick 的中国医药行业论文虽然相关，但若不区分，会让读者认为本文重复审批改革或需求改革机制。

### 当前处理

- Jia et al. (2023) 定位为 approval-delay / regulatory-capacity mechanism。
- Barwick et al. (2026) 定位为 demand / market-size mechanism。
- 本文定位为 route-set / route-friction / support-scarcity mechanism。
- 两篇文献均已加入 BibTeX、主文 Introduction、技术附录和中文讲义。

## 19. 附录结构与重复内容

### 原有风险

附录中曾有重复 CMO 市场和重复 calibration overview，容易产生两套定义。

### 当前处理

- 保留一个正式 CMO support-market closure，后文只做 cross-reference。
- 第二个 calibration overview 改为 detailed data-moment protocol。
- 主文给最短闭合版本，附录给证明和扩展，研究笔记只作为控制层。

## 20. 校准声明边界

### 原有风险

用批准数据可能过度宣称分别识别项目生成、临床成功、路线实施、route friction 和 entry cost。

### 当前处理

- approval-side moments 只约束 composite innovation-realization scale 和相对路线吸引力。
- entry 没有 firm-year panel 时不作为 baseline calibrated outcome。
- `s_i`、`chi_i^r`、`tau_i^E`、`mu_i^E` 和 `p_m^*` 不在数据不足时被宣称分别识别。
- 明确区分 calibration blueprint、actual estimation 和 full structural identification。
