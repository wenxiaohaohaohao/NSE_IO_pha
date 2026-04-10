# `MAH` 论文中新结构经济学视角的写法

这份笔记的目的，是把你现在已经很清楚的“新结构经济学”思路收敛成可以直接放进论文和发给合作者的表述，而不是再额外扩展出一套新的模型。

## 1. 最核心的定位

最稳的定位不是说：

> 本文要构造一个新结构经济学结构模型。

而是说：

> 本文以新结构经济学为上层理论视角，讨论适宜发展阶段的制度安排如何通过企业组织重构与研发型企业发展来促进原研药创新和产业升级。

这样写有三个好处：

- 不会让读者误以为你要完整建模“禀赋结构 -> 制度内生演化”的大模型；
- 能把 `MAH` 改革放到“有为政府 + 有效市场”的逻辑里；
- 能自然接到你已经在做的企业分化、组织重构和创新结果。

## 2. 论文里最应该强调的逻辑链

如果按照新结构经济学的语言，你这篇文章最自然的逻辑链是：

```text
发展阶段与产业升级需求
-> 对更适宜制度安排的需求
-> MAH 作为制度供给
-> 研发所有权与生产能力解绑
-> 企业分化与组织重构
-> 研发型企业发展
-> 原研药创新与产业升级
```

这个链条里，最重要的不是“制度一定有效”，而是：

> 制度是否与当前医药产业发展阶段相匹配。

这也是新结构经济学视角和一般政策评估文章最大的区别。

## 3. 新结构经济学在本文里具体体现在哪里

### 3.1 “有为政府”的体现

`MAH` 改革本身就是“有为政府”的体现。

它不是政府直接替企业做创新决策，而是通过制度设计：

- 重新界定药品持证与生产的权利义务关系；
- 降低研发成果走向商业化的制度障碍；
- 使更适合当前产业升级需求的组织形式得以出现。

这就是你文章里最适合写成“政府作用”的地方。

### 3.2 “有效市场”的体现

市场在本文里主要体现为：

- 企业根据自身能力和组织条件选择 `A/B/C` 不同状态；
- 研发型企业决定是否进入；
- 生产型企业决定是否承接委托生产或升级为更综合的组织形式；
- 行业内通过委托生产市场实现分工与资源重配置。

也就是说，政府的作用是**改变制度边界条件**，市场的作用是**在新的制度边界下重新配置资源**。

### 3.3 “制度是否适宜发展阶段”的体现

这点最重要。

本文不是简单地问：

> `MAH` 有没有效？

而是更进一步地问：

> 在中国医药产业由仿制走向原研、由生产导向走向研发与生产并重的阶段，`MAH` 是否是一项适宜的制度安排？

如果是，那么它应当：

- 更适合研发型企业成长；
- 更适合产业链向上游延伸；
- 更容易促进原研药创新而非仅仅扩大低端生产。

## 4. 新结构经济学与当前模型的对应关系

你现在的模型虽然不是一套完整的新结构经济学模型，但它已经能承载这套理论视角。最核心的是：新结构经济学不是只停留在理论动机，而是通过**发展阶段参数**、**制度适配函数**和**异质性比较静态**进入模型。

### 4.1 三个进入对象

#### 进入对象 1：发展阶段参数 `\xi`

设

\[
\xi \in \Xi \subset \mathbb{R}_+
\]

表示行业或地区的发展阶段。更高的 `\xi` 表示：

- 医药产业从仿制导向更接近原研导向；
- 研发、项目推进和专业化分工需求更强；
- `MAH` 更可能适应当前产业升级需求。

这对应新结构经济学中的“制度需求来自发展阶段”。

#### 进入对象 2：企业能力状态 `z`

设

\[
z \in Z \subset \mathbb{R}_+
\]

表示企业综合能力，包括：

- 原研药研发能力；
- 项目推进能力；
- 组织协同能力；
- 商业化和重组能力。

这对应新结构经济学中的“企业能否承接制度供给”。

#### 进入对象 3：制度适配函数 `\Lambda(z,\xi)`

为了把“制度是否适宜发展阶段”真正写成模型对象，设

