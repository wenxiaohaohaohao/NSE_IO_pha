# MAH 模型进度、完整度与审阅指南

版本日期：2026-07-17

## 1. 完成标准

本轮把“模型已经完成”定义为同时满足以下条件：

1. 制度变量、企业状态、路线集合、概率、成本和回报的经济含义明确；
2. timing 能解释什么时候做研发、什么时候选路线、什么时候需求 CMO 支持、什么时候观察批准或上市；
3. 主文、附录、讲义和模型控制笔记使用同一套符号与 accounting；
4. route choice、R&D 最优解、CMO 市场均衡、比较静态、observed moments 与 Bellman transition 可以逐步推导；
5. 所有正负号结论都写清楚成立条件，不把二元政策做不合法的微分；
6. 经验数据能支持什么和不能支持什么被明确区分；
7. 正式 PDF 可以重复编译，且没有未解析引用、公式错误或版面溢出。

## 2. 当前总体判断

### 2.1 基准理论模型

当前完成度：**90%--92%**。

基准模型已经具备完整的对象、timing、路线 payoff、logit route choice、inclusive value、R&D FOC/SOC、CMO support-market clearing、存在唯一性、隐函数比较静态、observed outcome mapping 和 Bellman accounting。它已经可以作为论文中的正式机制模型。

剩余的 8%--10% 主要是进一步精炼而非缺少基本闭合：例如根据最终数据定义固定市场 cell `m`、给可用 CMO scarcity proxy 选择具体函数形式、决定哪些扩展进入正文。

### 2.2 校准设计

当前完成度：**约 75%--80%**。

附录已经给出 moment definition、route-share mapping、count block、缺失 pre-reform data 的处理和未来 entry module。尚未完成的是把这些方程与实际清洗后的变量逐一绑定，并运行参数校准、模拟和敏感性分析。

### 2.3 定量执行

当前完成度：**约 40%--50%**。

目前有可执行的理论 protocol，但没有足够证据表明已经完成下列工作：

- 项目级 application-to-approval 面板；
- 稳定的 holder--producer link；
- 改革前 firm capability measure；
- CMO 价格或稀缺性 proxy；
- 目标矩、权重矩阵、参数估计和不确定性区间；
- counterfactual simulation。

因此，当前可以说“模型和校准蓝图已闭合”，不能说“结构参数已经完成识别和估计”。

### 2.4 完整论文准备度

当前完成度：**约 65%--70%**。

理论机制、正式写作和文献定位已经形成。完整论文的主要瓶颈转向数据、识别和结果，而不是继续增加理论模块。

## 3. 分模块审查

| 模块 | 状态 | 关键结果 | 剩余风险 |
|---|---|---|---|
| 文章主轴 | 完成 | MAH 是 route-set / route-friction reform | 需要实证排除相邻政策机制 |
| 制度变量 | 完成 | `M` 二元、`eta` 连续 | `eta` 的数据构造需固定 |
| 项目 timing | 完成 | 规划先于最终实现 | 申请阶段数据缺失时只能识别 composite |
| route set | 完成 | `I/E/T/A`，`E` 需 `M=1,qE=1` | retained licensing 未单列 |
| route payoff | 完成 | 回报、continuation、成本和 holder burden 分开 | 某些 primitive 仍是 reduced-form object |
| realization | 完成 | `zeta=s chi` | `s` 与 `chi` 通常不能分别识别 |
| logit choice | 完成 | 位置归一化，inclusive value 精确 | scale `sigma` 需要归一化或外部信息 |
| R&D choice | 完成 | 严格凹，唯一内部解或正部解 | 二次成本是基准函数形式 |
| CMO closure | 完成 | 背景需求 + MAH 项目需求，存在唯一 | 真实市场边界和 proxy 尚需数据决定 |
| comparative statics | 完成 | route expansion、eta、price feedback、heterogeneity | 总效应符号需参数或数据约束 |
| observed moments | 完成 | realized-flow weighting | 不能把聚合 share 当代表性企业概率 |
| Bellman | 完成 | expected stock transition，避免 double counting | 不是完整产业动态模型 |
| entry | 扩展 | 附录保留 future module | 当前不应作为 baseline calibrated outcome |
| demand/CES | 背景扩展 | 解释 `R^event` 来源 | 不在基准中闭合产品市场 |
| bargaining/GHM | 背景扩展 | 解释 outside option / hold-up | 不在基准中估计完整合同 |
| welfare | 不在范围 | 没有福利命题 | 不能由 private-value 结果推出福利 |

## 4. 当前不建议继续添加的部分

### 4.1 Full general equilibrium

优点：可以同时讨论产品价格、研发投入价格、进入退出和行业分布。

缺点：需要大量额外参数、市场清算和数据；会削弱 MAH 特定 route mechanism 的可识别性。

建议：不加入当前基准。只有当论文目标改为行业定量政策评估时再考虑。

### 4.2 完整自由进入与退出

