from pathlib import Path
import sys,json,hashlib,re,csv,shutil
phase=int(sys.argv[1]); module=sys.argv[2]; pages=int(sys.argv[3]);pfx=f'phase{phase:02d}'
v=Path('paper/model_rebuild/revision_20260907');n=Path('paper/model_notes/revision_20260907');s=Path('paper/model_rebuild/spec/revision_20260907');a=v/'audit';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();t=(v/module).read_text();alltex='\n'.join(f.read_text() for f in v.glob('*.tex') if not f.name.startswith(('12_','13_','14_')));labels=re.findall(r'\\label\{([^}]+)\}',alltex);refs=re.findall(r'\\(?:eqref|ref)\{([^}]+)\}',alltex);p=json.loads((s/'provenance.json').read_text());checks={f'protected:{f}':sha(Path(f))==h for f,h in p['protected_files'].items()};checks.update(unique_labels=len(labels)==len(set(labels)),resolved_refs=set(refs)<=set(labels),spec_hash=sha(s/'MAH_model_rebuild_effective_spec_note_v1.1.md')==p['effective_spec_sha256'])
log=(a/f'{pfx}_revision_review.log').read_text();checks['compile_clean']=not re.search(r'(^!|undefined|Overfull)',log,re.M|re.I);assert all(checks.values()),checks
report=a/f'{pfx}_gate_report.md';assert report.exists() and 'PASS' in report.read_text();(a/f'{pfx}_static_audit_results.json').write_text(json.dumps(checks,indent=2));(a/f'{pfx}_compile_log.txt').write_text(log)
for i in range(1,pages+1):shutil.copyfile(f'/tmp/mah_{pfx}-{i}.png',a/f'{pfx}_page-{i}.png')
f=n/'00_model_closure_status.md';f.write_text(f.read_text().replace(f'| {phase} | APPROVED under historical specification | IN PROGRESS | No |',f'| {phase} | APPROVED under historical specification | APPROVED | Yes — REV-EXEC-001 after zero-P0 gate |'))
f=s/'instruction_traceability_matrix.csv';rows=list(csv.DictReader(f.open()));fields=rows[0].keys()
for row in rows:
 if row['requirement_id'].startswith(f'P{phase:02d}-'):row.update(current_status='PASS',evidence=str(report),approval_status='APPROVED — REV-EXEC-001')
with f.open('w',newline='') as h:w=csv.DictWriter(h,fieldnames=fields);w.writeheader();w.writerows(rows)
(s/f'approvals/{pfx}_approval.json').write_text(json.dumps({'phase':phase,'status':'APPROVED','authority':'REV-EXEC-001','gate':str(report),'deliverable_sha256':sha(v/module)},indent=2))
print(pfx, len(checks), 'automated checks PASS; semantic gate recorded separately')
