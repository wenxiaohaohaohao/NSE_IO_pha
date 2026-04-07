# MAH、企业组织重构与原研药创新：融合新结构经济学思想的完整模型版本

## 1. 模型目标

这一版模型的目标，是在不偏离本文原有故事的前提下，把新结构经济学所强调的“有效市场”与“有为政府”共同作用，以及“适宜发展阶段的制度安排内生于产业结构需求”这一思想，系统地融合进已有的 `MAH` 行业均衡模型中。

最核心的要求有两个：

1. 新结构经济学不能只是引言里的口号，而要在模型中有清楚的位置；
2. 新结构经济学也不能把模型带向一个完全不同的方向，而应当成为现有 `A/B/C` 组织状态、invention/implementation 机制和行业均衡框架的上层解释。

因此，本版本模型采取如下整合方式：

- 用一个**发展阶段参数** `\xi` 来刻画产业结构、能力结构与制度需求；
- 用一个**制度适配函数** `\Lambda(z,\xi)` 来刻画制度安排与企业能力结构是否匹配；
- 用一个**政府制度选择问题**来表达“有为政府”如何提供适宜制度；
- 用企业在 `A/B/C` 之间的内生进入、退出与状态转移来表达“有效市场”如何在新制度边界下进行资源配置；
- 用 invention/implementation 的分离来刻画 `MAH` 如何促进原研药创新。

因此，这一版模型仍然是：

**`Hopenhayn` 式行业动态壳 + invention/implementation 机制 + `MAH` 组织重构机制**

但其上层解释被明确写成：

**发展阶段 `\xi` 决定制度需求，政府通过 `MAH` 提供制度供给，市场通过企业分化和组织重构实现资源重新配置。**

## 2. 新结构经济学与本文的统一逻辑

为了避免两套语言相互抵触，本文把新结构经济学的核心命题翻译成三个可以进入模型的对象：

### 2.1 发展阶段与产业升级需求

设 `\xi \in \Xi \subset \mathbb{R}_+` 表示地区或行业所处的发展阶段。更高的 `\xi` 表示：

- 产业从仿制导向更接近原研导向；
- 研发、项目推进和专业化分工的需求更强；
- 对“持证/研发主体可以不自建全部产能”的制度安排需求更高。

因此，`\xi` 不是企业自己控制的决策变量，而是一个缓慢变化的、由经济体禀赋结构、产业基础和升级阶段共同决定的环境参数。

### 2.2 有为政府

政府不直接替企业决定创新方向，而是在给定发展阶段 `\xi` 的条件下，选择更适宜于产业升级需求的制度安排。本文把制度安排记为：

\[
M \in \{0,1\},
\]

其中：

- `M=0` 表示改革前制度；
- `M=1` 表示 `MAH` 制度。

政府的作用在模型中体现为：`M` 改变企业面临的制度摩擦。

### 2.3 有效市场

市场机制体现在：

- 企业根据自身能力 `z` 和制度环境 `M` 选择进入、退出、创新与组织状态；
- `B` 型企业与 `C` 型企业通过委托生产市场进行分工；
- 行业在大量企业最优决策下形成新的稳态分布。

因此，新结构经济学在本文中的整合不是“政府最优化替代市场最优化”，而是：

\[
\text{发展阶段 } \xi
\rightarrow
\text{政府制度供给 } M
\rightarrow
\text{市场中企业的内生组织重构与创新反应}.
\]

## 3. 经济环境

时间离散，`t=0,1,2,\ldots`。

行业中存在三类活跃企业和一类潜在进入者：

- `A` 型：研发与生产一体化企业；
- `B` 型：研发专门化企业；
- `C` 型：生产专门化企业；
- `E` 型：潜在进入者。

每个活跃企业进入当期时拥有一个能力状态

\[
z \in Z \subset \mathbb{R}_+.
\]

这里的 `z` 表示企业综合能力，包括：

- 研发能力；
- 原研药项目推进能力；
- 组织协同能力；
- 商业化与重组能力。

这一设定与新结构经济学并不冲突。因为在本文中，企业是否能够从制度改革中受益，本来就取决于企业自身能力结构是否与新的制度安排相匹配。