\[
\Lambda(z,\xi)=z^{\alpha}\xi^{\nu},
\qquad \alpha>0,\ \nu>0.
\]

并假定

\[
\frac{\partial \Lambda}{\partial z}>0,
\qquad
\frac{\partial \Lambda}{\partial \xi}>0.
\]

这意味着：

- 企业能力越强，越能利用制度改革；
- 发展阶段越高，`MAH` 越接近适宜制度。

这一步是新结构经济学进入模型的数学核心。

### 4.2 新结构经济学具体进入哪两个制度参数

在弱整合版中，`MAH` 不直接进入一大堆新方程，而是优先进入两个最关键的制度对象。

#### 第一，商业化摩擦

\[
\tau(z,\xi,M)=\bar{\tau}-M\Delta_{\tau}\Lambda(z,\xi),
\qquad \bar{\tau}>0,\ \Delta_{\tau}>0.
\]

因此：

\[
\frac{\partial \tau}{\partial M}<0,
\qquad
\frac{\partial^2 \tau}{\partial M\partial \xi}<0,
\qquad
\frac{\partial^2 \tau}{\partial M\partial z}<0.
\]

这表示：

- `MAH` 降低 `B` 型企业 commercialization friction；
- 且这种下降在更高发展阶段和更高能力企业上更强。

#### 第二，组织重构门槛

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

这表示：

- `MAH` 不只提高创新激励；
- 还降低企业从 `A/B/C` 之间切换的门槛；
- 并且在更适宜的阶段，这种边界重构更容易发生。

### 4.3 新结构经济学进入了哪些核心方程

它至少进入了四类方程。

#### 1. `B` 型企业的外包 implementation 价值

\[
\Psi_B^O(z,\xi;p_m,M)
=
\max_{i_O\in[0,1]}
\left\{
i_O R_O(z,\xi)
-\frac{\kappa_O}{\theta}i_O^\theta
-p_m-\tau(z,\xi,M)
\right\}.
\]

由此可得：

\[
\frac{\partial \Psi_B^O}{\partial M}
=
\Delta_{\tau}\Lambda(z,\xi)>0,
\qquad
\frac{\partial^2 \Psi_B^O}{\partial M\partial \xi}>0.
\]

也就是说，发展阶段越高，`MAH` 对 `B` 型商业化价值的提升越强。

#### 2. `B` 型企业的内部整合 implementation 价值

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

这里新结构经济学通过 `\kappa_{BA}(z,\xi,M)` 进入，决定 `B -> A` 的吸引力是否随发展阶段上升。

#### 3. 企业状态转移方程

系统性价值写为：

