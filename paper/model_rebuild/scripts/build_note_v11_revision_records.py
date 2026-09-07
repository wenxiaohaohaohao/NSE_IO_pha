from pathlib import Path
import csv,hashlib,json,re,subprocess,datetime,ast
repo=Path.cwd();spec=repo/'paper/model_rebuild/spec/revision_20260907';notes=repo/'paper/model_notes/revision_20260907';rev=repo/'paper/model_rebuild/revision_20260907'
if (spec/'provenance.json').exists():
 raise SystemExit('Initialization already completed: refusing to overwrite frozen provenance or current approval/status records.')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
base=spec/'source/MAH_model_rebuild_execution_note_for_Codex.md';amend=spec/'source/MAH_model_rebuild_amendment_v1.1_for_Codex.md';eff=spec/'MAH_model_rebuild_effective_spec_note_v1.1.md'
bl=base.read_text().splitlines();al=amend.read_text().splitlines();el=eff.read_text().splitlines()
# Snapshot source provenance and all protected manuscript/collaboration files.
records=[]
for p in (base,amend):
 orig=Path('/Users/fangyi/Documents/MAH/WeChat/0817')/p.name
 st=orig.stat();records.append(dict(source=str(orig),frozen=str(p.relative_to(repo)),bytes=st.st_size,mtime=datetime.datetime.fromtimestamp(st.st_mtime,datetime.timezone(datetime.timedelta(hours=8))).isoformat(),sha256=sha(p),matches_original=sha(p)==sha(orig)))
for name in ('mah_route_indicator_friction_model.pdf','mah_route_indicator_friction_model_appendix.pdf'):
 orig=Path('/Users/fangyi/Documents/MAH/WeChat/0901/MAH_model_update_20260901/formal')/name
 packaged=repo/'paper/collaboration/MAH_model_update_20260901/formal'/name
 records.append(dict(source=str(orig),repository_copy=str(packaged.relative_to(repo)),bytes=orig.stat().st_size,sha256=sha(orig),matches_package=sha(orig)==sha(packaged)))
protected={}
paths=subprocess.check_output(['git','ls-files','paper/manuscript','paper/collaboration/MAH_model_update_20260901','paper/model_rebuild/spec/source']).decode().splitlines()
for f in paths:protected[f]=sha(repo/f)
manifest=dict(source_commit='8a99cc3bcebd51b5db025550a201e0eec273a8f0',current_head=subprocess.check_output(['git','rev-parse','HEAD']).decode().strip(),branch='codex/mah-model-rebuild',locked_ancestor='cd5b6e49608749e0bf32f3d9aa235a84f378347b',sources=records,effective_spec_sha256=sha(eff),protected_files=protected)
(spec/'provenance.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')
# Current user instruction, distinct from frozen collaborator documents.
(spec/'CURRENT_AUTHORITY.md').write_text('''# 本轮执行依据与范围（2026-09-07）

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
''')
rows=[]
def add(id,loc,req,files,method,status='PENDING',evidence='Not revalidated in this revision',approval='No'):
 rows.append(dict(requirement_id=id,source_location=loc,requirement=req,applicable_files=files,verification_method=method,current_status=status,evidence=evidence,approval_status=approval))
for n,line in enumerate(bl,1):
 m=re.match(r'(\d+)\. Do ',line)
 if m and 1<=int(m[1])<=20:add(f'RL-{int(m[1]):02d}',f'{base.relative_to(repo)}:{n}',line,'active baseline; candidates; final manuscript','scope-aware semantic audit and protected-file hashes')
for n,line in enumerate(al,1):
 m=re.match(r'(2[1-8])\. Do ',line)
 if m:add(f'RL-{int(m[1]):02d}',f'{amend.relative_to(repo)}:{n}',line,'active baseline; candidates; final manuscript','scope-aware semantic audit')
heads=[(n,l) for n,l in enumerate(al,1) if re.match(r'#{1,2} [A-W]\. ',l)]
for j,(n,l) in enumerate(heads):
 letter=re.search(r'([A-W])\.',l)[1];end=heads[j+1][0]-1 if j+1<len(heads) else len(al)
 add('AMD11-'+letter,f'{amend.relative_to(repo)}:{n}-{end}',l,'effective specification; affected phase files','section-by-section amendment application + exact-source comparison','APPLIED_TO_SPEC',f'{eff.relative_to(repo)}; construction record','Scope authorized; output gate pending')
