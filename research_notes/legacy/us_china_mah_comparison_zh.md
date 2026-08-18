# 中国 `MAH` 与美国长期 `FDA` 框架的制度对照

这份笔记回答三个问题：

1. 中国 `MAH` 和美国相关制度到底相同在哪；
2. 它们到底不同在哪；
3. 论文里怎样表述最稳，既能说明“中国不是完全原创”，又不会误写成“美国也经历了同样的一次制度改革”。

## 1. 最重要的结论

最稳的结论不是“美国也搞了一个和中国完全一样的 `MAH` 改革”，而是：

> 美国长期以来就在 `FDA` 框架下允许药品申请持有人、产品所有人或 sponsor 与实际生产设施相分离；因此，美国更像是中国 `MAH` 改革所靠近的制度参照系，而不是一个具有清晰改革起点、可以直接与中国做同类政策冲击对比的案例。

换句话说：

- **中国**：`MAH` 是一次明确的制度改革，改变了原先“研发/持证/生产更强绑定”的制度环境；
- **美国**：长期就存在 sponsor / owner / contract facility 分工，不是近年才突然允许的。

因此，对你这篇论文最合适的用法是：

- 把美国写成**制度背景和机制参照**；
- 不把美国写成“中国之外另一个同样的改革实验”。

## 2. 中国与美国相同的地方

### 2.1 都允许“持有人/所有人”与“实际生产者”分离