## 4. 制度适配函数：把“制度是否适宜发展阶段”写进模型

设

\[
\Lambda(z,\xi) = z^{\alpha}\xi^{\nu},
\qquad \alpha>0,\ \nu>0.
\]

`\Lambda(z,\xi)` 称为**制度适配函数**，它表示在给定发展阶段 `\xi` 下，能力为 `z` 的企业能在多大程度上把制度改革转化为实际创新和组织重构收益。

该函数有两个基本性质：

\[
\frac{\partial \Lambda}{\partial z} > 0,
\qquad
\frac{\partial \Lambda}{\partial \xi} > 0.
\]

含义分别是：

- 企业能力越强，越能利用制度改革；
- 发展阶段越高，制度改革越“适宜”当前产业升级需求。

这一步就是新结构经济学与现有模型结合的关键。它意味着：

- `MAH` 并不是对所有企业、所有地区都产生同样的效果；
- `MAH` 的创新促进作用取决于制度安排与企业能力结构、产业升级阶段之间的匹配程度。

## 5. 制度摩擦与组织重构成本

### 5.1 商业化摩擦

设 `B` 型企业在 `M` 制度下的制度性商业化摩擦为

\[
\tau(z,\xi,M) = \bar{\tau} - M\Delta_{\tau}\Lambda(z,\xi),
\qquad \bar{\tau}>0,\ \Delta_{\tau}>0.
\]

于是：

- 当 `M=0` 时，`\tau(z,\xi,0)=\bar{\tau}`；
- 当 `M=1` 时，`\tau(z,\xi,1)=\bar{\tau}-\Delta_{\tau}\Lambda(z,\xi)`。

因此，

\[
\frac{\partial \tau}{\partial M} = -\Delta_{\tau}\Lambda(z,\xi) < 0,
\]

\[
\frac{\partial^2 \tau}{\partial M \partial \xi} = -\Delta_{\tau}\frac{\partial \Lambda}{\partial \xi}<0.
\]

第二个不等式意味着：

> 随着发展阶段 `\xi` 上升，`MAH` 对降低商业化摩擦的作用更强。

这正对应新结构经济学里的“适宜制度安排在更匹配的发展阶段上效果更强”。

### 5.2 组织重构成本

设企业从组织状态 `s` 转向 `j` 的重构成本为

\[
\kappa_{sj}(z,\xi,M)

=
\bar{\kappa}_{sj}
- M\Delta_{sj}\Lambda(z,\xi),
\qquad \Delta_{sj}>0.
\]

于是：

\[
\frac{\partial \kappa_{sj}}{\partial M} < 0,
\qquad
\frac{\partial^2 \kappa_{sj}}{\partial M\partial \xi} < 0.
\]

含义是：

- `MAH` 降低企业在 `A/B/C` 之间转换的制度门槛；
- 当行业发展阶段更高、企业能力更强时，这种降低更容易转化为真实的组织重构。

## 6. 三类企业的流量收益

本文中的 innovation object 统一解释为**原研药创新**。

### 6.1 `A` 型企业：一体化企业

给定 `z`、`\xi` 和工资 `w`，`A` 型企业选择原研药创新强度 `x_A \ge 0`，其流量收益为

\[
\pi_A(z,\xi;w)
=
\bar{\pi}_A(z,\xi;w)
- f_A
+ x_A\Omega_A(z,\xi)
- \frac{\chi_A}{\eta}x_A^{\eta},
\qquad \eta>1.
\]

其中：

- `\bar{\pi}_A(z,\xi;w)` 是一体化生产经营利润；
- `\Omega_A(z,\xi)` 是单位原研创新强度的边际价值；
- `\chi_A` 是创新成本参数。

#### 6.1.1 最优创新强度推导

`A` 型企业解：

\[
\max_{x_A\ge 0}
\left\{
x_A\Omega_A(z,\xi)-\frac{\chi_A}{\eta}x_A^\eta
\right\}.
\]

一阶条件为

\[
\Omega_A(z,\xi)-\chi_A x_A^{\eta-1}=0.
\]