\[
\bar V_{sj}(z,\xi;M)
=
\Pi_j(z,\xi;M)
-\kappa_{sj}(z,\xi,M)
+\beta E[V_j(z',\xi;M)\mid z,s,j].
\]

在离散选择结构下：

\[
P_{sj}(z,\xi;M)
=
\frac{\exp(\bar V_{sj}(z,\xi;M)/\sigma)}
{\sum_{\ell\in\mathcal J(s)} \exp(\bar V_{s\ell}(z,\xi;M)/\sigma)}.
\]

因此可以推出：

\[
\frac{\partial P_{sj}}{\partial M}>0,
\qquad
\frac{\partial^2 P_{sj}}{\partial M\partial \xi}>0
\]

对关键重组方向成立。

#### 4. 进入条件

\[
\int V_B(z_0,\xi;M)\,dG(z_0)\le c_{EB},
\qquad
\int V_C(z_0,\xi;M)\,dG(z_0)\le c_{EC}.
\]

如果 `MAH` 在更高 `\xi` 下更能提高 `V_B`，那么研发型进入边际就会更强。

### 4.4 新结构经济学还进入了创新回报函数

除了摩擦和转换成本，发展阶段 `\xi` 还进入创新收益对象：

- `A` 型创新回报 `\Omega_A(z,\xi)`
- 外包 implementation 收益 `R_O(z,\xi)`
- 内部 implementation 收益 `R_I(z,\xi)`

推荐维持的解释是：

\[
\frac{\partial \Omega_A}{\partial \xi}>0,
\qquad
\frac{\partial R_O}{\partial \xi}>0,
\qquad
\frac{\partial R_I}{\partial \xi}>0.
\]

这表示：

- 越接近原研药创新阶段，原研药创新本身的经济价值越高；
- 制度改革的收益也越容易转化为创新回报。

### 4.5 所以，新结构经济学到底带来了什么额外结果

如果没有新结构经济学，模型只能说：

- `MAH` 降低商业化摩擦；
- 企业分化；
- 原研药创新上升。

加入 `\xi` 和 `\Lambda(z,\xi)` 之后，模型还可以额外推出：

1. `MAH` 的创新效应具有发展阶段异质性；
2. `MAH` 的组织重构效应具有能力异质性；
3. “制度是否适宜发展阶段”可以被翻译成可检验的异质性命题，而不只是理论口号。

### 4.6 一句最简洁的总结

最简洁地说，新结构经济学在模型里的进入方式是：

> 把“适宜制度安排”翻译成 `MAH` 对商业化摩擦和组织重构门槛的改善程度，并让这种改善通过 `\Lambda(z,\xi)` 依赖于企业能力和发展阶段。

### 4.7 这些参数与函数的建模来源是什么

这一点需要明确区分两层：

1. **新结构经济学原始文献提供的是理论命题。**  
   也就是：发展阶段不同，适宜制度不同；政府通过制度供给改善结构升级条件；市场在新的制度边界下完成资源配置。

2. **把这些命题写进模型，采用的是标准经济学建模操作。**  
   也就是：阶段异质性、政策楔子、组织形式固定成本、动态离散选择和 implementation value 这几类成熟写法。

换句话说，`Lin` 这条线给了“为什么要这样想”，而真正把它写成 `\xi`、`\Lambda(z,\xi)`、`\tau(z,\xi,M)`、`\kappa_{sj}(z,\xi,M)` 的，是标准异质企业和动态选择建模方法。

#### 4.7.1 新结构经济学理论命题的直接来源

新结构经济学上层理论最主要来自：

1. [Lin (2011), *New Structural Economics: A Framework for Rethinking Development*](https://academic.oup.com/wbro/article/26/2/193/1642270)
2. [Lin (2012), *New Structural Economics: A Framework for Rethinking Development and Policy*](https://openknowledge.worldbank.org/entities/publication/d43bcbb3-4470-55c8-9d28-f36de538ad2a)
3. [Lin and Monga (2011), *Growth Identification and Facilitation: The Role of the State in the Dynamics of Structural Change*](https://openknowledge.worldbank.org/entities/publication/3b2c2e97-a4ba-5f4e-ac4b-1da09e6821ae)
4. [Lin and Wang (2017), *The Facilitating State and Economic Development*](https://research.manchester.ac.uk/en/publications/the-facilitating-state-and-economic-development-the-role-of-the-s)

这些文献直接支持的是：

- 制度安排要与发展阶段和产业升级需求匹配；
- 市场是资源配置的基础机制；
- 政府要通过制度、协调和基础设施提供促进结构升级的条件；
- 企业和产业的“可行性/承接能力”是制度能否发挥作用的微观基础。

但这些文献并没有直接给出你这篇文章所需的异质企业动态方程。  
因此，模型里的具体函数形式，必须从更标准的产业组织、异质企业和动态选择文献中借方法。

#### 4.7.2 发展阶段参数 `\xi` 的建模来源

把 `\xi` 写成“发展阶段参数”，最接近的是**阶段异质性 / distance-to-frontier** 这条文献，而不是某篇新结构经济学论文的既有公式。

最重要的参考是：

1. [Acemoglu, Aghion, and Zilibotti (2006), *Distance to Frontier, Selection, and Economic Growth*](https://www.nber.org/papers/w9066)
2. [Acemoglu, Aghion, and Zilibotti (2003), *Vertical Integration and Distance to Frontier*](https://www.nber.org/papers/w9191)

这组文献的标准操作是：

- 经济体所处阶段不同；
- 同一制度或组织形式在不同阶段效果不同；
- 越接近 frontier，越适合某些更复杂、更依赖创新的组织形式。

因此，你这里的

\[
\xi
\]

不是任意加进来的装饰变量，而是参考了“阶段异质性决定最优组织与政策效果”的标准建模方式。  
在你的文章里，它被重新解释为：

- 中国医药产业从仿制走向原研的升级阶段；
- `MAH` 是否更适合这个阶段的制度需求。

#### 4.7.3 制度适配函数 `\Lambda(z,\xi)` 的建模来源

像

\[
\Lambda(z,\xi)=z^{\alpha}\xi^{\nu}
\]

这样的适配函数，**不是从某一篇文献直接照搬的原式**，而是一个经过结构化翻译后的简约参数化。

它背后的标准经济学依据有两部分：

1. **阶段异质性**：制度效果依赖于发展阶段  
   参考 [Acemoglu, Aghion, and Zilibotti (2006)](https://www.nber.org/papers/w9066)

2. **企业异质性决定组织形式排序**  
   参考 [Antràs and Helpman (2004), *Global Sourcing*](https://www.nber.org/papers/w10082)

因此，`\Lambda(z,\xi)` 的经济学含义是：

- `z` 决定企业能否承接制度放松；
- `\xi` 决定制度是否处在更适宜的发展阶段；
- 二者共同决定制度效应强弱。

这里采用幂函数而不是更复杂的形式，原因是它满足三个标准要求：

1. 单调性清楚；
2. 比较静态容易推；
3. 数值上便于求解。

所以要诚实地说：

> `\Lambda(z,\xi)` 的思想来自“阶段异质性 + 企业异质性”文献，具体幂函数形式则是为本文问题服务的 reduced-form 参数化，而不是某篇文献的直接原式。

#### 4.7.4 商业化摩擦 `\tau(z,\xi,M)` 的建模来源

把制度影响写成企业面对的**楔子 / 摩擦项**，是异质企业和政策评价文献里非常标准的操作。

最相关的参考是：

1. [Hopenhayn and Rogerson (1993), *Job Turnover and Policy Evaluation: A General Equilibrium Analysis*](https://econpapers.repec.org/RePEc%3Aucp%3Ajpolec%3Av%3A101%3Ay%3A1993%3Ai%3A5%3Ap%3A915-38)
2. [Restuccia and Rogerson (2008), *Policy Distortions and Aggregate Productivity with Heterogeneous Plants*](https://www.nber.org/papers/w13018)
3. [Fons-Rosen, Roldan-Blanco, and Schmitz, *The Effects of Startup Acquisitions on Innovation and Economic Growth*](https://cepr.org/publications/dp17752)

这条线的标准做法是：

- 不一定把制度全都做成深层博弈；
- 先把制度作用写成企业利润或价值函数中的摩擦、固定成本或 tax-like wedge；
- 再研究这种楔子如何影响进入、退出和分布。

所以你这里的

\[
\tau(z,\xi,M)=\bar{\tau}-M\Delta_{\tau}\Lambda(z,\xi)
\]

本质上就是一个**制度性商业化摩擦楔子**。  
它的作用是把“`MAH` 降低研发成果商业化障碍”翻译成企业问题里的标准摩擦项。

#### 4.7.5 组织重构成本 `\kappa_{sj}(z,\xi,M)` 的建模来源

把企业边界变化写成**状态依赖的固定成本/切换成本**，主要参考的是组织形式选择和动态选择文献。

最相关的参考包括：

1. [Antràs and Helpman (2004), *Global Sourcing*](https://www.nber.org/papers/w10082)
2. [Acemoglu, Aghion, and Zilibotti (2003), *Vertical Integration and Distance to Frontier*](https://www.nber.org/papers/w9191)
3. [Gans and Stern (2003), *The Product Market and the Market for “Ideas”*](https://www.kellogg.northwestern.edu/faculty/research/detail/2003/the-product-market-and-the-market-for-ideas-commercialization/)
4. [Arora, Fosfuri, and Gambardella (2001), *Markets for Technology and Their Implications for Corporate Strategy*](https://ideas.repec.org/a/oup/indcch/v10y2001i2p419-51.html)

这些文献共同支持的标准操作是：

- 企业异质性决定其更适合外包、整合还是合作；
- 组织形式之间切换伴随固定成本或治理成本；
- 企业边界的变化不是连续微调，而是离散选择。

所以你这里的

\[
\kappa_{sj}(z,\xi,M)
\]

在方法上是很标准的：  
它不是“新结构经济学专用函数”，而是用标准组织选择成本来承载“制度适配”这层含义。

#### 4.7.6 状态转移概率 `P_{sj}` 的建模来源

把 `A/B/C` 之间的组织切换写成**动态离散选择**，主要参考的是：

1. [Rust (1987), *Optimal Replacement of GMC Bus Engines*](https://econpapers.repec.org/RePEc%3Aecm%3Aemetrp%3Av%3A55%3Ay%3A1987%3Ai%3A5%3Ap%3A999-1033)
2. [Hotz and Miller (1993), *Conditional Choice Probabilities and the Estimation of Dynamic Models*](https://academic.oup.com/restud/article/60/3/497/1570375)

这组文献给你的不是产业背景，而是技术操作：

- 先写 alternative-specific value `\bar V_{sj}`
- 再加入极值型冲击
- 得到 logit 型状态转移概率

所以：

\[
\bar V_{sj}(z,\xi;M)
=
\Pi_j(z,\xi;M)-\kappa_{sj}(z,\xi,M)+\beta E[V_j(z',\xi;M)\mid z,s,j]
\]

和

\[
P_{sj}(z,\xi;M)
=
\frac{\exp(\bar V_{sj}(z,\xi;M)/\sigma)}
{\sum_{\ell\in\mathcal J(s)}\exp(\bar V_{s\ell}(z,\xi;M)/\sigma)}
\]

这种写法，是标准动态离散选择，而不是新结构经济学独有的技术。

#### 4.7.7 idea 价值 `\Psi_B` 的建模来源

把创新拆成 `invention` 和 `implementation`，并让制度通过 implementation value 影响创新激励，主要参考的是：

1. [Fons-Rosen, Roldan-Blanco, and Schmitz](https://cepr.org/publications/dp17752)
2. [Gans and Stern (2003)](https://www.kellogg.northwestern.edu/faculty/research/detail/2003/the-product-market-and-the-market-for-ideas-commercialization/)
3. [Arora, Fosfuri, and Gambardella (2001)](https://ideas.repec.org/a/oup/indcch/v10y2001i2p419-51.html)

这条线给你的标准操作是：

- idea 的价值取决于后续 commercialization path；
- 创新不是“研发自动转化为产出”；
- 制度和组织边界通过 implementation value 影响创新强度。

所以你这里的：

- `\Psi_B^O`
- `\Psi_B^I`
- `\Psi_B=\max\{\Psi_B^O,\Psi_B^I,0\}`

是有明确模型祖先的。

#### 4.7.8 最后应该怎样对外表述最稳

如果以后老师、合作者或审稿人问“这些函数是哪篇来的”，最稳的回答不是硬说“出自某一篇现成论文”，而是清楚地区分：

1. **理论命题来源**：新结构经济学原始文献  
2. **数学进入方式来源**：阶段异质性、政策楔子、组织形式选择和动态离散选择这些标准模型操作  
3. **具体函数形式**：为本文问题服务的 reduced-form 参数化

最稳的正式写法可以是：

> 本文并不直接采用新结构经济学中的某一现成形式化模型，而是借用其关于“发展阶段、制度适配与政府-市场分工”的核心思想，并将其嵌入异质企业行业动态框架。具体而言，本文参考阶段异质性文献，用发展阶段参数刻画产业升级环境；参考异质企业政策楔子文献，将制度影响写为商业化摩擦和组织重构成本；参考组织形式选择与动态离散选择文献，将企业边界重构写成带状态依赖成本的动态选择问题。

## 5. 论文里最稳的正式中文

### 5.1 引言/理论动机版

> 本文从新结构经济学视角出发，关注适宜发展阶段的制度安排如何影响医药创新与产业升级。新结构经济学强调“有效市场”与“有为政府”共同发挥作用：一方面，政府通过制度供给改善企业面临的制度性约束；另一方面，市场通过企业进入、退出、分工和重组实现资源配置。对中国医药产业而言，随着产业发展重心由仿制药生产逐步转向原研药研发与商业化，原有更强调研发、持证与生产绑定的制度安排逐渐难以满足产业升级需求。`MAH` 改革的意义正在于通过重新界定药品所有权与生产责任边界，降低研发型企业商业化创新成果的制度门槛，使更符合当前发展阶段需求的组织形式和产业分工得以形成。基于此，本文将 `MAH` 理解为一项可能适宜于当前医药产业发展阶段的制度变革，并检验其是否通过企业分化、研发型企业发展和商业化摩擦下降来促进原研药创新。

### 5.2 文献综述/贡献版

> 现有关于医药制度与创新的研究，较多从审批时限、临床开发时间或市场准入等角度讨论监管对创新的影响，政策机制主要集中于审评效率、市场结构或企业性质变化。本文则从新结构经济学所强调的“发展阶段与适宜制度安排匹配”出发，关注 `MAH` 这一制度变革如何通过改变研发所有权与生产能力之间的制度边界，诱导企业分化和组织重构，并进一步促进原研药创新。与将制度视为单纯外生冲击的政策评估文献相比，本文更强调制度安排与产业升级需求之间的匹配关系，从而为理解适宜制度结构如何影响技术创新与产业升级提供补充证据。

## 6. 实证上怎么呼应这套视角

如果你要让“新结构经济学”不只停留在口号上，最适合加的不是更复杂的模型，而是异质性和阶段性检验。

最自然的几类是：

- 不同地区发展阶段、产业基础或医药产业集聚度下，`MAH` 效果是否不同；
- 不同企业初始能力结构下，`MAH` 是否更能促进研发型企业发展；
- 原研药创新指标是否比泛创新指标更敏感；
- 企业分化与组织重构是否是制度促进创新的关键中介。

这会让“制度是否适宜发展阶段”这句话在实证上更有内容。

### 6.1 识别上能做什么

新结构经济学进入模型以后，识别上最适合做的是：

- `MAH × 地区发展阶段`
- `MAH × 产业基础`
- `MAH × 企业初始能力`
- `MAH × 初始技术结构`

这些交互项检验的不是“政府为什么选择制度”，而是：

> 如果 `MAH` 真的是更适宜当前阶段的制度安排，那么它对创新和企业重构的作用应当在更高发展阶段、更强产业基础和更高能力企业中更强。

### 6.2 识别上暂时不能做什么

当前版本不直接识别：

- `\Lambda(z,\xi)` 本身；
- 政府最优制度选择问题；
- 制度内生形成过程；
- 精确的阶段阈值 `\xi^*`。

所以对外的最稳说法是：

> 新结构经济学在本文中主要作为上层理论视角和异质性来源进入，而不是作为完整制度内生形成的结构估计对象。

## 7. 最需要避免的写法

### 不要写成

- “本文完整刻画了制度内生于禀赋结构的形成过程”
- “本文构造了一个完整的新结构经济学模型”

因为这会把论文推向一个你现在并不打算真的完成的大框架。

### 更稳的写法是

- “本文基于新结构经济学视角”
- “本文从发展阶段与适宜制度安排匹配的角度理解 `MAH`”
- “本文把 `MAH` 的作用机制具体化为企业分化、组织重构与原研药创新激励”

## 8. 一句话总结

你现在最适合的用法是：

> 把新结构经济学作为论文的上层理论视角，用来解释为什么 `MAH` 可能是一项适宜于当前产业升级阶段的制度安排；而在具体机制和模型层面，仍然使用你已经建立的 `A/B/C` 状态转移与 invention/implementation 框架。

## 9. 为什么正文更推荐“弱整合版”，而不是“强融合版”

如果从研究设计和论文写作的可实施性出发，正文更推荐采用弱整合版，而不是把政府最优制度选择问题完整写入主模型。原因主要有五点：

1. **与实证识别更一致。**
   你的实证需要把 `MAH` 作为给定制度变化来识别；如果正文主模型再显式写政府如何最优选择 `M`，就容易引发“制度到底是外生还是内生”的追问。

2. **数学上更可解。**
   弱整合版只是在现有模型上加入发展阶段 `\xi` 和制度适配度 `\Lambda(z,\xi)`，不会显著提高 Bellman、进入条件和市场清算的求解难度。

3. **已经足够推出核心理论结果。**
   你真正需要的结论是：企业分化、原研药创新增加、阶段异质性和净福利的条件性结论。这些都可以由弱整合版推出，不必依赖完整的政府最优化块。

4. **更符合经验论文的写作纪律。**
   对以实证为主的论文来说，主模型更应强调机制清楚、对象可对应、命题能和数据一一映射，而不是引入大量难以识别的深层结构。

5. **能把新结构经济学“用得刚刚好”。**
   弱整合版已经足以体现：
   - `有为政府`：通过 `MAH` 改变制度边界；
   - `有效市场`：通过企业分化与重组完成资源配置；
   - `适宜制度安排`：通过 `\xi` 和 `\Lambda(z,\xi)` 的异质性来体现。

因此，最稳的安排是：

- 正文主模型：采用弱整合版；
- 引言与文献综述：强调新结构经济学视角；
- 强融合版：保留为理论扩展、附录或与老师讨论时的升级版。

## 10. 给合作者的最短说明

如果要把这件事最短地讲给合作者，可以直接说：

> 我们现在不是在做一个完整的新结构经济学大模型，而是在原有 `Hopenhayn + invention/implementation + A/B/C` 的框架里加入两个新结构对象：一个是发展阶段参数 `\xi`，一个是制度适配函数 `\Lambda(z,\xi)`。然后让 `MAH` 通过 `\tau(z,\xi,M)` 和 `\kappa_{sj}(z,\xi,M)` 进入模型。这样，`MAH` 的作用就不再是平均的，而是随发展阶段和企业能力变化。这个做法既保留了新结构经济学的核心思想，又不会和当前的实证识别、数学求解和数值实现发生冲突。

## 11. 可直接引用的数学表达版本

这一节给一个可以直接发给合作者、也可以在论文中引用的数学表达版本。核心是把“两层版本”分开写清楚。

### 11.1 简约版：正文推荐使用的表达

这一版里，新结构经济学不是通过完整政府最优化进入，而是通过**发展阶段参数**和**制度适配函数**进入。

#### 环境与状态

\[
z \in Z \subset \mathbb{R}_+,
\qquad
\xi \in \Xi \subset \mathbb{R}_+,
\qquad
M \in \{0,1\}.
\]

其中：

- `z` 是企业能力；
- `\xi` 是产业发展阶段；
- `M=0/1` 表示 `pre/post-MAH`。

定义制度适配函数：

\[
\Lambda(z,\xi)=z^{\alpha}\xi^{\nu},
\qquad \alpha>0,\ \nu>0.
\]

#### 新结构经济学进入商业化摩擦

\[
\tau(z,\xi,M)=\bar{\tau}-M\Delta_{\tau}\Lambda(z,\xi),
\qquad \bar{\tau}>0,\ \Delta_{\tau}>0.
\]

于是：

\[
\frac{\partial \tau}{\partial M}<0,
\qquad
\frac{\partial^2 \tau}{\partial M\partial \xi}<0,
\qquad
\frac{\partial^2 \tau}{\partial M\partial z}<0.
\]

#### 新结构经济学进入组织重构门槛

\[
\kappa_{sj}(z,\xi,M)=\bar{\kappa}_{sj}-M\Delta_{sj}\Lambda(z,\xi),
\qquad \Delta_{sj}>0.
\]

于是：

\[
\frac{\partial \kappa_{sj}}{\partial M}<0,
\qquad
\frac{\partial^2 \kappa_{sj}}{\partial M\partial \xi}<0.
\]

#### `B` 型企业的 implementation 价值

外包 implementation：

\[
\Psi_B^O(z,\xi;p_m,M)
=
\max_{i_O\in[0,1]}
\left\{
i_O R_O(z,\xi)
-\frac{\kappa_O}{\theta}i_O^\theta
-p_m-\tau(z,\xi,M)
\right\}.
\]

内部整合 implementation：

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

idea 总价值：

\[
\Psi_B(z,\xi;p_m,M)
=
\max\left\{
\Psi_B^O(z,\xi;p_m,M),\,
\Psi_B^I(z,\xi;M),\,
0
\right\}.
\]

#### 企业动态选择

\[
\bar V_{sj}(z,\xi;M)
=
\Pi_j(z,\xi;M)
-\kappa_{sj}(z,\xi,M)
+\beta E[V_j(z',\xi;M)\mid z,s,j].
\]

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

对应转移概率：

\[
P_{sj}(z,\xi;M)
=
\frac{\exp(\bar V_{sj}(z,\xi;M)/\sigma)}
{\sum_{\ell\in\mathcal J(s)}\exp(\bar V_{s\ell}(z,\xi;M)/\sigma)}.
\]

#### 进入条件

\[
\int V_B(z_0,\xi;M)\,dG(z_0)\le c_{EB},
\qquad
\int V_C(z_0,\xi;M)\,dG(z_0)\le c_{EC}.
\]

#### 这一版的经济学含义

这一版的要点是：

- 新结构经济学进入到了 `\tau` 和 `\kappa_{sj}` 里；
- 从而进入了 `\Psi_B`、`V_s`、`P_{sj}` 和进入条件；
- 最终体现为：`MAH` 的作用随发展阶段 `\xi` 和企业能力 `z` 而变化。

换句话说，**新结构经济学在简约版里是“参数异质性 + 比较静态”进入，而不是“政府最优制度选择”进入。**

### 11.2 完整版：理论扩展可使用的表达

如果要把新结构经济学再往前推一步，可以在简约版的基础上加入政府制度选择问题。

定义行业净福利：

\[
\mathcal W(M,\xi)
=
\mathcal W^{innov}(M,\xi)
+\mathcal W^{realloc}(M,\xi)
-\mathcal W^{transition}(M,\xi).
\]

政府在观察到发展阶段 `\xi` 后选择制度：

\[
M^*(\xi)\in \arg\max_{M\in\{0,1\}}\mathcal W(M,\xi).
\]

定义制度改革净收益：

\[
\Delta \mathcal W(\xi)
=
\mathcal W(1,\xi)-\mathcal W(0,\xi).
\]

则：

\[
M^*(\xi)=
\begin{cases}
1, & \text{if } \Delta \mathcal W(\xi)\ge 0,\\
0, & \text{if } \Delta \mathcal W(\xi)<0.
\end{cases}
\]

如果进一步有：

\[
\frac{d\Delta \mathcal W(\xi)}{d\xi}>0,
\]

则存在阈值 `\xi^*`，使得当 `\xi\ge \xi^*` 时，`MAH` 成为更适宜的发展阶段制度安排。

#### 这一版的经济学含义

这一版更完整地体现了：

- 发展阶段决定制度需求；
- 政府提供制度供给；
- 市场在给定制度下完成资源配置。

但它的代价也很清楚：

- 会显著放大模型；
- 会和实证中把 `MAH` 当作政策冲击的识别形成张力；
- 会把文章从“企业分化与原研药创新”推向“制度形成的大模型”。

### 11.3 两层版本怎么配合使用

最稳的安排是：

- **正文主模型**：使用 11.1 的简约版；
- **理论扩展/附录/与老师讨论**：使用 11.2 的完整版；
- **对外统一口径**：本文从新结构经济学视角理解 `MAH`，但正文只保留其最必要、最可识别、最可求解的进入方式。

### 11.4 一句最短的数学化总结

如果只用一句话概括新结构经济学在模型中的数学进入方式，可以写成：

> 本文通过引入发展阶段参数 `\xi` 与制度适配函数 `\Lambda(z,\xi)`，使 `MAH` 对商业化摩擦 `\tau(z,\xi,M)` 和组织重构门槛 `\kappa_{sj}(z,\xi,M)` 的影响依赖于企业能力与发展阶段；从而，制度效应经由 implementation 价值、状态转移概率和进入条件进入行业均衡。
