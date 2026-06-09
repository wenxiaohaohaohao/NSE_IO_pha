# Notes：NEV 项目中“地方政府—企业潮涌进入—产能过剩”的模型修正

## 0. 核心修正

原来的模型主线容易写成：

> 地方政府分散化产业政策竞争 → 企业进入和扩产 → 产能过剩与内卷。

这个版本不够完整，因为它把企业处理成了被动接受地方政策的主体，忽视了企业在新能源汽车赛道中的主动进入、扩产、价格竞争和融资策略。

更准确的主线应改为：

> **中国 NEV 行业的内卷不是地方政府单方面制造的，也不是企业单方面错误决策造成的，而是地方政府扩张型政策激励、企业对未来利润和市场份额的理性预期、融资环境和全国需求约束共同作用下形成的分散均衡。**

因此，文章应从单纯的“地方政府政策竞争模型”改为：

> **政府—企业双重战略互动模型**  
> local policy competition + firm entry/capacity race + product-market competition + aggregate misallocation

核心比较仍然是：

\[
D \quad \text{vs.} \quad CP
\]

其中：

- \(D\)：decentralized equilibrium，包含地方政府竞争与企业私人进入激励；
- \(CP\)：centralized constrained policy equilibrium，中央协调全国性产能、资本错配和财政成本，但仍受到地方信息、执行和政治约束。

---

## 1. 不能把企业写成被动主体

新能源汽车行业中的企业并不是被地方政府“推着走”。企业主动进入和扩张有自己的经济学动机。

### 企业主动进入的四类动机

| 企业动机 | 经济含义 | 对模型的作用 |
|---|---|---|
| 利润预期 | 企业预期 NEV 是高增长赛道，未来需求、价格和利润空间较大 | 提高进入价值 \(V^N_{i,r,t}\) |
| 政策信号 | 地方政策降低进入成本和资本成本，同时传递政府持续支持信号 | 降低 \(F^N_{r,t}\) 或 \(R^N_{r,t}\) |
| 市场份额竞争 | 企业即使短期不盈利，也希望抢占规模、渠道、品牌、数据和用户基础 | 形成 capacity race 和 price war |
| 融资与估值预期 | 高增长叙事有助于融资、上市、估值和债务扩张 | 放大进入和扩产激励 |

所以，模型不能写成：

\[
s_{r,t} \uparrow \Rightarrow Entry_{r,t} \uparrow
\]

就结束。

更完整的写法应是：

\[
s_{r,t},\ E_tD^N_{t+1},\ E_tP^N_{t+1},\ Finance_t
\Rightarrow
V^N_{i,r,t}
\Rightarrow
Entry_{i,r,t},\ H^N_{i,r,t}
\]

地方政策是企业进入的一个重要 shifter，但企业进入仍然是企业基于预期价值的主动选择。

---

## 2. 企业进入条件

企业 \(i\) 在地区 \(r\)、时间 \(t\) 选择是否进入 NEV 部门。企业进入条件为：

\[
V^N_{i,r,t}(z_i)
\geq
V^O_{i,r,t}(z_i)
\]

其中，NEV 企业价值函数可以写成：

\[
V^N_{i,r,t}
=
\max
\left\{
0,\;
\pi^N_{i,r,t}
+
\beta E_t V^N_{i,r,t+1}
\right\}
-
F^N_{r,t}
\]

企业利润为：

\[
\pi^N_{i,r,t}
=
P^N_t q^N_{i,r,t}
-
w_{r,t}l^N_{i,r,t}
-
R^N_{r,t}k^N_{i,r,t}
-
FC^N_{i,r,t}
\]

地方政策进入企业问题的方式可以简化为两类 wedge。

### 方式一：降低进入成本

\[
F^N_{r,t}
=
F^N_0
-
\phi_F s_{r,t}
\]

### 方式二：降低资本成本

\[
R^N_{r,t}
=
r_t
-
\phi_K s_{r,t}
\]

其中：

- \(s_{r,t}\)：地区 \(r\) 的 NEV 产业政策强度；
- \(\phi_F>0\)：政策降低进入成本的强度；
- \(\phi_K>0\)：政策降低资本成本的强度。

因此，地方政府不是直接决定企业进入，而是改变企业面对的进入成本、资本成本和预期收益。

---

## 3. 潮涌现象：企业理性进入与总量非效率

“潮涌现象”不应理解为企业非理性，而应理解为：

> **在给定政策支持、融资环境和需求预期下，每个企业进入可能是私人理性的；但当所有企业同时进入同一赛道时，行业价格、利润率和产能利用率下降，导致社会层面的过度进入。**

企业进入数量可以写成：

