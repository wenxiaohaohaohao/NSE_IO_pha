# NEV Project Notes for Codex

## 北美宏观 JMP 定位：宏观主干、IO 与供应链机制从属

**目的**：本 notes 用于指导 Codex 后续整理和重构 NEV 项目的模型文件、proposal notes、model memo 和实证设计 notes。核心任务不是继续扩展机制，而是把已有讨论压缩成一个符合北美宏观 JMP 口径的、可求解、可量化、可做 welfare counterfactual 的模型架构。

---

## 0. 核心判断

当前 NEV 项目可以发展成一篇北美宏观学校能够理解的 JMP，但它不能被写成传统 DSGE，也不能被写成单纯 empirical IO 或供应链金融论文。最合适的定位是：

> **A quantitative dynamic general equilibrium model of decentralized industrial policy, overcapacity, and aggregate misallocation.**

中文定位：

> **分散化产业政策、产能过剩与总量资源错配的定量动态一般均衡模型。**

更具体地说：

> 本文研究地方政府围绕新能源汽车产业进行分散化产业政策竞争时，如何通过降低企业进入成本和资本成本，诱导企业进入、产能扩张和价格竞争；由于地方政府内部化本地投资、产值、就业和税基收益，却不完全内部化全国性产能过剩、部门间资本错配和财政成本，分散均衡相对于中央协调的状态依赖政策均衡会出现过度进入、低产能利用率、NEV 部门 MPK 下降和总量福利损失。

---

## 1. 主线必须从“供应链创新”上移到“总量资源错配”

### 1.1 不推荐的主线

不要把 JMP 主线写成：

```text
地方产业政策 → 企业进入 → 价格战 → 供应商账期 → 供应商创新下降
```

这个主线有价值，但它更像：

- empirical IO；
- supply chain finance；
- corporate finance；
- innovation economics；
- China industrial policy applied micro paper。

如果目标是北美宏观顶尖学校，这个主线的宏观含量不足。

### 1.2 推荐的主线

宏观 JMP 主线应该写成：

```text
中央战略性产业目标
+ 地方分散化执行
+ 企业理性进入和扩产
+ 产能积累和产品市场价格竞争
+ NEV / Other 两部门资本配置
= aggregate misallocation and welfare consequences
```

供应链账期和供应商创新应作为：

```text
amplification / propagation channel
```

而不是 main object。

---

## 2. 最终论文题目方向

### 2.1 首选英文题目

> **Decentralized Industrial Policy, Overcapacity, and Aggregate Misallocation: Evidence from China’s NEV Industry**

### 2.2 备选题目

> **When Industrial Policy Succeeds Too Much: Local Competition, Overcapacity, and Welfare in China’s Electric Vehicle Industry**

> **State-Contingent Industrial Policy and Local Competition: Evidence from China’s NEV Industry**

> **Local Industrial Policy Competition and Capital Misallocation in Strategic Industries**

### 2.3 中文题目

> **分散化产业政策与总量资源错配：来自中国新能源汽车产业的证据**

---

## 3. 学科定位

### 3.1 正确定位

该项目最适合定位为：

```text
macro-development
+ spatial macro
+ quantitative industrial policy
+ firm dynamics
+ misallocation
+ China economy
```

### 3.2 不应定位为

不要直接称为：

```text
standard DSGE
pure empirical IO
BLP demand estimation
supplier innovation paper
corporate finance paper
```

这些定位都会使文章偏离宏观 JMP 的主线。

---

## 4. 参考文献分层

### 4.1 宏观理论母体

**Buera, Moll, and Shin (2013), “Well-Intended Policies”**

借鉴点：

- 政策初衷可以是纠正市场失灵；
- well-intended policy 可能短期提高产出；
- 如果政策不能随企业状态和产业状态调整，会形成 idiosyncratic distortions；
- 最终造成 aggregate productivity loss 和 misallocation。

本文不能机械复制 BMS，而是要把它改造成：

```text
state-contingent industrial policy
+ decentralized local implementation
+ multi-region policy competition
+ NEV / Other sectoral resource allocation
```

### 4.2 产业政策和进入/产能模板

**Barwick, Kalouptsidi, and Zahur, “Industrial Policy Implementation: Empirical Evidence from China’s Shipbuilding Industry”**

借鉴点：