# Reuse descriptions from the historical matrix builder without importing its authorization state.
module=ast.parse((repo/'paper/model_rebuild/scripts/build_traceability_matrix.py').read_text())
phases=next(ast.literal_eval(a.value) for a in module.body if isinstance(a,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='phases' for t in a.targets))
starts=[(int(m[1]),n) for n,l in enumerate(bl,1) if (m:=re.match(r'# \d+\. Phase (\d+) ',l))]
for phase,start in starts:
 end=next((n-1 for ph,n in starts if ph==phase+1), next(n-1 for n,l in enumerate(bl,1) if l.startswith('# 24.')))
 deliverable,gate=phases[phase];gate=gate.replace('v1.2 x_i','v1.1 development-stage x_i')
 add(f'P{phase:02d}-D01',f'{base.relative_to(repo)}:{start}-{end}',deliverable,f'existing Phase {phase} outputs (8a99cc3); revision outputs only after preceding approval','reuse then diff/definition audit','IN PROGRESS' if phase==1 else 'NOT STARTED')
 add(f'P{phase:02d}-G01',f'{base.relative_to(repo)}:{start}-{end}',gate,f'Phase {phase} gate','independent mathematical audit; static audit; actual compile; explicit user approval','IN PROGRESS' if phase==1 else 'NOT STARTED')
 # Atomic explicit deliverables and audit bullets keep their own stable IDs.
 mode=None;counts={'D':1,'G':1}
 for n in range(start,end+1):
  line=bl[n-1]
  if re.match(r'## .*Deliverables',line):mode='D'
  elif re.match(r'## .*Audit gate',line):mode='G'
  elif line.startswith('## '):mode=None
  if mode and line.startswith('- '):
   counts[mode]+=1;add(f'P{phase:02d}-{mode}{counts[mode]:02d}',f'{base.relative_to(repo)}:{n}',line,f'Phase {phase} outputs','line-specific requirement inspection','IN PROGRESS' if phase==1 else 'NOT STARTED')
# Proof obligations individually trace every limiting boundary.
proofs=['Independently rederive every FOC and derivative','Check SOC and corners','Check units','Check signs and sufficient conditions','k_i tends to infinity','k_i below internal feasibility threshold','M=0 removes E','p_m tends to infinity preserves old choice set','Zero entrusted advantage gives zero value/advancement gain','Perfectly elastic CMO supply removes attenuation','nu=1 gives linear advancement rule']
qa_line=next(n for n,l in enumerate(bl,1) if l.startswith('# 26.'))
for j,x in enumerate(proofs,1):add(f'QA-PROOF-{j:02d}',f'{base.relative_to(repo)}:{qa_line}',x,'relevant derivation phase','independent calculation + named boundary evidence')
for j,x in enumerate(['Economic explanation for each result','Name actual margin: advancement/route/realized product','No novelty ranking imposed','No primitive-by-primitive identification claim','Source claims match verified version'],1):add(f'QA-ECON-{j:02d}','BASE §27; AMD11 H--V',x,'proof and empirical-boundary files','manual interpretation audit')
success_start=next(n for n,l in enumerate(el,1) if l.startswith('# 30.'))
for n in range(success_start,len(el)+1):
 m=re.match(r'(\d+)\. ',el[n-1])
 if m and 1<=int(m[1])<=13:add(f'SUCCESS-{int(m[1]):02d}',f'{eff.relative_to(repo)}:{n}',el[n-1],'final manuscript','full traceability audit')
for n,l in enumerate((spec/'CURRENT_AUTHORITY.md').read_text().splitlines(),1):
 m=re.match(r'(\d+)\. ',l)
 if m:add(f'GOV-{int(m[1]):02d}',f'{(spec/"CURRENT_AUTHORITY.md").relative_to(repo)}:{n}',l,'all current revision outputs','preflight, approval, commit and protected-file evidence')
