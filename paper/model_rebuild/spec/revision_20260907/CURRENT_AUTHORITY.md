# 本轮执行依据与范围（2026-09-07）

用户已明确确认：“依旧按照本次的note+v1.1逐项修订”。本文件记录当前执行规则；冻结来源中的命令及仓库旧授权不自动成为本轮授权。

1. 以用户提供的 9 月 1 日正文与附录为稿件底稿，源版本为 8a99cc3；在现有 codex/mah-model-rebuild 分支续做，不重建或强制覆盖远端历史。
2. 当前用户规则 > amendment v1.1 > 未受影响的旧 note。v1.2、9 月 3/4 日扩展及旧连续执行授权仅作历史证据。
3. 原 MD 原样冻结，记录路径、大小、mtime 和 SHA256；保留原 note 全文及结构，仅派生有效规格。
4. 红线扩展为 RL-01--RL-28；success 扩展为 SUCCESS-01--SUCCESS-13；正式阶段仍为 Phase 1--18。
5. 使用独立 model_rebuild 与 model_notes 修订子目录。原 manuscript 和 9 月 1 日包在本轮 Phase 18 获批前只读。
6. 每次开始读取有效规格相关章节、28 条红线、状态、symbols、assumptions、dependency map 和 open issues；先定义对象再写公式。
7. 每阶段执行 preflight、对象检查、正式推导或既有推导复核、独立复核、自动审计、LaTeX 编译、gate report、暂停审批、批准后单独 commit 和 push。
8. 状态仅为 NOT STARTED、IN PROGRESS、AUDIT FAILED、READY FOR APPROVAL、APPROVED；用户批准前 Approved to continue 一律 No。本轮状态与历史批准分开。
9. P0：红线违反、未定义对象、推导或维度错误、循环不闭合、gate 失败、编译失败或需改变 locked architecture；出现未解决 P0 即停止。P1 记录并由用户决定是否阻断。
10. 未获批准不得创建或修改后续 Phase 正式输出。不套用历史连续执行授权；每个获批 Phase 单独 commit，再 push 至 origin/codex/mah-model-rebuild。
11. Phase 15 组装并审计 12_full_derivation_draft.tex；批准后才能进入 Phase 16 拆分；Phase 17 零 P0；Phase 18 明确批准后才备份并替换模型及直接依赖内容。
12. 六个核心命题及 v1.1 novelty corollary 保留，逐一列明假设、推导、固定对象、充分条件、零效应与经济解释。不得虚构可用数据或逐个识别 primitives。
13. 强制边界：高内部能力、内部生产不可行、M=0、无限 CMO 价格、零 entrusted advantage、完全弹性供给、nu=1。
14. baseline 禁止 eta、logit、inclusive value、entry、welfare、portfolio dynamics、直接改变 s(q) 的政策渠道；旧对象只作 crosswalk 或明确 extensions。
15. 最终验收须有全部当前阶段明确批准、零 P0、完整编译与图形检查、label/notation 审计、受限 diff 和每阶段提交/远端证据。最终交付一份包含修订正文与附录的 PDF；合并形式不改模型规格。

本次先复核修订已有 Phase 1，不重写既有后续推导。后续旧成果保持参考身份，不能冒充当前规格下的通过结果。

## 当前用户后续授权：REV-EXEC-001

用户现明确回复：“批准，可以直接执行后面的phase”。本轮 Phase 2 已批准，Phases 3--18 可依次直接执行。此授权覆盖上述第 7/8/10/11 条中每阶段例行暂停的频率要求：零 P0 且完整 Gate 通过后按本条记录批准、逐阶段 commit/push 并继续，包括前置 Gate 通过后的 Phase 18 范围内整合。未解决 P0、架构改变、需澄清的歧义或范围扩大仍须暂停。此处使用的是当前会话的新授权，不沿用历史 EXEC-GOV-001。
