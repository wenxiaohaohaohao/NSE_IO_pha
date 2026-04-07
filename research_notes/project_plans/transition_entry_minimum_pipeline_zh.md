# Transition / Entry 最小数据管道实施路径（详细版）

## 目标

在不等待完整大样本清洗完成的前提下，先产出一版“粗糙但非占位”的可检查结果：
- pre/post incumbent transition matrix
- pre/post entrant composition
- 最小 QA 报告

输出目标文件：
- `research_notes/transition_matrix_pre_policy.csv`
- `research_notes/transition_matrix_post_policy.csv`
- `output/doc/transition_entry_minimum_qa.md`

---

## Step 1. 冻结最小口径（先定再算）

1. 设定 firm-year 分类变量：
- `type_A`（综合型）
- `type_B`（研发型）
- `type_C`（生产型）
- `type_T`（过渡态，仅用于校验，不进入稳态三类型）

2. 设定政策分段：
- pre-MAH 窗口
- post-MAH 窗口

3. 设定 transition 口径：
- 同一 firm 从 `t` 到 `t+1` 的类型变更
- 退出定义（样本中消失规则）

4. 设定 entrant 口径：
- 首次出现在样本中的 firm-year
- entrant first observed type

完成判据：
- 以上四项写入脚本头部注释并固定。

---

## Step 2. 构建最小输入面板（无需完美）

1. 输入最小字段：
- `firm_id`
- `year`
- 分类所需原始字段（研发、生产、混合判定字段）
- 政策期标记字段或可由 year 推导

2. 先做最小清洗：
- 去重：同 firm-year 保留唯一记录
- 缺失处理：无法分类的记录先标记为 `unknown` 并统计占比

3. 生成 `panel_minimum.dta`（或内存中对象）

完成判据：
- 能输出样本基数、firm 数、year 覆盖。

---

## Step 3. 生成类型标签与过渡态检查

1. 生成离散类型变量 `type3`：`A/B/C`。
2. 可选生成 `type_raw`：`A/B/C/T/unknown` 仅用于 QA。
3. 先做静态分布检查：
- 各年 A/B/C 占比
- unknown 占比

完成判据：
- unknown 占比可报告；若超过阈值（如 15%），在 QA 中单列风险。

---

## Step 4. 计算 incumbent transition matrix

1. 对每个 firm 构造 `type_t` 与 `type_t1`。
2. 样本限定：
- incumbent 口径排除 entrant 年
- 仅使用 `A/B/C` 到 `A/B/C`（可单独报告 exit）

3. 分别在 pre/post 窗口汇总：
- 行为起点类型 `type_t`
- 列为下一期类型 `type_t1`
- 单元格为行标准化概率

4. 导出 CSV：
- pre 到 `transition_matrix_pre_policy.csv`
- post 到 `transition_matrix_post_policy.csv`

完成判据：
- 每行和为 1（容许浮点误差）。
- 不再含 `NA` 占位。

---

## Step 5. 计算 entrant composition

1. 定义 entrant：首次出现年份。
2. 读取 entrant 首次类型 `A/B/C`。
3. 分 pre/post 计算向量 `e(M)`。
4. 输出结果表到 `output/doc/`。

完成判据：
- pre/post entrant 总量可报告。
- 组成向量三项和为 1。

---

## Step 6. 最小 QA（必须交付）

在 `output/doc/transition_entry_minimum_qa.md` 报告：
1. 样本规模：firm、firm-year、年份覆盖。
2. 分类覆盖：A/B/C/unknown 占比。
3. transition 行和检查。
4. entrant 识别检查：首次出现逻辑抽样核对。
5. 敏感性检查：
- 去掉 unknown 后结果
- 政策窗口微调后的结果方向

完成判据：
- QA 文档齐全，可被他人复核。

---

## Step 7. 与模型对象对齐（防漂移）

1. 明确 `P(M)` 对应 transition matrix。
2. 明确 `e(M)` 对应 entrant composition。
3. 在主文中写清：
- incumbent reorganization 与 entry composition 是两个对象，不混用。

完成判据：
- 理论与实证术语一一对应，不出现混称。

---

## 建议执行顺序（3天版）

Day 1:
- 冻结口径 + 最小面板 + 类型标签

Day 2:
- transition pre/post 计算 + entrant composition

Day 3:
- QA 文档 + 与模型对象映射核对