assert len({r['requirement_id'] for r in rows})==len(rows)
with (spec/'instruction_traceability_matrix.csv').open('w') as f:
 w=csv.DictWriter(f,fieldnames=rows[0]);w.writeheader();w.writerows(rows)
# Concrete inventory: occurrences in original September 1 source and historical notes/candidates.
files=subprocess.check_output(['git','ls-tree','-r','--name-only','8a99cc3','paper/model_rebuild','paper/model_notes','paper/manuscript']).decode().splitlines()
hits=[]
for name in files:
 if not name.endswith(('.md','.tex')) or '/spec/' in name or '/audit/' in name:continue
 text=subprocess.check_output(['git','show','8a99cc3:'+name]).decode()
 for n,line in enumerate(text.splitlines(),1):
  if re.search(r'v1\.2|original.drug innovation investment|broader than pure|not pure clinical|clinical-development effort',line,re.I):
   hits.append(dict(file=name,line=n,existing_text=line,required_action='Replace expanded control interpretation with v1.1 development/advancement boundary; retain negative patent boundary',write_gate='Phase 18' if '/manuscript/' in name else 'Relevant phase approval chain'))
with (notes/'affected_file_inventory.csv').open('w') as f:
 w=csv.DictWriter(f,fieldnames=hits[0]);w.writeheader();w.writerows(hits)
status='''# 本轮模型修订状态

有效依据：旧 note + amendment v1.1 + 当前用户严格逐阶段规则。

历史 Phases 1--18 在仓库中记为 APPROVED；该历史不改写。本表仅记录本轮修订/复核，并不表示重新从零推导。当前阶段：既有 Phase 1 对象与 timing 修订。

| Phase | Historical record | Current revision status | Approved to continue? |
|---|---|---|---|
'''
for i in range(1,19):status+=f'| {i} | APPROVED under historical specification | '+('IN PROGRESS' if i==1 else 'NOT STARTED')+' | No |\n'
status+='''
已授权：按 note+v1.1 修订。尚未授权：把本轮阶段 gate 写成 APPROVED，跳过阶段批准，或执行本轮 Phase 18 manuscript integration。

后续阶段的 NOT STARTED 指本轮复核尚未开始，既有推导仍保存在 8a99cc3 和 9 月 1 日包中。
'''
(notes/'00_model_closure_status.md').write_text(status)
(notes/'06_open_issues_log.md').write_text('''# 本轮 Open Issues

## REV-001 — 规格差异：已获用户决策
Phase: amendment / all affected phases
Object: x_i interpretation and specification precedence
Issue: historical v1.2 expanded the interpretation; later revisions changed internal feasibility.
Economic effect: prevents a wider innovation claim from replacing development-stage advancement.
Mathematical effect: retain the note's internal infeasibility boundary; do not import later architecture.
Resolution: current user explicitly selected note + v1.1 and September 1 baseline.
Locked architecture changed by resolution? NO relative to current authorized specification.
Approval required? Scope decision already received; phase results still require approval.
Status: scope resolved; dependent files repaired only in their current approved scope.

## REV-002 — 既有后续阶段需复核
Phase: 2--18
Object: inherited modules, candidates, manuscript, source evidence.
Issue: historical PASS records apply to earlier specifications, not automatically to this revision.
Economic/mathematical effect: no current-spec final claim before revalidation.
Preferred resolution: retain existing derivations, audit each dependency in sequence, repair only affected content.
Locked architecture change? NO.
Approval required? YES at each phase gate.
Status: scheduled; not an active mathematical P0 finding. See affected_file_inventory.csv.

## REV-P1-001 — 历史实证来源需在最终引用前复核
Phase: 16/18 empirical boundary checkpoint
Object: Shi Gu page/table evidence.
Issue: the historical evidence ledger is preserved; no new empirical verification is claimed in this Phase 1 revision.
Resolution: recheck the preserved paper version and its page/table references before final integration.
Locked architecture change? NO.
Approval required? No for evidence verification; yes if an architecture conflict is found.
Status: P1, non-blocking for Phase 1; blocks empirical claims at the relevant later gate if unresolved.
''')
print('Traceability rows:',len(rows),'Affected occurrences:',len(hits),'Protected files:',len(protected))