优点：可以解释研发型新企业数量变化。

缺点：需要可信的 firm-year entry panel、潜在进入者集合、进入成本分布和改革前 capability。

建议：保留为未来模块或敏感性分析，当前不做基准校准。

### 4.3 完整 bargaining / contract model

优点：可以把 `p_m`、`mu_i^E` 和 outside option 分解成合同条款。

缺点：需要合同价格、谈判权重、匹配和履约数据；当前数据很可能只能观察 composite support cost。

建议：用 GHM 作为经济解释，不把它升级为当前基准的估计模块。

### 4.4 Welfare analysis

优点：可以回答政策是否提高社会福利。

缺点：当前模型没有消费者、药品质量、价格、医保支出、外部性和失败成本的完整 accounting。

建议：明确不做福利结论，避免从创新数量机械推出福利改善。

## 5. 现在真正需要补充的内容

### 5.1 确定经验市场 cell `m`

需要决定 CMO 支持市场按什么边界清算。候选维度包括地区、剂型、技术平台和年份。

推荐原则：选择能反映生产资质和技术不可替代性、同时有足够样本的最窄可行 cell。模型当前允许每个 cell 有独立的 `H_m`、`H_C,m` 和 `p_m^*`，但没有假定跨 cell 替代。

### 5.2 构造 CMO scarcity proxy

候选变量：

1. 合格受托生产企业数量或产能；
2. 同一剂型或技术平台的项目负荷；
3. 从技术转移到生产准备的等待时间；
4. 委托生产相关费用、合同金额或服务报价；
5. 生产企业与 holder 的地理和技术匹配密度。

推荐：先用可重复构造的容量或匹配紧张度指标做 reduced-form attenuation test；没有价格数据时，不强行把 proxy 解释成精确 `p_m^*`。

### 5.3 测量企业异质性

`a_i` 应尽可能由改革前研发能力测量，例如改革前研发项目、专利、研发人员、临床管线或原研申请。

`k_i` 应尽可能由改革前内部生产能力测量，例如生产许可证、GMP 产线、剂型能力和已有生产设施。

关键要求是避免用改革后的结果变量反向定义能力，否则异质性检验会内生。

### 5.4 建立 holder--producer link

需要明确：

1. holder 与生产企业是否为不同法人；
2. 同一集团内部不同法人如何处理；
3. 多生产企业、多地址或变更记录如何处理；
4. 一个批准记录的路线状态按首次批准、当前状态还是年度状态定义；
5. retained transfer 与真正非保留转让如何区分。

该映射直接决定 observed entrusted share，必须先固定再做 log odds 或校准。

### 5.5 区分相邻改革

至少要在经验设计中处理：

- 2015 drug-review reform 与审批积压清理；
- NRDL 和市场准入变化；
- 疾病类别的需求和技术趋势；
- 地区 MAH pilot 与后续全国法律实施；
- 生产监管规则和受托生产监督强化。

Jia et al. (2023) 和 Barwick et al. (2026) 在这里不是一般背景引用，而是用于界定替代机制和必要控制。

## 6. 推荐的下一阶段顺序

1. 冻结当前理论基准，不再增加新的必需模块。
2. 固定数据中的项目、企业、holder、producer、original drug 和 route 定义。
3. 生成 route-use、original-drug count、firm capability 和 CMO scarcity 的描述统计。
4. 检查 pre-MAH structural zero 与 post-MAH intensive-margin variation。
5. 先做 reduced-form mechanism tests，再决定校准哪些 composite parameters。
6. 用实际可观测矩重写 calibration target table。
7. 运行 baseline、替代 market-cell、替代 capability measure 和 scarcity proxy 敏感性分析。
8. 最后才判断是否有足够数据加入 entry 或更完整 demand module。

## 7. 合作者审阅清单

- [ ] 是否同意文章主轴保持为 commercialization-route mechanism？
- [ ] 是否同意 `M` 与 `eta` 的区分？
- [ ] 是否同意 CMO support demand 发生在 final realization 之前，因此不乘 `zeta`？
- [ ] 是否同意 holder responsibility 用 `mu_i^E` 保留，而不是假定委托生产消除责任？
- [ ] 是否同意基准只闭合 CMO 支持市场？
- [ ] 是否有数据可以观测或构造 CMO scarcity proxy？
- [ ] 是否有申请阶段项目面板，可进一步区分 `s_i` 与 `chi_i^r`？
- [ ] 是否有改革前 firm capability 指标？
- [ ] 是否同意 aggregate observed share 必须使用 realized-flow 权重？
- [ ] 是否同意 entry、full GE 和 welfare 暂不进入基准？

## 8. 最终判断

当前模型不需要再通过增加更多理论模块来证明“完整”。在既定范围内，它已经闭合并且可推导。下一阶段的高价值工作是把真实数据定义和模型 composite objects 对齐，并用相邻改革文献帮助排除替代机制。
