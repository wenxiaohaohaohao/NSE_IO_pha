# MAH、企业分化与原研药创新：弱整合版新结构经济学模型

## 1. 这份版本的定位

这一版是本文**真正推荐放进正文主模型**的版本。它的目标是：

- 保留新结构经济学最重要的思想；
- 保留现有 `A/B/C` 组织状态、invention/implementation、进入退出和行业均衡框架；
- 避免把模型推向“制度内生选择的完整大模型”；
- 保持与实证识别策略的一致性。

因此，本文采用的是一种**弱整合版新结构经济学模型**：

- 新结构经济学作为上层理论视角；
- 发展阶段和制度适配度作为模型中的外生环境参数；
- `MAH` 仍然在正文中被视为给定的制度变化；
- 企业通过进入、退出、组织重构和商业化分工对制度变化作出内生反应。

最重要的一点是：在这一版中，`MAH` 的“适宜性”不通过显式的政府最优化来体现，而是通过**制度效应是否随发展阶段和企业能力而异**来体现。

## 2. 新结构经济学如何进入这套模型

为了让新结构经济学与当前模型融合而不冲突，本文只保留三层最必要的内容：

1. `发展阶段`：产业从仿制导向逐步走向原研导向、从生产导向走向研发-生产并重；
2. `制度适配`：同一项制度安排对不同发展阶段、不同能力企业的作用强度不同；
3. `政府与市场分工`：政府通过 `MAH` 改变制度边界，市场通过企业分化与组织重构配置资源。

与强融合版不同，本文**不**在正文主模型中显式刻画政府解 `\max_M W(M,\xi)` 的问题，也不要求识别制度内生形成过程。

## 3. 经济环境

时间离散，`t=0,1,2,\ldots`。

行业中存在三类活跃企业和一类潜在进入者：

- `A`：研发与生产一体化企业；
- `B`：研发专门化企业；
- `C`：生产专门化企业；
- `E`：潜在进入者。

每个活跃企业在每期开始时拥有能力状态

\[
z \in Z \subset \mathbb{R}_+.
\]

这里的 `z` 表示企业综合能力，包括：

- 原研药研发能力；
- 项目推进能力；
- 组织协同能力；
- 商业化和重组能力。

行业发展阶段由外生参数 `\xi \in \Xi \subset \mathbb{R}_+` 表示。更高的 `\xi` 表示：

- 原研药创新的重要性更高；
- 研发型企业成长和专业化分工需求更强；
- `MAH` 这类制度更可能适应当前产业升级需求。

## 4. 制度变量与制度适配函数

正文中仍将 `MAH` 视为给定的制度环境：

\[
M \in \{0,1\},
\]

其中：

- `M=0` 表示 `pre-MAH`；
- `M=1` 表示 `post-MAH`。

为了体现“制度是否适宜发展阶段”，设制度适配函数

\[
\Lambda(z,\xi)=z^{\alpha}\xi^{\nu},
\qquad \alpha>0,\ \nu>0.
\]

并假定：

\[
\frac{\partial \Lambda}{\partial z}>0,
\qquad
\frac{\partial \Lambda}{\partial \xi}>0.
\]

其含义是：

- 企业能力越强，越能利用制度改革；
- 发展阶段越高，`MAH` 越接近适宜制度。

## 5. `MAH` 如何进入模型

在这一版中，`MAH` 只通过两类 reduced-form 渠道进入模型。

### 5.1 商业化摩擦

`B` 型企业将原研药 idea 推向商业化的制度摩擦写为：

\[
\tau(z,\xi,M)=\bar{\tau}-M\Delta_{\tau}\Lambda(z,\xi),
\qquad \bar{\tau}>0,\ \Delta_{\tau}>0.
\]

因此：

\[
\frac{\partial \tau}{\partial M}<0,
\qquad
\frac{\partial^2 \tau}{\partial M\partial \xi}<0.
\]

### 5.2 组织重构门槛

企业从组织状态 `s` 切换到 `j` 的重构成本写为：

\[
\kappa_{sj}(z,\xi,M)=\bar{\kappa}_{sj}-M\Delta_{sj}\Lambda(z,\xi),
\qquad \Delta_{sj}>0.
\]

因此：

\[
\frac{\partial \kappa_{sj}}{\partial M}<0,
\qquad
\frac{\partial^2 \kappa_{sj}}{\partial M\partial \xi}<0.
\]

这一设定已经足够把新结构经济学中的“适宜制度安排”转化为可推导命题：