\[
N^N_{r,t}
=
N
\left(
s_{r,t},
E_tD^N_{t+1},
E_tP^N_{t+1},
Finance_t,
\sigma_t
\right)
\]

其中：

| 变量 | 含义 |
|---|---|
| \(s_{r,t}\) | 地方产业政策强度 |
| \(E_tD^N_{t+1}\) | 企业对未来 NEV 需求的预期 |
| \(E_tP^N_{t+1}\) | 企业对未来价格和利润率的预期 |
| \(Finance_t\) | 融资环境、资本市场估值、信贷条件 |
| \(\sigma_t\) | 不确定性、乐观预期或 option value |

企业进入的私人价值：

\[
V^{private}_{entry}
=
E_t
\sum_{\tau=t}^{\infty}
\beta^{\tau-t}
\pi^N_{i,r,\tau}
-
F^N_{r,t}
\]

但社会边际进入价值应扣除企业没有完全内部化的外部性：

\[
V^{social}_{entry}
=
V^{private}_{entry}
-
BusinessStealing_t
-
PriceCompression_t
-
IdleCapacityCost_t
-
CapitalMisallocationCost_t
\]

当：

\[
V^{private}_{entry}>0
\quad
\text{but}
\quad
V^{social}_{entry}<0
\]

就出现私人理性进入与社会过度进入之间的 wedge。

这正是“潮涌现象”的模型表达。

---

## 4. 企业不完全内部化的外部性

企业进入时主要考虑自己的预期利润：

\[
E_t\pi^N_{i,r,t}
\]

但企业不会充分内部化自己进入对全行业和全经济的影响。

### 企业没有完全内部化的对象

\[
\frac{\partial P^N_t}{\partial N_t}
\]

企业没有完全考虑自己进入会压低行业均衡价格。

\[
\frac{\partial \mu^N_t}{\partial N_t}
\]

企业没有完全考虑自己进入会压低行业 markup。

\[
\frac{\partial u^N_t}{\partial N_t}
\]

企业没有完全考虑自己进入会降低行业产能利用率。

\[
\frac{\partial MPK^N_t}{\partial K^N_t}
\]

企业没有完全考虑自己扩产会降低 NEV 部门资本边际回报。

\[
\frac{\partial \Pi^N_{-i,t}}{\partial N_t}
\]

企业没有完全考虑自己进入对其他企业利润的 business stealing。

因此，企业潮涌式进入本质上是：

> **私人进入激励没有充分内部化产品市场拥挤、资本市场错配和产能利用率下降。**

---

## 5. 地方政府与企业之间是双向强化机制

不能只写：

\[
地方政策 \Rightarrow 企业进入
\]

而应写成 feedback loop：

\[
s_{r,t}\uparrow
\Rightarrow
F^N_{r,t}\downarrow,\ R^N_{r,t}\downarrow
\Rightarrow
V^N_{i,r,t}\uparrow
\Rightarrow
Entry_{r,t}\uparrow,\ H^N_{r,t}\uparrow
\]

同时：

\[
Entry_{r,t}\uparrow
\Rightarrow
Y^N_{r,t}\uparrow,\ I^N_{r,t}\uparrow,\ L^N_{r,t}\uparrow,\ TaxBase_{r,t}\uparrow
\Rightarrow
s_{r,t}\ \text{维持或继续上升}
\]

所以模型中应有一个政府—企业相互强化过程：

```text
地方政策信号
→ 企业预期利润上升
→ 企业进入和扩产
→ 地方产值、投资、就业和税基上升
→ 地方政府继续支持
→ 更多企业进入
```

这个机制可以解释为什么政策和企业进入会在某些时期共同加速，而不是由某一方单独推动。

---

## 6. 修改后的四阶段模型

### Stage 1：地方政府选择政策强度

地方政府选择 \(s_{r,t}\)，给定其他地区政策和全国市场状态：

\[
s^D_{r,t}
=
BR_r(s^D_{-r,t};Z_{r,t},Z_t)
\]

地方政府目标函数：

\[
V^L_{r,t}
=
\omega_Y Y^N_{r,t}
+
\omega_I I^N_{r,t}
+
\omega_E L^N_{r,t}
+
\omega_T Tax_{r,t}
-
\frac{\kappa}{2}s_{r,t}^2
-
\frac{\chi_s}{2}(s_{r,t}-s_{r,t-1})^2
\]

地方政府内部化：

- 本地 NEV 产值；
- 本地投资；
- 本地就业；
- 本地税基；
- 本地财政成本；
- 一定程度的政策调整成本。

但地方政府不完全内部化：

- 全国性产能过剩；
- 部门间资本错配；
- 其他地区产能重复；
- 全国财政竞争成本；
- 全行业价格压缩。