美国 `FDA` 关于合同生产质量协议的官方指南明确区分了 `owner` 和 `contract facility`，并指出该指南讨论的是双方如何划分制造活动、以确保符合 `CGMP` 要求。[FDA 2016 Guidance](https://www.fda.gov/regulatory-information/search-fda-guidance-documents/contract-manufacturing-arrangements-drugs-quality-agreements-guidance-industry)

同一份指南还明确指出：

- owner 可以把部分或全部制造活动交由外部设施完成；
- 这类 contracting 可以提高速度和效率、提供技术专长、扩展产能；
- owner 与 contract facility 需要通过质量协议明确职责边界。

这和你在中国 `MAH` 背景下想讲的“研发主体保留项目/持证权，生产由外部设施完成”是高度相通的。

### 2.2 都支持专业化分工

美国 `FDA` 指南对合同制造的定义覆盖很广，包括：

- formulation
- fill and finish
- analytical testing
- packaging and labeling
- sterilization

这说明美国制度长期允许药品产业链中不同环节由不同主体承担，而不要求所有能力都内生在一个企业内部。[FDA Guidance PDF](https://www.fda.gov/downloads/drugs/guidances/ucm353925.pdf)

### 2.3 都意味着“所有权与制造能力不必完全捆绑”

这正是你论文最核心的制度含义。美国的监管结构本身就说明：

- 企业可以保留药品申请/所有权层面的控制；
- 具体制造活动可以外包给 contract facility；
- 创新主体不必从一开始就自己拥有全部制造能力。

从经济学上说，这和你要讲的“研发-生产边界可分离”是一致的。

## 3. 中国与美国不同的地方

### 3.1 中国是制度改革，美国是长期制度环境

这是最关键的差别。

中国 `MAH` 有明确的改革时点和制度扩散路径：

- 先试点
- 后推广

所以你可以做：

- `DID`
- event study
- 转移矩阵前后对比

美国则不同。美国不是近几年“开始允许持有人和生产者分离”，而是这种安排长期存在于 `FDA` 实践中。因此：

- 很难把美国写成一个“改革前后”的识别框架；
- 更适合把美国写成一种成熟的组织形态和监管环境。

### 3.2 美国强调 owner 与 contract facility 同时承担质量责任

美国 `FDA` 这点特别明确。官方指南指出：

- 每个参与制造的主体都要为其执行的制造活动遵守 `CGMP` 负责；
- 当 owner 使用 contract facility 时，owner 的质量部门对最终放行仍负法律责任；
- 质量协议不能把法定责任转移掉。

见 [FDA Guidance PDF](https://www.fda.gov/downloads/drugs/guidances/ucm353925.pdf) 中关于 owner/contract facility responsibilities 的说明。

这和很多中文语境里对 `MAH` 的直觉理解不同。`MAH` 不是“外包后持有人不再负责”，而是“可以分工，但责任结构更复杂、更契约化”。

### 3.3 美国有更成熟的 contract manufacturing / virtual company 生态

美国在 generic 框架下甚至明确承认：

- 合同制造组织 `CMO` 是单独的一类设施；
- `ANDA` 持有人与制造设施可以不是同一主体；
- 不从事任何制造环节的“virtual company”可以持有 `ANDA`，但其自身不一定需要按制造设施去 self-identify。

相关 `FDA` 问答与 `GDUFA` 页面反映了这种长期存在的组织形式：[GDUFA page](https://www.fda.gov/industry/fda-user-fee-programs/generic-drug-user-fee-amendments#lists)

尤其是 `GDUFA` 对 `CMO` 的定义很有启发：如果一个 finished dosage form 设施被识别在批准的 `ANDA` 中，但该设施并不出现在由该设施所有者或其关联方持有的 `ANDA` 中，则其可被视为 `CMO` 并缴纳相应 `CMO` 设施费。[FDA GDUFA page](https://www.fda.gov/industry/fda-user-fee-programs/generic-drug-user-fee-amendments#lists)

这说明在美国，药品所有权/申请持有与实际生产外包的分离，已经进入较成熟、较制度化的状态。

## 4. 美国制度的经济影响，最稳该怎么理解

如果你问“美国这套制度的影响是什么”，最稳的回答不是去找一篇“美国 `MAH` 改革导致创新上升”的论文，因为我目前没有找到这样一篇干净的政策冲击研究。更稳的理解是：

### 4.1 它支持了轻资产创新主体的存在

美国的监管环境允许：

- sponsor / applicant 保留项目与知识产权控制；
- 制造环节由外部 contract manufacturer 承担；
- 因而出现大量不自建工厂、但专注研发与临床推进的 biotech / virtual company。

### 4.2 它强化了创新与制造的专业化分工

这不一定意味着所有企业都拆分，而是意味着：

- 一部分企业更专注于 invention / R&D；
- 一部分企业专门提供 complementary manufacturing capability；
- 商业化能力可以通过合同关系获得，而不必全部内生。

### 4.3 它促进了 “market for ideas / market for technology”

如果创新者不必一开始就自己拥有完整下游产能，那么：

- 小创新主体更容易进入；
- 技术更容易通过授权、合作、联盟、交易等方式被商业化；
- 行业更可能出现“发明在小企业，实施在更擅长 complementary assets 的主体”这一结构。

这也是你论文最应该借美国文献去讲的地方。

## 5. 美国有没有“相关研究”

有，但大多数不是“美国引入 `MAH` 后的因果估计”，而是以下几类文献。

### 5.1 市场化商业化与 `market for ideas`

- [Gans, Hsu, and Stern (2000/2002), *When Does Start-Up Innovation Spur the Gale of Creative Destruction?*](https://www.nber.org/papers/w7851)
  - 这篇文章最贴近你要讲的美国经验事实：高科技尤其是医药领域，startup 可以通过 licensing、strategic alliances 或 acquisition 与 incumbents 合作商业化；合作概率与知识产权控制、VC 支持、专用 complementary assets 的成本有关。

- [Arora, Belenzon, and Suh (2021/2022), *Science and the Market for Technology*](https://www.nber.org/papers/w28534)
  - 这篇说明运作良好的 `Markets for Technology` 允许发明者把技术卖给更能利用它的主体；科学性更强、更新颖、规模更小的发明者，其发明更容易被交易。

这两篇都不是 `MAH` paper，但它们能很好支撑你的机制句子：

> 当所有权与实施能力可以分离时，小创新主体更容易通过市场化交易和外部 complementary assets 实现商业化。

### 5.2 美国 biomedical entrepreneurship / commercialization 渠道

- [Biomedical academic entrepreneurship through the SBIR program](https://www.sciencedirect.com/science/article/abs/pii/S0167268107000121)
  - 这篇研究发现，`SBIR` 被 biomedical academic scientists 用作 commercialization channel，而且与 follow-on VC funding、patenting 等表现相关。

这篇对你有两个用处：

- 它说明美国确实存在“上游创新主体 -> 商业化渠道 -> 后续融资”的结构；
- 它也提醒你：在美国，融资和商业化往往是联动的，但不一定需要单独建完整融资合同模型。

### 5.3 更广义的生产外包 / factoryless 组织形式

- [Kamal (2018), *A Portrait of U.S. Factoryless Goods Producers*](https://www.nber.org/papers/w25193)
  - 这篇不是药品专门文献，但它非常适合做组织形式类比：所谓 `factoryless` 企业把 physical transformation 外包出去，同时保留知识产权和对销售的控制。

这和你在 `MAH` 语境里讲的“持有人保留项目/知识产权控制，生产由外部完成”在组织经济学上非常接近。

## 6. 论文里最稳的写法

我最推荐你在论文里用下面这套口径：

> 中国的 `MAH` 改革并非凭空创造了一种全新的药品组织模式，而是使国内制度安排更接近美国等成熟药品监管体系中长期存在的 sponsor-holder 与 contract manufacturing 分工结构。与中国不同，美国并不存在一个与本文可比的单一 `MAH` 改革时点；因此，美国更适合作为制度背景和组织机制的参照，而不是作为同类政策冲击的对照实验。美国相关文献更多表明，在持证/所有权与实施能力可以分离的制度环境下，小型创新主体更容易通过 licensing、alliances、contract manufacturing 或其他市场化渠道完成商业化。

这个版本有几个优点：

- 承认中国借鉴了成熟监管体系；
- 不会误导读者以为美国也有一场完全可比的 `MAH` 改革；
- 能自然接到 `market for ideas`、startup commercialization 和 contract manufacturing 文献。

## 7. 对你论文最有用的结论

如果以后你只想记住一句话，那就是：

> 美国对你最重要的意义，不是提供一个“同类改革”的对照样本，而是提供一个长期存在的制度参照：在 sponsor / owner 可以保留控制、而制造能力可以通过 contract facility 获得的环境下，专业化创新主体、市场化商业化和产业链分工更容易出现。

这句话最适合放在引言后半段、制度背景部分或文献综述里。

## 8. 这份笔记用到的核心来源

### 官方监管来源

- [FDA: Contract Manufacturing Arrangements for Drugs: Quality Agreements Guidance for Industry](https://www.fda.gov/regulatory-information/search-fda-guidance-documents/contract-manufacturing-arrangements-drugs-quality-agreements-guidance-industry)
- [FDA Guidance PDF](https://www.fda.gov/downloads/drugs/guidances/ucm353925.pdf)
- [FDA: Generic Drug User Fee Amendments (GDUFA)](https://www.fda.gov/industry/fda-user-fee-programs/generic-drug-user-fee-amendments#lists)

### 机制与组织文献

- [Gans, Hsu, and Stern (2000/2002)](https://www.nber.org/papers/w7851)
- [Arora, Belenzon, and Suh (2021/2022)](https://www.nber.org/papers/w28534)
- [Biomedical academic entrepreneurship through the SBIR program](https://www.sciencedirect.com/science/article/abs/pii/S0167268107000121)
- [Kamal (2018), A Portrait of U.S. Factoryless Goods Producers](https://www.nber.org/papers/w25193)

## 9. 目前我没有找到的东西

截至这次整理，我**没有找到一篇和中国 `MAH` 识别设计完全同类的“美国 `MAH` 改革影响”论文**。这并不说明美国没有相关制度安排，而更可能说明：

- 美国的 sponsor / owner / contract manufacturer 分工长期存在；
- 因此缺乏一个像中国那样清晰、集中、可做前后比较的制度引入时点。

所以你这篇论文在国际比较上的强项，应当是：

- 中国提供了一个罕见的制度冲击；
- 美国提供了一个成熟的组织机制参照。