- `MAH` 降低商业化摩擦；
- `MAH` 降低组织重构门槛；
- 且这种作用在更高发展阶段、更强能力企业中更强。

## 6. 三类企业的流量收益

本文中的 innovation object 统一解释为**原研药创新**。

### 6.1 `A` 型企业

给定状态 `z,\xi` 与工资 `w`，`A` 型企业选择原研药创新强度 `x_A \ge 0`：

\[
\pi_A(z,\xi;w)
=
\bar{\pi}_A(z,\xi;w)
-f_A
+x_A\Omega_A(z,\xi)
-\frac{\chi_A}{\eta}x_A^\eta,
\qquad \eta>1.
\]

最优创新强度为：

\[
x_A^*(z,\xi)
=
\left(
\frac{\Omega_A(z,\xi)}{\chi_A}
\right)^{\frac{1}{\eta-1}}.
\]

代回得最优流量收益：

\[
\Pi_A(z,\xi;w)
=
\bar{\pi}_A(z,\xi;w)
-f_A
+\frac{\eta-1}{\eta}\chi_A^{-\frac{1}{\eta-1}}
\Omega_A(z,\xi)^{\frac{\eta}{\eta-1}}.
\]

### 6.2 `B` 型企业

`B` 型企业选择 idea generation 强度 `x_B \ge 0`，其流量收益为：

\[
\pi_B(z,\xi;p_m,M)
=
-f_B
+x_B\Psi_B(z,\xi;p_m,M)
-\frac{\chi_B}{\eta}x_B^\eta.
\]

最优 idea generation 为：

\[
x_B^*(z,\xi;p_m,M)
=
\left(
\frac{\Psi_B(z,\xi;p_m,M)}{\chi_B}
\right)^{\frac{1}{\eta-1}}
\quad \text{if } \Psi_B>0.
\]

最优流量收益为：

\[
\Pi_B(z,\xi;p_m,M)
=
-f_B
+\frac{\eta-1}{\eta}\chi_B^{-\frac{1}{\eta-1}}
\Psi_B(z,\xi;p_m,M)^{\frac{\eta}{\eta-1}}.
\]

### 6.3 `C` 型企业

`C` 型企业提供委托生产服务：

\[
\pi_C(z,\xi;p_m,w)
=
p_m m-c(m,z,\xi;w)-f_C.
\]

相应最优利润为：

\[
\Pi_C(z,\xi;p_m,w)
=
\max_{m\ge 0}
\left\{
p_m m-c(m,z,\xi;w)-f_C
\right\}.
\]

## 7. invention 与 implementation

### 7.1 外包 implementation

若 `B` 型企业生成一个 idea 后选择委托 `C` 型企业生产，则每个 idea 的净价值为：

\[
\Psi_B^O(z,\xi;p_m,M)
=
\max_{i_O\in[0,1]}
\left\{
i_O R_O(z,\xi)
-\frac{\kappa_O}{\theta}i_O^\theta
-p_m
-\tau(z,\xi,M)
\right\},
\qquad \theta>1.
\]

一阶条件：

\[
R_O(z,\xi)-\kappa_O i_O^{\theta-1}=0.
\]

故

\[
i_O^*(z,\xi)
=
\left(
\frac{R_O(z,\xi)}{\kappa_O}
\right)^{\frac{1}{\theta-1}}.
\]

将其代回：

\[
\Psi_B^O(z,\xi;p_m,M)
=
\frac{\theta-1}{\theta}\kappa_O^{-\frac{1}{\theta-1}}
R_O(z,\xi)^{\frac{\theta}{\theta-1}}
-p_m-\tau(z,\xi,M).
\]

因此：

\[
\frac{\partial \Psi_B^O}{\partial M}
=
\Delta_{\tau}\Lambda(z,\xi)>0,
\qquad
\frac{\partial^2 \Psi_B^O}{\partial M\partial \xi}>0.
\]

### 7.2 内部整合 implementation

若 `B` 型企业转为 `A` 型企业后内部实施，则每个 idea 的净价值为：

\[
\Psi_B^I(z,\xi;M)
=
\max_{i_I\in[0,1]}
\left\{
i_I R_I(z,\xi)
-\frac{\kappa_I}{\theta}i_I^\theta
-\kappa_{BA}(z,\xi,M)
\right\}.
\]

与上类似，可得：