---

### Stage 2：企业观察政策与市场预期后选择进入

企业进入条件：

\[
Entry_{i,r,t}=1
\quad
\text{if}
\quad
V^N_{i,r,t}\geq V^O_{i,r,t}
\]

企业进入受到四类因素影响：

\[
V^N_{i,r,t}
=
V
\left(
s_{r,t},
E_tD^N_{t+1},
E_tP^N_{t+1},
Finance_t,
z_i
\right)
\]

其中：

- 政策提高进入价值；
- 需求预期提高进入价值；
- 融资环境改善提高进入价值；
- 企业生产率 \(z_i\) 决定进入能力和预期利润。

---

### Stage 3：企业选择产能与价格

企业产能动态：

\[
H^N_{i,r,t+1}
=
(1-\delta_H)H^N_{i,r,t}
+
I^H_{i,r,t}
\]

全国 NEV 产能：

\[
H^N_t
=
\sum_{r}\sum_i H^N_{i,r,t}
\]

产品市场需求：

\[
D^N_t
=
\bar{D}_t(P^N_t)^{-\epsilon_D}
\]

市场出清：

\[
\sum_{r}\sum_i Q^N_{i,r,t}
=
D^N_t(P^N_t)
\]

当产能增长快于有效需求：

\[
H^N_t>D^N_t
\]

产能利用率下降：

\[
u^N_t
=
\frac{Q^N_t}{H^N_t}
\downarrow
\]

若存在差异化产品 Bertrand 竞争，企业数量和产品同质化会影响有效需求弹性：

\[
\epsilon^{eff}_t
=
\epsilon_0
+
aN_t
+
b\rho_t
\]

其中：

- \(N_t\)：企业或车型数量；
- \(\rho_t\)：产品相似度或同质化程度。

markup：

\[
\mu_t
=
\frac{\epsilon^{eff}_t}{\epsilon^{eff}_t-1}
\]

当 \(N_t\) 上升或 \(\rho_t\) 上升时：

\[
\frac{\partial \mu_t}{\partial N_t}<0,
\quad
\frac{\partial \mu_t}{\partial \rho_t}<0
\]

这就是价格战和利润压缩的产品市场机制。

---

### Stage 4：价格战、低利用率和资本错配反馈到退出与供应链

价格下降：

\[
P^N_t\downarrow
\Rightarrow
\pi^N_{i,r,t}\downarrow
\]

利润下降后，企业可能出现三类行为：

1. 退出；
2. 继续降价保份额；
3. 向供应商转嫁压力。

退出条件：

\[
V^N_{i,r,t}<0
\Rightarrow
Exit_{i,r,t}=1
\]

若退出摩擦较高，低利润企业可能继续生产，从而加剧价格战和低利用率。

供应链传导可以写成：

\[
PriceWar_{j,t}\uparrow
\Rightarrow
CF^O_{j,t}\downarrow
\Rightarrow
PaymentPeriod_{s,j,t}\uparrow
\Rightarrow
CF^S_{s,t}\downarrow
\Rightarrow
R\&D_{s,t}\downarrow
\Rightarrow
InnovationQuality_{s,t+1}\downarrow
\]

这部分可以作为扩展或后续实证机制，不一定放在宏观基准模型中。

---

## 7. 最终模型不是“地方政府单因果”，而是“三方失配”

最终应写成三方失配：

| 主体 | 私人或局部理性行为 | 未充分内部化的成本 |
|---|---|---|
| 地方政府 | 扶持本地 NEV 以获得投资、就业、税基、产业链和政绩收益 | 全国过剩产能、跨地区重复建设、部门间资本错配 |
| 企业 | 基于政策支持、需求预期、融资环境和市场份额竞争主动进入 | 行业价格压缩、产能利用率下降、business stealing、资本回报下降 |
| 中央协调者 | 内部化全国福利、产能配置、资本回报、财政成本和市场出清 | 但受地方信息、执行能力、产业不确定性和政治约束限制 |

因此，文章不要写成：

> 地方政府导致内卷。

应写成：

> **地方政府与企业在各自目标下都可能是局部理性的，但二者互动在全国层面形成过度进入和资源错配。**

---

## 8. 与 D vs CP 的关系

### 分散均衡 \(D\)

\[
D
=
\left\{
s^D_{r,t},
Entry^D_{i,r,t},
H^{N,D}_{i,r,t},
P^{N,D}_t,
u^{N,D}_t,
MPK^{N,D}_t
\right\}
\]

特点：

- 地方政府选择政策；
- 企业主动进入；
- 各地区和企业都基于局部收益决策；
- 市场价格、产能利用率和资本回报在均衡中内生决定；
- 不完全内部化全国性外部性。