因此：

\[
x_A^*(z,\xi)
=
\left(
\frac{\Omega_A(z,\xi)}{\chi_A}
\right)^{\frac{1}{\eta-1}}.
\]

将其代回得最优流量收益：

\[
\Pi_A(z,\xi;w)
=
\bar{\pi}_A(z,\xi;w)
- f_A
+ \frac{\eta-1}{\eta}\chi_A^{-\frac{1}{\eta-1}}
\Omega_A(z,\xi)^{\frac{\eta}{\eta-1}}.
\]

### 6.2 `B` 型企业：研发专门化企业

`B` 型企业选择 idea generation 强度 `x_B \ge 0`，但 idea 本身并不自动成为创新产出。设每个 idea 的净价值为 `\Psi_B(z,\xi;p_m,M)`，则 `B` 型企业流量收益为

\[
\pi_B(z,\xi;p_m,M)
=
-f_B
+ x_B\Psi_B(z,\xi;p_m,M)
- \frac{\chi_B}{\eta}x_B^\eta.
\]

#### 6.2.1 最优 idea generation 推导

`B` 型企业解：

\[
\max_{x_B\ge 0}
\left\{
x_B\Psi_B(z,\xi;p_m,M)-\frac{\chi_B}{\eta}x_B^\eta
\right\}.
\]

一阶条件为

\[
\Psi_B(z,\xi;p_m,M)-\chi_B x_B^{\eta-1}=0.
\]

因此：

\[
x_B^*(z,\xi;p_m,M)
=
\left(
\frac{\Psi_B(z,\xi;p_m,M)}{\chi_B}
\right)^{\frac{1}{\eta-1}}
\quad \text{if } \Psi_B>0.
\]

代回得最优流量收益：

\[
\Pi_B(z,\xi;p_m,M)
=
-f_B
+ \frac{\eta-1}{\eta}\chi_B^{-\frac{1}{\eta-1}}
\Psi_B(z,\xi;p_m,M)^{\frac{\eta}{\eta-1}}.
\]

### 6.3 `C` 型企业：生产专门化企业

`C` 型企业提供委托生产服务。若其服务供给量为 `m \ge 0`，则流量收益为

\[
\pi_C(z,\xi;p_m,w)
=
p_m m - c(m,z,\xi;w) - f_C,
\]

其中 `c_m>0,c_{mm}>0,c_z<0`。

最优供给为

\[
m^*(z,\xi;p_m,w)
=
\arg\max_{m\ge 0}
\left\{
p_m m-c(m,z,\xi;w)-f_C
\right\},
\]

相应最优利润为

\[
\Pi_C(z,\xi;p_m,w)
=
\max_{m\ge 0}
\left\{
p_m m-c(m,z,\xi;w)-f_C
\right\}.
\]

## 7. invention 与 implementation 的分离

这是整合 `FRS` 思想的核心，也是 `MAH` 发挥作用的最直接位置。

### 7.1 外包实施

若 `B` 型企业生成一个 idea 后选择委托 `C` 型企业生产，则选择 implementation 强度 `i_O \in [0,1]`，每个 idea 的净价值为

\[
\Psi_B^O(z,\xi;p_m,M)
=
\max_{i_O\in[0,1]}
\left\{
i_O R_O(z,\xi)
- \frac{\kappa_O}{\theta}i_O^\theta
- p_m
- \tau(z,\xi,M)
\right\},
\qquad \theta>1.
\]

#### 7.1.1 最优外包 implementation 强度推导

一阶条件为

\[
R_O(z,\xi)-\kappa_O i_O^{\theta-1}=0.
\]

于是：

\[
i_O^*(z,\xi)
=
\left(
\frac{R_O(z,\xi)}{\kappa_O}
\right)^{\frac{1}{\theta-1}}.
\]

代回可得：

\[
\Psi_B^O(z,\xi;p_m,M)
=
\frac{\theta-1}{\theta}\kappa_O^{-\frac{1}{\theta-1}}
R_O(z,\xi)^{\frac{\theta}{\theta-1}}
- p_m
- \tau(z,\xi,M).
\]