\[
i_I^*(z,\xi)
=
\left(
\frac{R_I(z,\xi)}{\kappa_I}
\right)^{\frac{1}{\theta-1}}.
\]

### 7.3 每个 idea 的总价值

\[
\Psi_B(z,\xi;p_m,M)
=
\max\left\{
\Psi_B^O(z,\xi;p_m,M),\,
\Psi_B^I(z,\xi;M),\,
0
\right\}.
\]

这就把三个层次合并到同一个对象中：

- `MAH` 改变商业化摩擦；
- 企业可通过外包或整合完成 implementation；
- 制度效果随发展阶段和企业能力而异。

## 8. 组织状态转移

企业当前组织状态 `s \in \{A,B,C\}`，可选的下一期状态集合记为 `\mathcal J(s)`。

若企业当前为 `s`，选择下一期为 `j`，则系统性价值为：

\[
\bar V_{sj}(z,\xi;M)
=
\Pi_j(z,\xi;M)
-\kappa_{sj}(z,\xi,M)
+\beta E[V_j(z',\xi;M)\mid z,s,j].
\]

设存在 i.i.d. type-I extreme value shocks，则 Bellman 方程为：

\[
V_s(z,\xi;M)
=
E_{\varepsilon}
\left[
\max_{j\in \mathcal J(s)}
\left\{
\bar V_{sj}(z,\xi;M)+\varepsilon_{sj}
\right\}
\right].
\]

相应组织转移概率为：

\[
P_{sj}(z,\xi;M)
=
\frac{
\exp(\bar V_{sj}(z,\xi;M)/\sigma)
}{
\sum_{\ell\in\mathcal J(s)}
\exp(\bar V_{s\ell}(z,\xi;M)/\sigma)
}.
\]

因此，对于关键重组方向有：

\[
\frac{\partial P_{sj}}{\partial M}>0,
\qquad
\frac{\partial^2 P_{sj}}{\partial M\partial \xi}>0.
\]

这意味着：

- `MAH` 诱导企业分化与组织重构；
- 且该效应在更高发展阶段上更强。

## 9. 进入、市场清算与稳态分布

### 9.1 潜在进入者

潜在进入者初始能力分布为 `G(z_0)`，自由进入条件为：

\[
\int V_B(z_0,\xi;M)\,dG(z_0)\le c_{EB},
\qquad
\int V_C(z_0,\xi;M)\,dG(z_0)\le c_{EC}.
\]

在这一版中，不额外写政府最优制度选择，也不要求结构识别 `\xi^*`；重点只在于：

- `V_B` 会因 `MAH` 上升；
- 且政策效应在更高 `\xi` 下更强。

### 9.2 委托生产市场

\[
D_m(p_m,\xi;M)
=
\int x_B^*(z,\xi;p_m,M)d_O(z,\xi;p_m,M)\mu_B(dz),
\]

\[
S_m(p_m,\xi;w)
=
\int m^*(z,\xi;p_m,w)\mu_C(dz),
\]

并满足

\[
D_m(p_m,\xi;M)=S_m(p_m,\xi;w).
\]

### 9.3 稳态分布

记稳态分布为 `(\mu_A,\mu_B,\mu_C)`，由进入、退出、状态转移和能力演化共同决定。

## 10. 原研药创新与福利

行业原研药创新产出为：

\[
\mathcal I(M,\xi)
=
\int \Gamma_A(z,\xi)x_A^*(z,\xi)\mu_A(dz)
+\int \Gamma_B(z,\xi)x_B^*(z,\xi;p_m,M)i_B^*(z,\xi;p_m,M)\mu_B(dz).
\]

福利记为：

\[
\mathcal W(M,\xi).
\]

在当前版本中，正文主福利框架只保留三项：

- 动态原研药创新价值；
- 企业分化与资源重配置收益；
- 传统生产侧生产者剩余损失与组织调整成本。

因此，净福利为正仍然是条件性结论，而不是逻辑上自动成立。由于当前模型尚未显式刻画需求系统、药价与患者端效用，静态消费者收益暂不作为单独福利项进入主框架；若后续扩展需求侧模块，可在附加讨论中再单独展开。

## 11. 主要命题

### 命题 1：`MAH` 对 `B` 型商业化价值的提升在更高发展阶段和更高能力企业上更强

\[
\frac{\partial \Psi_B^O}{\partial M}>0,
\qquad
\frac{\partial^2 \Psi_B^O}{\partial M\partial \xi}>0,
\qquad
\frac{\partial^2 \Psi_B^O}{\partial M\partial z}>0.
\]

### 命题 2：`MAH` 通过降低组织重构门槛诱导企业分化

\[
\frac{\partial P_{AB}}{\partial M}>0,\quad
\frac{\partial P_{AC}}{\partial M}>0,\quad
\frac{\partial P_{BA}}{\partial M}>0,\quad
\frac{\partial P_{CA}}{\partial M}>0.
\]

### 命题 3：`MAH` 对原研药创新的促进来自进入、implementation 与组织重构

\[
d\mathcal I
=
\frac{\partial \mathcal I}{\partial \mu_B}d\mu_B
+\frac{\partial \mathcal I}{\partial x_A}dx_A
+\frac{\partial \mathcal I}{\partial x_B}dx_B
+\frac{\partial \mathcal I}{\partial H}dH.
\]

### 命题 4：制度促进原研药创新的效应具有发展阶段异质性

若 `\partial^2 \mathcal I/\partial M\partial \xi>0`，则在发展阶段更高、产业基础更强或企业初始能力更高的地区与企业中，`MAH` 的创新效应更强。

### 命题 5：净福利为正是条件性结论

\[
\Delta W^{innovation}
+\Delta W^{reallocation}
>
\Delta W^{transition}
\]

时，净福利为正，其中 `\Delta W^{transition}` 包含传统生产侧生产者剩余损失与组织调整成本。

## 12. 为什么正文推荐这一版，而不是强融合版

这一版之所以更适合放进正文，而不是直接使用强融合版，主要有五个原因。

### 12.1 它和实证识别最一致

本文实证上把 `MAH` 视为给定制度变化，并利用试点到推广的制度进程识别创新和组织重构效应。如果在主模型中再显式写入政府解

\[
\max_{M\in\{0,1\}}\mathcal W(M,\xi),
\]

就容易让读者追问：既然制度是政府最优选择的，那为什么在实证里又把它视为可识别的外生冲击？

弱整合版避免了这层冲突。它保留“制度是否适宜发展阶段”的理论含义，但不把政府制度选择本身设为正文主识别对象。

### 12.2 它在数学上更可解

弱整合版只是给现有模型增加：

- 一个发展阶段参数 `\xi`
- 一个制度适配函数 `\Lambda(z,\xi)`

Bellman 方程、进入条件、市场清算和稳态分布的结构都没有本质变化。因此：

- 纸面推导更直接；
- 数值求解难度没有跳升；
- 更适合你当前阶段继续往下做。

### 12.3 它已经足够推出你真正需要的理论结果

你真正需要的结论其实是：

- `MAH` 促进企业分化；
- `MAH` 促进原研药创新；
- `MAH` 的作用具有阶段异质性；
- 总福利是净效应。

这些结果，弱整合版已经都能推出。相比之下，强融合版多出来的“政府显式最优制度选择”并不是你当前论文必须依赖的结果。

### 12.4 它更符合经验论文的写作纪律

对于以实证为主、理论为辅的论文，主模型更应强调：

- 机制清楚；
- 变量可对应；
- 命题能和实证一一映射；
- 不额外引入难以识别的深层结构。

弱整合版正好满足这些要求，而强融合版更适合作为理论扩展、附录模型或与老师讨论时的升级版。

### 12.5 它能把新结构经济学“用得刚刚好”

你现在需要的是：

- 让新结构经济学真正进入模型；
- 但不要让整篇文章变成“制度内生形成的大模型”。

弱整合版正好做到：

- 把新结构经济学写进 `\xi` 和 `\Lambda(z,\xi)`；
- 把政府作用写进 `M` 对摩擦和重组门槛的影响；
- 把市场作用写进企业分化与重组；
- 同时不破坏原有故事的清晰度。

## 13. 最推荐的使用方式

最稳的写法是：

- 正文主模型：使用这一版弱整合模型；
- 引言和文献综述：强调新结构经济学视角；
- 异质性实证：用地区发展阶段、产业基础、企业初始能力去呼应 `\xi`；
- 如有需要：把强融合版放在附录、补充笔记或与老师讨论的扩展模型中。

## 14. 一句话总结

> 弱整合版新结构经济学模型保留了“适宜发展阶段制度安排”这一理论核心，但把它落实为发展阶段参数和制度适配函数，而不是把政府最优制度选择写成正文主模型。这样既能确保理论上不与新结构经济学相冲突，又能保证模型构造、数学推导和实证识别都具有可实施性。