- 中国产业政策；
- 企业进入；
- 投资和产能；
- 行业碎片化；
- 产能闲置；
- 政策工具反事实；
- welfare evaluation。

但注意：这篇更偏 empirical IO / dynamic industry model。本文不能只复制它，否则会偏 IO。本文要把它嵌入 macro GE / misallocation 框架。

### 4.3 多地区 / 空间配置参考

参考方向：Fajgelbaum / Gaubert / Zidar 等 spatial policy / spatial misallocation 文献。

借鉴点：

- observed decentralized allocation vs efficient allocation；
- 地区政策导致空间资源配置偏离；
- planner benchmark；
- welfare counterfactual。

### 4.4 生产网络扩展

参考方向：Ernest Liu, “Industrial Policies in Production Networks”。

借鉴点：

- 产业政策通过 input-output linkages 传导；
- 上游部门可能成为关键约束；
- 供应链和产业网络可作为 extension，不应一开始进入 core model。

---

## 5. 模型总原则

### 5.1 主模型必须简洁

基准模型只保留：

```text
R 个地区
NEV / Other 两部门
异质性企业
地方政府政策 wedge
企业进入、退出和产能投资
NEV 产品市场价格
产能利用率
资本市场和资源约束
planner benchmark
welfare counterfactual
```

### 5.2 不要在基准模型中放过多政策工具

不要写：

```text
entry subsidy
investment subsidy
land subsidy
industrial fund
R&D subsidy
infrastructure policy
exit policy
```

这会变成政策工具清单，不像宏观模型。

基准模型只写一个 reduced-form policy wedge：

\[
s_{r,t}\geq 0
\]

解释为：

> 地方政府对新能源汽车部门的有效扩张型产业政策强度。

它可以综合代表：

```text
补贴、土地、信贷支持、政府引导基金、园区、税费优惠、投资便利、招商支持
```

这些现实政策在实证中用于构造或校准 \(s_{r,t}\)，但不应逐项进入基准模型。

### 5.3 政策进入企业问题的方式

推荐二选一，基准不要同时放太多。

#### 方案 A：资本成本 wedge

\[
R^N_{r,t}=R_t-\phi s_{r,t}
\]

适合解释：

```text
投资扩张
产能建设
资本错配
MPK gap
```

#### 方案 B：进入成本 wedge

\[
F^N_{r,t}=F_0^N-\phi_F s_{r,t}
\]

适合解释：

```text
企业进入
车型进入
地方招商
园区扩张
```

#### 推荐

主模型可以先用资本成本 wedge；如果必须解释企业进入，则增加进入成本 wedge，但要控制参数数量。

---

## 6. State-contingent trade-off，而不是“早期好、后期坏”

### 6.1 不要写成

```text
早期政策有效，成熟后政策有害。
```

这太机械，也容易违背“产业政策动态因势利导”的正向叙事。

### 6.2 应写成

> 产业政策的福利效应取决于产业状态和政策工具是否匹配。政策的社会边际收益来自学习外部性、市场培育、基础设施和产业链协同；社会边际成本来自财政成本、重复进入、产能闲置、资本错配和地方间政策外部性。

状态变量：

\[
Z_t=(A_t^N,H_t^N,D_t^N,N_t^N,MPK_t^N-MPK_t^O)
\]

其中：

| 状态变量 | 含义 |
|---|---|
| \(A_t^N\) | NEV 技术能力 |
| \(H_t^N\) | NEV 产能 |
| \(D_t^N\) | NEV 有效需求 |
| \(N_t^N\) | 企业或车型数量 |
| \(MPK_t^N-MPK_t^O\) | NEV 与 outside sector 的资本边际回报差异 |

政策有效性条件：

\[
MB^{social}(s_{r,t};Z_t) \gtrless MC^{social}(s_{r,t};Z_t)
\]

当学习外部性强、需求增长快、市场未形成时，政策边际收益高；当产能高于需求、NEV 部门 MPK 低于 other sector、企业进入过多时，继续扩张型政策的边际成本上升。

---

## 7. Core model architecture

### 7.1 家庭

代表性家庭最大化：

\[
\max_{\{C_t,K_{t+1},L_t\}}\sum_{t=0}^{\infty}\beta^t u(C_t,L_t)
\]

预算约束：