对制度变量求导：

\[
\frac{\partial \Psi_B^O}{\partial M}
=
-\frac{\partial \tau}{\partial M}
=
\Delta_{\tau}\Lambda(z,\xi)
>0.
\]

对发展阶段求偏导：

\[
\frac{\partial^2 \Psi_B^O}{\partial M \partial \xi}
=
\Delta_{\tau}\frac{\partial \Lambda}{\partial \xi}
>0.
\]

这说明：

> `MAH` 对 `B` 型企业外包商业化价值的提升，在更高发展阶段上更强。

这就是新结构经济学视角在 implementation 方程中的直接体现。

### 7.2 内部整合实施

若 `B` 型企业选择转为 `A` 型企业后内部实施，则每个 idea 的净价值为

\[
\Psi_B^I(z,\xi;M)
=
\max_{i_I\in[0,1]}
\left\{
i_I R_I(z,\xi)
- \frac{\kappa_I}{\theta}i_I^\theta
- \kappa_{BA}(z,\xi,M)
\right\}.
\]

一阶条件为

\[
R_I(z,\xi)-\kappa_I i_I^{\theta-1}=0,
\]

故：

\[
i_I^*(z,\xi)
=
\left(
\frac{R_I(z,\xi)}{\kappa_I}
\right)^{\frac{1}{\theta-1}}.
\]

代回得：

\[
\Psi_B^I(z,\xi;M)
=
\frac{\theta-1}{\theta}\kappa_I^{-\frac{1}{\theta-1}}
R_I(z,\xi)^{\frac{\theta}{\theta-1}}
- \kappa_{BA}(z,\xi,M).
\]

### 7.3 `B` 型企业每个 idea 的总价值

因此，

\[
\Psi_B(z,\xi;p_m,M)
=
\max\left\{
\Psi_B^O(z,\xi;p_m,M),
\Psi_B^I(z,\xi;M),
0
\right\}.
\]

这就是本文最核心的机制变量。

它体现了三个层次：

1. `FRS` 思想：innovation 不是 invention 自动等于产出，而是要经过 implementation；
2. `MAH` 思想：制度允许研发主体在不完全内生生产能力的情况下实现商业化；
3. 新结构经济学思想：制度改革的作用强弱取决于制度供给是否与发展阶段和企业能力结构相匹配。

## 8. 组织形式选择与状态转移

### 8.1 组织状态

企业当前组织状态 `s \in \{A,B,C\}`。

可行的下一期状态集合为：

- `A`: `\{A,B,C,\text{exit}\}`
- `B`: `\{B,A,\text{exit}\}`
- `C`: `\{C,A,\text{exit}\}`

记为 `\mathcal J(s)`。

### 8.2 系统性选择价值

若企业当前类型为 `s`，选择下一期为 `j \in \mathcal J(s)`，则系统性价值为