### 受约束的中央协调均衡 \(CP\)

\[
CP
=
\left\{
s^{CP}_{r,t},
Entry^{CP}_{i,r,t},
H^{N,CP}_{i,r,t},
P^{N,CP}_t,
u^{N,CP}_t,
MPK^{N,CP}_t
\right\}
\]

特点：

- 中央不直接取代企业决策；
- 中央协调地方政策强度、进入门槛、产能扩张和退出治理；
- 中央内部化全国性产能过剩和资本错配；
- 但仍受信息和执行约束。

核心结果应为：

\[
s^D_{r,t}>s^{CP}_{r,t}
\]

\[
Entry^D_t>Entry^{CP}_t
\]

\[
H^{N,D}_t>H^{N,CP}_t
\]

\[
u^{N,D}_t<u^{N,CP}_t
\]

\[
MPK^{N,D}_t<MPK^{O,D}_t
\]

\[
W^D<W^{CP}
\]

---

## 9. 新的论文核心句

英文版本：

> **This paper studies how decentralized industrial policy and firm-level entry incentives jointly generate overcapacity in China’s NEV industry. Local governments lower entry and capital costs to attract investment, employment, and supply-chain activity. Firms, observing policy support, rapid demand growth, and favorable financing conditions, rationally enter the NEV race to capture future profits, market share, and option value. The distortion arises because neither local governments nor individual firms fully internalize the aggregate consequences of simultaneous entry: price compression, low capacity utilization, MPK gaps, and welfare losses. The key comparison is therefore not “policy versus no policy,” nor “government versus firms,” but a decentralized equilibrium with local policy competition and private entry incentives versus a constrained centralized coordination benchmark.**

中文版本：

> **本文研究地方分散化产业政策与企业进入激励如何共同导致中国新能源汽车行业的过度产能。地方政府通过降低进入成本和资本成本来吸引投资、就业和产业链活动；企业则在观察到政策支持、需求高增长和融资环境改善后，基于未来利润、市场份额和期权价值主动进入新能源汽车赛道。扭曲并不来自地方政府或企业单方面的错误，而是来自二者都没有充分内部化同时进入的总量后果：价格压缩、低产能利用率、MPK gap 和福利损失。因此，本文比较的不是“有政策 vs 无政策”，也不是“政府 vs 企业”，而是包含地方政策竞争和企业私人进入激励的分散均衡，与受约束的中央协调均衡。**

---

## 10. 给 Codex 的更新任务建议

如果让 Codex 更新项目 notes，可以按下面任务执行。

### Task 1：更新项目核心问题

将原来的“地方政府分散化政策竞争导致内卷”改为：

> 地方分散化政策竞争与企业潮涌式进入共同导致过度产能、价格压缩和资本错配。

### Task 2：更新模型主体

确保模型主体至少包括：

1. 家庭或社会福利主体；
2. 地方政府；
3. 异质性企业；
4. 中央协调者；
5. 产品市场；
6. 资本市场或部门间资本配置；
7. 产能动态。

### Task 3：加入企业进入价值函数

增加：

\[
V^N_{i,r,t}
\]

并明确企业进入由政策、需求预期、融资环境和生产率共同决定。

### Task 4：加入企业潮涌式进入机制

增加 private entry value 与 social entry value 的区别：

\[
V^{private}_{entry}>0,\quad V^{social}_{entry}<0
\]

### Task 5：更新机制图

将机制图改为：

```text
地方政策支持
+ 需求高增长预期
+ 融资环境
→ 企业进入与扩产
→ 产能增长快于有效需求
→ 价格压缩、低利用率、MPK gap
→ 福利损失
```

### Task 6：更新 D vs CP 定义

将 \(D\) 定义为：

> 包含地方政府政策竞争和企业私人进入激励的分散均衡。

将 \(CP\) 定义为：

> 受信息和执行约束的中央协调均衡，不是无摩擦 first-best planner。

### Task 7：更新论文避免误读的表述

明确写入：

> 本文不认为地方政府单方面造成内卷，也不认为企业进入本身是错误的。地方政府与企业在各自目标下都可能是局部理性的；问题在于分散决策没有充分内部化全国性的同时进入后果。

---

## 11. 最终一句话版本

> **NEV 内卷不是单纯的地方政府问题，而是地方政府扩张型政策、企业潮涌式进入、融资环境和有效需求约束共同作用下的分散均衡问题。模型必须同时刻画地方政府的政策竞争和企业的私人进入激励，才能解释为什么在个体和地方层面看似理性的进入与扩产，会在全国层面形成过度产能、价格压缩、低利用率、MPK gap 和福利损失。**
