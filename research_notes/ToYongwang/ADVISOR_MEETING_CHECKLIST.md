# 见王老师材料整理清单

**会议日期**：2026年4月底  
**核心目标**：pre-draft research proposal 的方向确认和模型边界判断

---

## 一、必带核心材料（按使用顺序）

### 1️⃣ 见面对话脚本
- **文件**：`wang_advisor_QA_memo_final.tex` → `wang_advisor_QA_memo_final.pdf` ✅
- **用途**：
  - 自己对答时的参考框架
  - 标准话术和五个关键问题
  - 路线 A vs B 的权衡说明
- **携带形式**：PDF（建议打印 1-2 份作为参考笔记）

### 2️⃣ 幻灯片 + 讲稿
- **文件**：
  - 幻灯片本体：`slides_updated.tex` → PDF（build 目录中）✅
  - 中文讲稿：`slides_updated_talk_notes_zh.tex` → PDF ✅
- **用途**：
  - 现场展示幻灯片
  - 讲稿用于自己准备和记备忘
  - 逐页讲法的参考
- **携带形式**：在电脑上展示或打印幻灯片；讲稿自己参考

### 3️⃣ 论文主稿
- **文件**：`main.tex` → `main.pdf`（build/main 目录）✅
- **用途**：
  - 展示当前完整论文框架
  - 老师提问时的详细参考
  - 提供精确的模型定义和比较静态推导
- **携带形式**：
  - 电子版（iPad 或笔记本上）
  - 可选：打印论文关键部分（如模型部分）

---

## 二、支撑材料（按可能需要的顺序）

### 🔹 模型解释和基线材料
- **文件**：
  - `materialUpdated/mah_model_discipline_bilingual.tex` → PDF ✅
  - `materialUpdated/mah_mechanism_explanation_appendix_cn.tex` → PDF ✅
  - `materialUpdated/mah_baseline_revision_cn.tex` → PDF ✅
- **用途**：
  - 当老师问"模型具体怎样设定"时的快速参考
  - 机制解释更深层的细节
  - 基线模型 vs 扩展版本的对比
- **携带形式**：备在电脑上，老师提问时按需调用；不必打印

### 🔹 论文评审意见
- **文件**：`paper-reviews/main_review_zh_20260419.tex` → PDF
- **用途**：
  - 自己内部梳理过的问题清单
  - 如果老师提出的问题与评审重合，可以展示已思考过
- **携带形式**：自己参考即可，可能不用展示给老师

### 🔹 其他笔记
- `mah_tech_direction_feedback_v2.tex` - 技术方向反馈
- `coauthor_note_updated_tau_ext.tex` - 合作者笔记
- 用途：深层讨论时的补充参考，优先级较低

---

## 三、检查清单（会议前一天）

- [ ] **slides_updated.pdf** 已编译并可正常展示
- [ ] **wang_advisor_QA_memo_final.pdf** 已打印或在平板上可查阅
- [ ] **slides_updated_talk_notes_zh.pdf** 已导入笔记本（讲稿参考）
- [ ] **main.pdf** 已更新且可在电脑上快速打开
- [ ] **mah_model_discipline_bilingual.pdf** 已备好（深入讨论用）
- [ ] 笔记本或纸笔已准备（记录老师反馈）
- [ ] 确认老师办公室可连网或已下载所有必要PDF

---

## 四、会议进程建议

### 开场（2-3分钟）
- 打开 **slides**，快速说明今天的目标
- 使用 **标准话术** 从 `wang_advisor_QA_memo_final` 中的"开场怎么说"部分

### 主体（20-30分钟）
- 逐页展示幻灯片，参考 **讲稿** 的"建议讲法"
- 使用 **main.tex 论文** 作为细节参考
- 按顺序讲完五个关键问题的框架

### 老师反馈（10-15分钟）
- 准备 **mah_model_discipline_bilingual.pdf** 和其他模型材料以备快速调用
- 记录反馈，后续对应论文修订

### 结束
- 明确后续行动和修改方向

---

## 五、本次见面的四个判断点（来自 QA 备忘录）

待老师给出意见：
1. ✅ 科学问题是否成立？（MAH 作为 implementation-route assignment reform）
2. ✅ 机制是否正确抓准？（$\tau_{ext}$ 下降）
3. ✅ 模型是否过度复杂？（A/B/C、$z$、$\tau_{ext}$、$\Psi_B^O$ 等）
4. ✅ 经验层级是否正确？（第一层：route use、realization；第二层：transition、type-C）
5. ✅ 第一版做路线 A 还是升级到路线 B？

---

## 六、关键文件状态

| 文件 | 核心内容 | PDF 编译 | 优先级 | 
|------|--------|---------|--------|
| wang_advisor_QA_memo_final | 见面对话框架 | ✅ | 🔴 必须 |
| slides_updated | 幻灯片展示 | ✅ | 🔴 必须 |
| slides_updated_talk_notes_zh | 讲稿 | ✅ | 🔴 必须 |
| main | 论文完整版 | ✅ | 🟡 重要 |
| mah_model_discipline_bilingual | 模型规范 | ✅ | 🟡 重要 |
| mah_mechanism_explanation_appendix_cn | 机制细节 | ✅ | 🟡 重要 |
| paper-reviews/main_review_zh_20260419 | 评审反馈 | - | 🟢 参考 |

---

**最后提醒**：见老师前，建议自己把 QA 备忘录从头读一遍，确保标准话术和五个关键问题印在脑子里。