\[
\bar V_{sj}(z,\xi;M)
=
\Pi_j(z,\xi;M)
- \kappa_{sj}(z,\xi,M)
+ \beta E[V_j(z',\xi;M)\mid z,s,j].
\]

若 `j=s`，则 `\kappa_{ss}=0`；若 `j=\text{exit}`，则价值规范化为零。

### 8.3 带极值扰动的动态离散选择

设企业选择时还受到 i.i.d. type-I extreme value shocks `\varepsilon_{sj}` 影响，则 Bellman 方程为

\[
V_s(z,\xi;M)
=
E_{\varepsilon}
\left[
\max_{j\in\mathcal J(s)}
\left\{
\bar V_{sj}(z,\xi;M)+\varepsilon_{sj}
\right\}
\right].
\]

根据标准 logit 结果，

\[
V_s(z,\xi;M)
=
\sigma \ln\left(
\sum_{j\in\mathcal J(s)}
\exp\left(\frac{\bar V_{sj}(z,\xi;M)}{\sigma}\right)
\right).
\]

相应组织转移概率为

\[
P_{sj}(z,\xi;M)
=
\frac{
\exp\left(\bar V_{sj}(z,\xi;M)/\sigma\right)
}{
\sum_{\ell\in\mathcal J(s)}
\exp\left(\bar V_{s\ell}(z,\xi;M)/\sigma\right)
}.
\]

### 8.4 制度适配与重组概率

因为

\[
\frac{\partial \kappa_{sj}}{\partial M}<0,
\qquad
\frac{\partial^2 \kappa_{sj}}{\partial M\partial \xi}<0,
\]

所以对于关键转移方向，例如 `A->B`、`A->C`、`B->A`、`C->A`，有：

\[
\frac{\partial P_{sj}}{\partial M}>0,
\]

且在一般条件下

\[
\frac{\partial^2 P_{sj}}{\partial M\partial \xi}>0.
\]

这表示：

> 在更适宜的产业发展阶段上，`MAH` 对组织重构的激励更强。

## 9. 进入、退出与行业分布

### 9.1 潜在进入者

潜在进入者初始能力服从分布 `G(z_0)`。在本基准版本中，进入者可选择以 `B` 或 `C` 身份进入。

自由进入条件为：

\[
\int V_B(z_0,\xi;M)\,dG(z_0)\le c_{EB},
\]

\[
\int V_C(z_0,\xi;M)\,dG(z_0)\le c_{EC}.
\]

若存在正进入，则取等号。

由于 `V_B` 对 `M` 和 `\xi` 的响应由 `\Psi_B` 驱动，因此“制度是否适宜发展阶段”会通过进入边际体现出来：

\[
\frac{\partial V_B}{\partial M}>0,
\qquad
\frac{\partial^2 V_B}{\partial M\partial \xi}>0.
\]

这意味着：

- `MAH` 越适宜当前发展阶段，研发型进入越强；
- 企业分化会更多地表现为 `E->B` 与 `A/B/C` 重组，而不只是存量企业做更多创新。

### 9.2 委托生产市场清算

`B` 型企业的总外包需求为

\[
D_m(p_m,\xi;M)
=
\int x_B^*(z,\xi;p_m,M)\,d_O(z,\xi;p_m,M)\,\mu_B(dz),
\]

其中 `d_O(\cdot)` 表示 `B` 型企业选择外包 implementation 的比例。

`C` 型企业总供给为

\[
S_m(p_m,\xi;w)
=
\int m^*(z,\xi;p_m,w)\,\mu_C(dz).
\]

市场清算条件为

\[
D_m(p_m,\xi;M)=S_m(p_m,\xi;w).
\]

### 9.3 稳态分布

记稳态分布为 `(\mu_A,\mu_B,\mu_C)`。其满足：

\[
\mu_j'(B)
=
\sum_{s\in\{A,B,C\}}
\int_Z
P_{sj}(z,\xi;M)
F_j(B\mid z,s,j,\xi)
\mu_s(dz)
+ \text{Entry}_j(B),
\]

对任意可测集合 `B \subseteq Z` 成立，并要求 `\mu_j'=\mu_j`。

## 10. 原研药创新、福利与净效应

### 10.1 原研药创新总量

本文的创新对象统一限定为原研药创新。行业总原研药 innovation generation 为

\[
X(M,\xi)
=
\int x_A^*(z,\xi)\mu_A(dz)
+ \int x_B^*(z,\xi;p_m,M)\mu_B(dz).
\]

### 10.2 implementation rate

\[
H(M,\xi)
=
\frac{
\int x_B^*(z,\xi;p_m,M)i_B^*(z,\xi;p_m,M)\mu_B(dz)
}{
\int x_B^*(z,\xi;p_m,M)\mu_B(dz)
}.
\]

### 10.3 原研药创新产出

\[
\mathcal I(M,\xi)
=
\int \Gamma_A(z,\xi)x_A^*(z,\xi)\mu_A(dz)
+ \int \Gamma_B(z,\xi)x_B^*(z,\xi;p_m,M)i_B^*(z,\xi;p_m,M)\mu_B(dz).
\]

其中：

- `\Gamma_A`、`\Gamma_B` 表示把创新强度映射为原研药创新产出的技术系数；
- 创新数量、创新质量和创新结构都应对应原研药创新对象。

### 10.4 福利

代表性消费者福利写为

\[
W(M,\xi)=\frac{\ln C(M,\xi)}{1-\beta}.
\]

或者更一般地，写为行业净福利函数

\[
\mathcal W(M,\xi)
=
W(M,\xi)-\mathcal F(M),
\]

其中 `\mathcal F(M)` 是制度改革固定成本。

在该框架中，福利主要受到三项力量共同影响：

- 原研药创新上升的正影响；
- 企业分化与资源重配置的正影响；
- 传统生产侧生产者剩余损失与组织调整成本的负影响。

因此：

\[
\text{sign}\left(\mathcal W(1,\xi)-\mathcal W(0,\xi)\right)
\]

并不由创新数量变化的符号自动决定。

在当前写作版本中，这一福利框架只保留上述三项主力量。由于模型尚未显式刻画需求系统、药价与患者端效用，静态消费者收益暂不作为单独福利项进入正文主框架，而只在扩展讨论中说明。

## 11. 有为政府的制度选择问题

为了把新结构经济学中的“有为政府提供适宜制度”真正写进模型，设政府在观察发展阶段 `\xi` 后，选择制度 `M` 来最大化净福利：

\[
\max_{M\in\{0,1\}}
\mathcal W(M,\xi).
\]

定义制度改革的净收益为

\[
\Delta \mathcal W(\xi)
=
\mathcal W(1,\xi)-\mathcal W(0,\xi).
\]

若 `\Delta \mathcal W(\xi)\ge 0`，则 `M=1` 是适宜制度；否则 `M=0` 更适宜。

### 11.1 “适宜制度”的阈值推导

由链式法则，

\[
\frac{d\Delta \mathcal W(\xi)}{d\xi}
=
\frac{\partial \mathcal W}{\partial \tau}
\frac{\partial \tau(1,\xi)}{\partial \xi}
+
\sum_{s,j}
\frac{\partial \mathcal W}{\partial \kappa_{sj}}
\frac{\partial \kappa_{sj}(1,\xi)}{\partial \xi}
+
\frac{\partial \mathcal W}{\partial \mu_B}
\frac{\partial \mu_B(1,\xi)}{\partial \xi}
+
\frac{\partial \mathcal W}{\partial \mathcal I}
\frac{\partial \mathcal I(1,\xi)}{\partial \xi}.
\]

在下列一般条件下：

1. `\partial \mathcal W / \partial \tau < 0`；
2. `\partial \mathcal W / \partial \kappa_{sj} < 0`；
3. `\partial \mathcal W / \partial \mu_B > 0` 至少在与原研药创新互补的区间内成立；
4. `\partial \mathcal W / \partial \mathcal I > 0`；
5. `\partial \tau(1,\xi)/\partial \xi < 0`，`\partial \kappa_{sj}(1,\xi)/\partial \xi < 0`；

则有

\[
\frac{d\Delta \mathcal W(\xi)}{d\xi}>0.
\]

于是只要 `\Delta \mathcal W(\xi)` 连续并跨过零点，就存在阈值 `\xi^*`，使得：

\[
\Delta \mathcal W(\xi) < 0, \quad \xi<\xi^*,
\]

\[
\Delta \mathcal W(\xi) \ge 0, \quad \xi\ge \xi^*.
\]

这意味着：

> 当产业发展阶段足够高时，`MAH` 成为适宜制度；当发展阶段不足时，同样的制度安排未必能产生正的净效果。

这正是新结构经济学在本文模型中的核心命题。

## 12. 主要命题

### 命题 1：适配度越高，`MAH` 对 `B` 型商业化价值提升越强

在 `\Lambda_z>0,\Lambda_{\xi}>0,\Delta_\tau>0` 条件下，

\[
\frac{\partial \Psi_B^O}{\partial M}>0,
\qquad
\frac{\partial^2 \Psi_B^O}{\partial M\partial \xi}>0,
\qquad
\frac{\partial^2 \Psi_B^O}{\partial M\partial z}>0.
\]

因此，制度改革对 `B` 型研发企业的促进作用，在更高发展阶段和更高能力企业上更强。

### 命题 2：`MAH` 通过组织重构实现企业分化

若关键转换成本满足 `\partial \kappa_{sj}/\partial M<0`，则

\[
\frac{\partial P_{AB}}{\partial M}>0,\quad
\frac{\partial P_{AC}}{\partial M}>0,\quad
\frac{\partial P_{BA}}{\partial M}>0,\quad
\frac{\partial P_{CA}}{\partial M}>0.
\]

其中，企业分化可表现为：

- 一体化企业向研发专门化或生产专门化分化；
- 生产企业升级为兼具研发能力的一体化企业；
- 研发企业在必要时内部整合为一体化企业。

### 命题 3：`MAH` 对原研药创新的作用是一个净效应

总原研药创新变化可分解为：

\[
d\mathcal I
=
\frac{\partial \mathcal I}{\partial \mu_B}d\mu_B
+ \frac{\partial \mathcal I}{\partial x_A}dx_A
+ \frac{\partial \mathcal I}{\partial x_B}dx_B
+ \frac{\partial \mathcal I}{\partial H}dH.
\]

因此，`MAH` 促进原研药创新既可能来自：

- `B` 型进入增加；
- `B` 型 idea 更容易 implementation；
- 既有企业创新激励改善；
- 组织结构重组带来的资源重新配置。

### 命题 4：适宜制度的创新效应具有阶段异质性

若 `\partial^2 \Psi_B/\partial M\partial \xi>0`、`\partial^2 P_{sj}/\partial M\partial \xi>0` 且 `\partial^2 \mathcal I/\partial M\partial \xi>0`，则在发展阶段更高、能力结构更适合原研药创新的地区或企业中，`MAH` 对原研药创新的促进作用更强。

这为实证中的区域异质性和企业异质性检验提供了直接理论依据。

### 命题 5：净福利为正是条件性结论

若 `MAH` 提高原研药创新并促进资源重配置，但同时压缩传统生产利润并引入组织调整成本，则净福利为正当且仅当：

\[
\underbrace{\Delta W^{innovation} + \Delta W^{reallocation}}_{\text{正效应}}
>
\underbrace{|\Delta W^{producer\ loss}| + |\Delta W^{switching\ cost}|}_{\text{负效应}}.
\]

因此，“创新利润与福利增加”同“传统生产利润与福利下降”相抵后的总福利为正，在本文框架中是一个条件性均衡命题，而不是逻辑上自动成立的恒等式。

## 13. 与实证的对应

该模型与本文实证最直接的对应如下：

1. `\xi` 可以在实证上用地区产业基础、医药产业集聚度、创新基础、原研药能力等变量做异质性刻画；
2. `\Lambda(z,\xi)` 在实证中不必被直接估计，而是通过“政策效应在不同企业/地区上的异质性”得到间接支持；
3. `\mu_B`、`P_{sj}` 对应企业分化和转移矩阵；
4. `\mathcal I(M,\xi)` 对应原研药创新数量、创新质量和创新结构；
5. `\Pi_C` 与命题 5 对应传统生产企业利润及其福利权衡。

## 14. 这一版模型的优点

这一版的优点在于：

- 没有放弃你原来的核心故事；
- 让新结构经济学真正进入模型，而不是只停留在论文引言；
- 仍然保留 `Hopenhayn` 壳与 `FRS` 机制的可操作性；
- 为后续的区域异质性、企业异质性和“适宜制度”检验提供了清晰理论基础。

## 15. 写作时最稳的定位

如果要对外用一句话概括这套模型，最稳的写法是：

> 本文构建了一个融合新结构经济学视角的异质企业行业均衡模型，其中发展阶段决定制度需求，`MAH` 作为政府提供的制度供给改变研发所有权与生产能力之间的制度边界，市场则通过企业进入、退出、组织重构和商业化分工实现资源配置，最终影响原研药创新与产业升级。

这句话既不会让人误解你在做一个完全不同的新结构经济学模型，也能清楚说明现有模型与新结构经济学是相互融合而非相互抵触的。
