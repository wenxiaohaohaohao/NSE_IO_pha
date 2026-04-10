# `FRS` 原模型与本文 `MAH` 模型的对应关系

这份笔记的目的不是说本文“照搬”了 `FRS`，而是把两者之间**保留了什么、删掉了什么、改写了什么**讲清楚，方便后面写论文、做汇报或回复老师。

## 1. 一句话概括

最准确的概括是：

> 本文不是把 `FRS` 的 startup acquisition 模型直接搬过来，而是保留其最核心的 `invention -> implementation` 两阶段创新机制，并把其中的“startup 被收购后实现 idea”改写为 “`B` 型研发企业在 `MAH` 体制下通过委托生产、组织整合或状态转移实现 idea”，再嵌入一个 `Hopenhayn` 式进入、退出与稳态分布框架。

## 2. 对照表

| 维度 | `FRS` 原模型 | 本文 `MAH` 模型 |
| --- | --- | --- |
| 研究问题 | startup acquisitions 如何影响创新 | `MAH` 如何改变研发-生产边界、企业状态转移与创新均衡 |
| 理论底层 | Schumpeterian growth model with heterogeneous firms | Hopenhayn-style heterogeneous-firm industry equilibrium |
| 企业异质性 | 有异质企业、startup 与 incumbent | 有异质企业，且组织状态异质性更强：`A/B/C` |
| 关键主体 | incumbents, startups, acquirers | `A` 一体化企业，`B` 研发专门化企业，`C` 生产专门化企业，`E` 潜在进入者 |
| 创新过程 | invention 与 implementation 分离 | invention 与 implementation 分离 |
| implementation 的主要载体 | startup acquisition / incumbent implementation | `B -> C` 委托生产，`B -> A` 内部整合，或放弃 implementation |
| 政策/制度冲击 | acquisition 相关政策或摩擦变化 | `MAH` 降低商业化摩擦 `tau_M`，降低组织切换成本 `kappa_{ij}` |
| 进入边际 | startup formation | `E -> B` / `E -> C` 进入，重点是 `B` 型创新进入 |
| incumbents 的作用 | incumbents 会创新，也会收购 startup | `A` 会创新并可重组，`C` 提供委托生产能力，部分 `C` 可升级为 `A` |
| 组织边界含义 | 谁发明、谁买下、谁实施 | 研发和生产是在企业内部一体化完成，还是在企业之间分工完成 |
| 市场清算 | 更偏 innovation/acquisition equilibrium | 明确加入 `B` 与 `C` 之间的委托生产市场清算 `p_m` |
| 状态转移 | 更强调 entry / acquisition / implementation | 明确刻画 `A <-> B/C`、`C -> A`、exit 等组织状态转移 |
| GE 反馈 | entry、incumbent innovation、implementation rate | entry、incumbent innovation、implementation、状态转移、传统生产利润、福利 |
| 融资支持 | 可通过 startup value / acquisition incentives 间接体现 | 最多作为 `entry margin` 的 reduced-form 强化项，不单列融资合同模型 |
| 本文没有借的部分 | matching、search、Nash bargaining、acquisition price | 全部不借，避免论文跑向并购/谈判模型 |

## 3. 本文到底借了 `FRS` 的哪一部分

本文真正借的是三层，而不是整篇模型：

### 3.1 借了它的“创新两阶段”结构

也就是：

- idea 先被发明出来；
- 但 idea 不会自动变成创新产出；
- 中间还有 implementation / commercialization 这一步。

这是 `FRS` 对本文最重要的贡献。

### 3.2 借了它的 GE 分解思路

也就是政策可能通过不同边际同时起作用：

- 创新型进入
- incumbents 创新
- ideas 的 implementation rate

本文把这套分解翻译成：

- `B` 型进入
- `A/B` 型既有企业创新
- `B` 型 idea 的 implementation
- `A/B/C` 之间的状态转移

### 3.3 借了它“不要只看 PE”的提醒

`FRS` 的一个重要启发是：

> 政策看起来在 partial equilibrium 下利于创新，但在 general equilibrium 下，随着 incumbents、entry 和 implementation 一起调整，结论可能会变化。

这正好对应你老师说的 `GE` 视角。

## 4. 本文对 `FRS` 的关键改写

### 4.1 把 “startup acquisition” 改写成 “MAH 下的 commercialization path”

在 `FRS` 里，startup idea 的实现往往和收购有关。

在本文里，`B` 型 idea 的实现不再依赖收购，而是依赖三种路径：

1. `B` 保持研发主体身份，委托 `C` 生产；
2. `B` 转成 `A`，自己内部完成研发+生产；
3. `B` 不实施，idea 消失。

所以本文不是 acquisition model，而是 organization / implementation model。

### 4.2 把 “startup vs incumbent” 改写成 “A/B/C 组织结构”

`FRS` 更偏：

- startup 发明
- incumbent 收购/实施

本文更偏：

- `A` 自己做研发+生产
- `B` 只做研发
- `C` 只做生产
- 企业之间可以重组和切换

因此，本文对组织边界的关注更强。

### 4.3 增加了委托生产市场

本文新增了一个 `FRS` 没有的核心块：

- `B` 对委托生产的需求
- `C` 对生产服务的供给
- 由此形成的市场清算价格 `p_m`

这个块是 `MAH` 制度最有中国特色、也最有制度内容的地方。

## 5. 本文到底借了哪些文献的哪一块

如果你要向老师或审稿人非常清楚地说，可以这样概括：

### `Hopenhayn`

贡献的是模型的“壳”：

- 进入
- 退出
- 价值函数
- 稳态分布
- 行业均衡

### `FRS`

贡献的是最关键的“创新机制”：

- invention 与 implementation 分离
- GE 下要同时看 entry / incumbent / implementation

### `market for ideas / firm boundaries`

贡献的是“经济含义”：

- 小研发主体可以不自己做全部下游
- 创新与商业化可以在不同企业间分工
- 企业会在整合与专业化之间选择

### 本文自己的改造

贡献的是具体制度映射：

- `MAH` 降低 `B` 的商业化制度摩擦
- `MAH` 降低组织切换成本
- 用 `A/B/C` 组织状态和委托生产市场来刻画制度后果

## 6. 最推荐的汇报口径

如果以后老师问“你这到底是不是在抄那篇 acquisition 模型”，最稳的回答是：

> 不是。那篇文章给我的核心启发是把创新分成 invention 和 implementation 两步，以及政策会同时影响 entry、incumbent innovation 和 implementation。我的文章没有搬它的 acquisition、matching 或 bargaining 结构，而是把 startup acquisition 改写成 `MAH` 下的委托生产、组织整合和企业状态转移，再放进一个 `Hopenhayn` 式行业均衡框架里。

这句话通常足够清楚，也足够 defend。
