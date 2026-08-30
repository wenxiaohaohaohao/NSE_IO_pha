# MAH 模型重建 v1.2 规格修订 Gate 审计

审计状态：`APPROVED`  
审计范围：仅限 specification update checkpoint；未进入 Phase 1  
分支：`codex/mah-model-rebuild`  
锁定起点：`cd5b6e49608749e0bf32f3d9aa235a84f378347b`

## 1. 结论

规格修订检查点通过并已取得用户明确批准。批准状态 Gate 共执行 65 项检查，结果为 65 PASS、0 FAIL；当前没有 P0。v1.1 A--W 已逐项应用，随后仅按 v1.2 修正 \(x_i\) 的解释，其余 v1.1 内容继续有效。批准时间记录为 2026-08-30T13:11:40.9653412+08:00。

本检查点没有创建 Phase 1 正式输出，没有修改 `paper/manuscript/`，没有暂存、提交或推送任何文件。

## 2. 来源冻结与可重复构建

| 对象 | SHA256 | 结果 |
|---|---|---|
| frozen base execution note | `F6C11377D71E4E25D40FFB8AC9FE2EA7AA051AD7E123BA7E3A32DBA895342B24` | PASS |
| frozen amendment v1.1 | `D76856241E460D31087AB60690E85D5681806E53BD42991F725458727CCD1EA9` | PASS |
| frozen v1.2 PNG | `1C0035AB49A5FF5C207CB71C1E3F04CFAC4E333BEDDAB73841D2A72F603723E5` | PASS |
| v1.2 transcription | `06AF48B2D853EA82F7176505D2ACA4D0CBFE06E5DB52C18026308196FE85E48E` | PASS |
| effective specification | `855799897F8D519E9859EBC208DC1590017D2345464CED178E4E078B04CB5666` | PASS |
| traceability matrix, specification-approved state | `3F0671ED447CB2AF07EB3DED62730A0EF7E15437A9107539B7554E644F18A98F` | PASS |

重新运行 `scripts/apply_spec_amendments.py` 后得到 `APPLIED=55`，effective specification 的 SHA256 保持不变。规格批准后重新运行 `scripts/build_traceability_matrix.py`，得到 119 行及批准状态矩阵哈希 `3F0671...A98F`。因此两项 derived artifacts 均可确定性重建。

## 3. 规格内容审核

| 审核对象 | 结果 | 证据摘要 |
|---|---|---|
| v1.1 A--W | PASS | effective specification construction record 含 `AMD11-A` 至 `AMD11-W` |
| v1.2 correction | PASS | `AMD12-01` 存在；\(x_i\) 使用 canonical definition |
| Absolute Red Lines | PASS | `RL-01` 至 `RL-28` 连续、无缺号 |
| notation collision | PASS | novelty class 使用 `Inc`，不与 internal route `I` 重名 |
| common control | PASS | baseline 只保留共同 \(x_i\)，并使用 \(\rho_g,F_g\) mixture identities |
| timing | PASS | anticipated option-value chain 与 later realized-assignment chain 分开 |
| full draft timing | PASS | `12_full_derivation_draft.tex` 明确归入 Phase 15，Phase 16 受批准 Gate 约束 |
| Shi Gu evidence boundary | PASS | 详细结论保持 `UNVERIFIED`，Phase 16/18 前必须补齐 PDF 页码和表格证据 |

Traceability matrix 包含 119 个唯一 requirement IDs，包括：28 条红线、23 个 v1.1 amendment IDs、1 个 v1.2 ID、Phase 1--18 deliverable/gate IDs、proof/economic QA IDs 和 13 项 success criteria。

## 4. Git 与范围隔离审核

| 检查 | 结果 | 证据 |
|---|---|---|
| 独立分支 | PASS | `codex/mah-model-rebuild` |
| 锁定起点 | PASS | `cd5b6e49608749e0bf32f3d9aa235a84f378347b` 是当前 rebuild 分支 HEAD 的祖先 |
| manuscript read-only | PASS | 相对锁定起点，`paper/manuscript/` diff 为空 |
| collaborator ZIP isolation | PASS | 原 checkout 仍单独显示该 ZIP 为 modified；独立 worktree 对该 ZIP 的 status 为空 |
| worktree scope | PASS | 当前新增文件仅位于 `paper/model_rebuild/` 和 `paper/model_notes/` |
| Phase 1 boundary | PASS | `01_primitives_and_timing.tex` 等 Phase 1 正式文件不存在 |

## 5. 状态机审核

- specification：`READY FOR APPROVAL`，批准字段仍为 `No`。
- Phase 1--17：均为 `NOT STARTED`。
- Phase 18：`BLOCKED`。
- 18 行 Phase 状态完整。
- 当前没有 P0。
- 详细 Shi Gu 结论是当前 P1 evidence issue；若 Phase 16/18 前仍未核实，则转为 P0 blocker。

## 6. 审计工具自身复核

审计脚本第一次运行在 PowerShell strict mode 下因空集合的 `.Count` 访问而终止，未产生 Gate 结论。脚本随后将可能为空或单值的管道结果显式包装为数组，并增加完整 119-ID 集合比较。批准状态下从头执行全部检查，结果为 65 PASS、0 FAIL；JSON 证据保存在 `specification_gate_results.json`。

本检查点没有 LaTeX 阶段模块，因此没有进行 LaTeX compilation。LaTeX wrapper 检查从 Phase 1 正式输出开始执行。

## 7. 强制暂停

本规格检查点已经取得用户明确批准。现在只允许依序：

1. 创建唯一 specification commit；
2. 推送至 `origin/codex/mah-model-rebuild`；
3. 单独开始 Phase 1 preflight。

本次批准不等于 Phase 1 Gate 批准，也不授权进入 Phase 2。