\[
C_t+K_{t+1}=(1+r_t)K_t+w_tL_t+\Pi_t+T_t
\]

如果第一版过重，可以令劳动供给外生，但必须保留资源约束和福利。

### 7.2 两部门

部门：

\[
j\in\{N,O\}
\]

- \(N\)：新能源汽车部门；
- \(O\)：其他制造业 / outside sector。

两部门是必须的，因为没有 outside sector 就无法衡量资本机会成本和 MPK gap。

### 7.3 企业生产

企业 \(i\)、地区 \(r\)、部门 \(j\)：

\[
y^j_{i,r,t}=z_{i,t}A^j_{r,t}(k^j_{i,r,t})^{\alpha_j}(l^j_{i,r,t})^{1-\alpha_j}
\]

利润：

\[
\pi^j_{i,r,t}=p^j_t y^j_{i,r,t}-w_{r,t}l^j_{i,r,t}-R^j_{r,t}k^j_{i,r,t}-F^j_{r,t}
\]

政策进入 NEV 部门：

\[
R^N_{r,t}=r_t-\phi s_{r,t}
\]

或：

\[
F^N_{r,t}=F_0^N-\phi_Fs_{r,t}
\]

### 7.4 企业进入与退出

企业价值函数：

\[
V^j_{i,r,t}(z)=\max\left\{0,\pi^j_{i,r,t}(z)+\beta E_tV^j_{i,r,t+1}(z')\right\}
\]

进入 NEV 条件：

\[
V^N_{i,r,t}(z)\geq V^O_{i,r,t}(z)
\]

或：

\[
V^N_{i,r,t}(z)\geq F_0^N-\phi_Fs_{r,t}
\]

政策提高后，进入阈值下降：

\[
\frac{\partial \bar z^N_{r,t}}{\partial s_{r,t}}<0
\]

这解释低效率企业进入和过度进入。

### 7.5 产能动态

NEV 产能：

\[
H^N_{r,t+1}=(1-\delta_H)H^N_{r,t}+I^H_{r,t}
\]

产能约束：

\[
Q^N_{r,t}\leq H^N_{r,t}
\]

产能利用率：

\[
u^N_{r,t}=\frac{Q^N_{r,t}}{H^N_{r,t}}
\]

全国过剩产能：

\[
OC_t=\max\left\{0,\sum_rH^N_{r,t}-D^N_t\right\}
\]

### 7.6 NEV 产品市场

基准不要用 BLP。使用逆需求：

\[
P^N_t=\mathcal D(Q^N_t),\quad \mathcal D'(\cdot)<0
\]

其中：

\[
Q^N_t=\sum_rQ^N_{r,t}
\]

机制：

```text
地方政策提高 s_rt
→ 企业进入和产能扩张
→ Q^N_t 上升
→ P^N_t 下降
→ 利润压缩
→ 产能利用率下降
```

这已经足够表达价格战，不需要先上 BLP。

### 7.7 学习外部性

为了保留产业政策正向机制，加入 learning-by-doing：

\[
A^N_{r,t+1}=(1-\delta_A)A^N_{r,t}+\psi_L(Q^N_{r,t})^\nu+\psi_G\left(\sum_r Q^N_{r,t}\right)^\nu
\]

其中：

| 项 | 含义 |
|---|---|
| \(\psi_L(Q^N_{r,t})^\nu\) | 本地学习效应 |
| \(\psi_G(\sum_r Q^N_{r,t})^\nu\) | 全国性知识外溢 / 产业链协同 |

这样模型不是反产业政策，而是强调产业政策存在状态依赖的收益与成本。

---

## 8. 地方政府问题

地方政府选择 \(s_{r,t}\)：

\[
\max_{\{s_{r,t}\}}\sum_{t=0}^{\infty}\beta_g^t\left[
\omega_YY^N_{r,t}
+\omega_II^N_{r,t}
+\omega_EL^N_{r,t}
+\omega_TTax_{r,t}
-\frac{\kappa_s}{2}s^2_{r,t}
-\frac{\chi_s}{2}(s_{r,t}-s_{r,t-1})^2
\right]
\]

重点：地方政府内部化本地收益，但不完全内部化：

```text
全国性过剩产能
部门间资本错配
其他地区重复建设
全国财政机会成本
供应链创新损失
```

因此：

\[
s^D_{r,t}>s^P_{r,t}
\]

其中：

- \(D\)：decentralized equilibrium；
- \(P\)：planner allocation。

### 8.1 政策调整和退出

不要假定政策固定不变，也不要假定地方政府永远不退出。应写成有调整摩擦的状态依赖政策：

\[
s_{r,t}=\rho_s s_{r,t-1}+(1-\rho_s)\tilde s_{r,t}
\]

其中：

\[
\tilde s_{r,t}=\arg\max V^L_{r,t}
\]

含义：

```text
政策会调整
但存在惯性
地方政府退出慢于 planner
地方政府不愿率先退出
招商协议、产业基金、园区、地方债和基础设施形成政策调整成本
```

---

## 9. Planner benchmark

Planner 不是 no-policy benchmark。Planner 是：

> **centralized state-contingent industrial policy benchmark**

Planner 最大化：

\[
\max \sum_{t=0}^{\infty}\beta^t U(C_t,L_t)
\]

subject to:

```text
生产函数
企业进入退出
资本积累
产能动态
NEV 需求
学习外部性
政府预算约束
资源约束
市场出清
```

不要在最终 quantitative welfare 里随意加入：

\[
+\Omega_AA_t-\Omega_{OC}OC_t-\Omega_MMisallocation_t
\]

这些可以在 conceptual exposition 中用，但正式 welfare 应尽量通过 household utility、resource constraint、policy cost、idle capacity cost 和 productivity dynamics 内生化。

---

## 10. Decentralized equilibrium definition

Codex 后续应创建一个 `equilibrium_definitions.md`，包含下面定义。

给定初始状态：

\[
\{K_0,H^N_{r,0},A^N_{r,0},z_{i,0},s_{r,-1}\}_{r,i}
\]

一个 decentralized equilibrium 是价格、政策和配置路径：

\[
\{C_t,K_{t+1},w_{r,t},r_t,P^N_t,s_{r,t},Q^N_{r,t},H^N_{r,t},N^N_{r,t}\}_{t=0}^{\infty}
\]

满足：

1. 家庭最大化效用；
2. 企业选择部门、地区、进入、退出、资本、劳动和产能投资以最大化价值；
3. 地方政府在给定其他地区政策下最大化本地目标；
4. 产品市场、资本市场、劳动市场清算；
5. 产能和技术动态满足；
6. 政府预算约束满足；
7. 地方政策构成 Markov-Nash equilibrium：

\[
s^D_{r,t}=BR_r(s^D_{-r,t};Z_t)
\]

---

## 11. 核心命题

### Proposition 1：状态依赖的产业政策收益

当 NEV 部门存在学习外部性，且技术、需求和产业链协同不足时，适度产业政策可以提高动态福利。

形式上：

\[
\psi_L>0,\ \psi_G>0
\]

且：

\[
MB^{social}(s_{r,t};Z_t)>MC^{social}(s_{r,t};Z_t)
\]

则：

\[
W^{policy}>W^{no\ policy}
\]

### Proposition 2：地方分散化导致过度政策支持

如果地方政府对本地 NEV 投资、产值、就业和税基赋予正权重，但不完全内部化全国性产能过剩和部门间资本错配，则：

\[
s^D_{r,t}>s^P_{r,t}
\]

### Proposition 3：过度政策导致过度进入和产能扩张

由于政策降低进入阈值和资本成本：

\[
\frac{\partial \bar z^N_{r,t}}{\partial s_{r,t}}<0
\]

分散均衡下：

\[
N^{N,D}_{r,t}>N^{N,P}_{r,t}
\]

\[
H^{N,D}_{r,t}>H^{N,P}_{r,t}
\]

### Proposition 4：过度产能导致低利用率、价格压缩和 MPK gap

当：

\[
\sum_rH^{N,D}_{r,t}>D^N_t
\]

则：

\[
u^{N,D}_{r,t}<u^{N,P}_{r,t}
\]

\[
P^{N,D}_t<P^{N,P}_t
\]

\[
MPK^{N,D}_{r,t}<MPK^{O,D}_{r,t}
\]

### Proposition 5：分散化政策导致 welfare loss

如果政策成本、产能闲置和资本错配的社会成本超过学习和消费者低价收益，则：

\[
W^D<W^P
\]

---

## 12. 供应链与创新模块：只作为 extension / amplification

### 12.1 不要作为主模型中心

供应链金融摩擦和供应商创新很重要，但如果它们成为主模型中心，论文会变成 applied micro / corporate finance。

### 12.2 推荐定位

供应链模块用于解释：

> aggregate overcapacity and price compression 如何沿供应链传导，并产生长期 productivity consequences。

### 12.3 简洁机制

OEM 现金流：

\[
CF^O_{j,t}=\Pi^O_{j,t}+Liquidity_{j,t}
\]

付款周期：

\[
T_{s,j,t}=T_0+\phi_1PriceWar_{j,t}+\phi_2BargainingPower_j-\phi_3BargainingPower_s
\]

供应商现金流：

\[
CF^S_{s,t}=Revenue_{s,t}-Cost_{s,t}-Receivables_{s,t}
\]

创新质量：

\[
q_{s,t+1}=(1-\delta_q)q_{s,t}+A_sR_{s,t}^{\eta}
\]

现金流约束：

\[
R_{s,t}\leq \lambda CF^S_{s,t}
\]

机制：

```text
PriceWar ↑
→ OEM margin ↓
→ payment period ↑ / procurement pressure ↑
→ supplier cash flow ↓
→ R&D ↓
→ innovation quality ↓
```

---

## 13. BLP 不应作为主模型

不要一开始做 BLP。原因：

1. BLP 会把论文重心带到 demand estimation；
2. 数据要求极高，尤其是真实成交价、车型特征、市场规模和工具变量；
3. 与总量资源错配主线不完全一致；
4. 会使论文同时承担 BLP、产业政策、供应链和创新四套任务，过重。

基准使用：

```text
inverse demand
或 simple differentiated Bertrand / nested logit extension
```

BLP 只能作为后续独立 paper 或 appendix。

---

## 14. Quantification moments

Codex 后续应创建 `moments_and_data_plan.md`。

### 14.1 政策—进入弹性

目标参数：\(\phi_F\)

Moment：

\[
\frac{\partial Entry^N_{r,t}}{\partial s_{r,t}}
\]

数据：

```text
地方政策文本
企业注册
整车企业进入
零部件企业进入
车型投放
园区和招商项目
```

### 14.2 政策—投资 / 产能弹性

目标参数：\(\phi_I\) 或 \(\phi\)

Moment：

\[
\frac{\partial I^H_{r,t}}{\partial s_{r,t}}
\]

数据：

```text
产能公告
企业 capex
在建工程
固定资产投资
整车产能
电池产能
```

### 14.3 产能利用率

Moment：

\[
u^N_{r,t}=\frac{Q^N_{r,t}}{H^N_{r,t}}
\]

用于验证：政策强地区是否出现更低 utilization。

### 14.4 MPK / MRPK gap

计算：

\[
MPK_{i,t}=\alpha \frac{VA_{i,t}}{K_{i,t}}
\]

核心事实：

```text
NEV 部门 MPK 是否低于 Other sector？
政策强地区 NEV MPK 是否下降更明显？
MRPK dispersion 是否上升？
```

### 14.5 需求弹性

第一版不要 BLP，可用车型级或企业级简化需求：

\[
\log Q_{m,t}=-\epsilon_D\log P_{m,t}+X_{m,t}\theta+\alpha_m+\lambda_t+\varepsilon_{m,t}
\]

### 14.6 学习外部性

目标参数：\(\psi_L,\psi_G,\nu\)

Proxy：

```text
TFP
单位成本下降
累计产量
专利质量
产业集群规模
供应链协同 proxy
```

### 14.7 政策成本

目标参数：\(\kappa_s\)

数据：

```text
地方补贴
产业基金
土地优惠
贷款贴息
税费优惠
充电基础设施支出
```

### 14.8 地方政府目标权重

参数：

\[
\omega_Y,\omega_I,\omega_E,\omega_T
\]

可用政策反应函数校准：

\[
s_{r,t}=\theta_1Y^N_{r,t-1}+\theta_2I^N_{r,t-1}+\theta_3Employment^N_{r,t-1}+\theta_4FiscalCapacity_{r,t-1}+\alpha_r+\lambda_t+\varepsilon_{r,t}
\]

---

## 15. Counterfactuals

### CF1：No local industrial policy competition

设：

\[
s_{r,t}=0
\]

或只保留中央统一政策。

输出：

```text
NEV entry
capacity
price
consumer surplus
firm profit
fiscal cost
utilization
welfare
```

### CF2：Centralized state-contingent planner policy

Planner 选择：

\[
\{s_{r,t}\}_{r=1}^R
\]

最大化全国福利。

这是最重要的 counterfactual。

输出：

```text
最优地区产能分布
最优政策强度
相对于分散均衡的福利增益
MPK gap 降低
产能利用率提高
财政成本节约
```

### CF3：Subsidy cap / anti-duplication policy

设：

\[
s_{r,t}\leq \bar s
\]

或：

\[
H^N_{r,t}\leq \bar H^N_{r,t}
\]

用于分析地方补贴竞争和重复产能治理。

### CF4：Faster exit / consolidation

降低退出摩擦或提高低效率企业退出概率。

输出：

```text
企业数量下降
平均生产率上升
价格可能上升
产能利用率上升
总福利变化
```

### CF5：Supply-chain amplification off

关闭供应链账期和供应商创新模块，比较 welfare / productivity loss。

目的：

> 区分 direct misallocation cost 与 supply-chain amplification cost。

---

## 16. Codex 文件结构建议

请 Codex 按以下结构整理项目 notes：

```text
/notes
  00_project_positioning.md
  01_model_core_memo.md
  02_equilibrium_definitions.md
  03_propositions.md
  04_moments_and_data_plan.md
  05_counterfactuals.md
  06_supply_chain_extension.md
  07_not_to_do.md
  08_literature_mapping.md
```

### 16.1 `00_project_positioning.md`

内容：

```text
JMP 定位
不是传统 DSGE
不是纯 IO
不是供应商创新 paper
而是 quantitative dynamic GE / macro-development / spatial industrial policy paper
```

### 16.2 `01_model_core_memo.md`

内容：

```text
家庭
企业
地方政府
NEV / Other 两部门
产能动态
逆需求
学习外部性
政策 wedge
资源约束
```

### 16.3 `02_equilibrium_definitions.md`

内容：

```text
Decentralized equilibrium
Planner allocation
Market clearing
Policy Nash equilibrium
State variables
Control variables
```

### 16.4 `03_propositions.md`

内容：

```text
Proposition 1: 状态依赖政策收益
Proposition 2: 地方政策过度支持
Proposition 3: 过度进入和产能过剩
Proposition 4: MPK gap and price compression
Proposition 5: welfare loss
```

### 16.5 `04_moments_and_data_plan.md`

内容：

```text
参数
moments
数据源
实证 proxy
校准策略
需要优先核查的数据
```

### 16.6 `05_counterfactuals.md`

内容：

```text
No local policy competition
Central planner
Subsidy cap
Faster exit
Supply-chain amplification off
```

### 16.7 `06_supply_chain_extension.md`

内容：

```text
OEM price compression
payment delay
supplier cash flow
R&D constraint
innovation quality
作为 amplification channel，不进入主模型中心
```

### 16.8 `07_not_to_do.md`

明确禁止：

```text
不要一开始做 BLP
不要写六个政策工具
不要把供应链创新放成主线
不要写成早期好、后期坏
不要写成地方政府单方面造成内卷
不要忽略企业理性进入
不要没有 outside sector
不要没有 planner benchmark
不要没有 welfare counterfactual
```

### 16.9 `08_literature_mapping.md`

内容：

```text
Buera-Moll-Shin: macro mother model
Barwick-Kalouptsidi-Zahur: industry policy / entry / capacity model
Fajgelbaum-Gaubert-Zidar: spatial misallocation / policy allocation
Hsieh-Klenow / Restuccia-Rogerson: misallocation and TFP
Ernest Liu: production network extension
```

---

## 17. Codex immediate task list

### Task 1：重写项目一句话

旧版：

```text
地方政府政策竞争导致价格战，并通过供应链影响创新。
```

新版：

```text
This project studies how decentralized local implementation of industrial policy generates over-entry, excess capacity, price compression, and aggregate capital misallocation in China’s NEV industry, and how supply-chain financial frictions amplify the productivity consequences.
```

中文：

```text
本项目研究地方分散化产业政策如何在新能源汽车产业中导致过度进入、产能过剩、价格压缩和总量资本错配，并进一步分析供应链金融摩擦如何放大其长期生产率后果。
```

### Task 2：把所有 notes 中“价格战—供应商创新”降级

把它从主线改为：

```text
supply-chain amplification mechanism
```

### Task 3：建立 `core_model` notes

核心必须包括：

```text
policy wedge
entry/capital distortion
capacity accumulation
inverse demand
local government Nash
planner benchmark
resource constraint
welfare comparison
```

### Task 4：建立 `extension` notes

扩展包括：

```text
supply-chain payment delay
supplier cash-flow constraint
innovation quality
```

### Task 5：建立 `not_to_do` notes

明确：

```text
No BLP as main model.
No six-policy-vector in baseline.
No pure IO framing.
No pure DSGE label.
No anti-local-government tone.
No policy-never-exits assumption.
```

---

## 18. 最终研究宣言

建议在 proposal / README 顶部写：

> **This paper studies decentralized industrial policy in a multi-region economy. Local governments compete to attract investment in a strategic industry by lowering firms’ effective entry and capital costs. Firms respond by entering, expanding capacity, and competing in the product market. While such policies can be welfare-improving when learning and coordination externalities are strong, decentralized implementation may fail to adjust once capacity exceeds effective demand. Because local governments internalize local output, investment, employment, and tax-base gains but not national overcapacity and capital misallocation, the decentralized equilibrium features excessive NEV entry, low capacity utilization, price compression, and a lower marginal product of capital in NEV relative to the outside sector. I quantify the welfare cost of decentralized implementation relative to a centralized state-contingent industrial policy benchmark and study how supply-chain financial frictions amplify the productivity consequences.**

中文：

> **本文研究多地区经济中的分散化产业政策。地方政府通过降低企业进入成本和资本成本来竞争吸引战略性产业投资，企业则理性进入、扩产并在产品市场中竞争。产业政策在学习外部性和产业链协同外部性较强时可以提高福利，但当产能超过有效需求后，地方分散化执行可能无法及时调整扩张型政策。由于地方政府内部化本地投资、产值、就业和税基收益，却不完全内部化全国性产能过剩和资本错配，分散均衡会出现过度进入、低产能利用率、价格压缩和 NEV 部门相对于 outside sector 更低的资本边际产出。本文将量化分散化执行相对于中央协调的状态依赖产业政策基准的福利成本，并进一步分析供应链金融摩擦如何放大长期生产率后果。**

---

## 19. 最终执行原则

Codex 后续修改所有文件时，应遵循三条原则：

1. **宏观主干优先**：任何机制都必须服务 aggregate misallocation / welfare / planner comparison。
2. **企业行为必须保留**：企业不是被动接受政策；企业会理性进入、扩产、定价和转嫁压力。
3. **供应链机制从属**：供应链账期和创新质量是 amplification channel，而不是 JMP 主模型中心。

一句话总结：

> **这个项目可以成为北美宏观 JMP，但只能在“可求解、可量化、可做 welfare counterfactual 的动态一般均衡模型”框架下成立；IO 和供应链机制是关键补充，不是主干。**

---

## 20. References for Codex

- Buera, Francisco J., Benjamin Moll, and Yongseok Shin. 2013. “Well-Intended Policies.” *Review of Economic Dynamics*, 16(1): 216–230. DOI: 10.1016/j.red.2012.10.008.
- Barwick, Panle Jia, Myrto Kalouptsidi, and Nahim Bin Zahur. “Industrial Policy Implementation: Empirical Evidence from China’s Shipbuilding Industry.” *Review of Economic Studies*, 92(6): 3611–3648.
- Hsieh, Chang-Tai, and Peter J. Klenow. 2009. “Misallocation and Manufacturing TFP in China and India.” *Quarterly Journal of Economics*.
- Restuccia, Diego, and Richard Rogerson. 2008 / 2013. Misallocation and productivity literature.
- Fajgelbaum, Pablo, and Cecile Gaubert. 2020. “Optimal Spatial Policies, Geography, and Sorting.” *Quarterly Journal of Economics*.
- Fajgelbaum, Morales, Suárez Serrato, and Zidar. “State Taxes and Spatial Misallocation.”
- Liu, Ernest. 2019. “Industrial Policies in Production Networks.” *Quarterly Journal of Economics*.

