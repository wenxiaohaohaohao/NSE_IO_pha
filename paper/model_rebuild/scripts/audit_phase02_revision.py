"""Current Phase 2 gate checks. Never grants approval or changes phase state."""
from pathlib import Path
import csv, hashlib, json, re, subprocess

ROOT = Path(__file__).resolve().parents[3]
SPEC = ROOT / 'paper/model_rebuild/spec/revision_20260907'
REV = ROOT / 'paper/model_rebuild/revision_20260907'
NOTES = ROOT / 'paper/model_notes/revision_20260907'
AUDIT = REV / 'audit'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
checks = []
def check(name, ok, evidence):
    checks.append({'name': name, 'result': 'PASS' if ok else 'FAIL', 'evidence': evidence})

manifest = json.loads((SPEC/'provenance.json').read_text())
check('effective specification hash', sha(SPEC/'MAH_model_rebuild_effective_spec_note_v1.1.md') == manifest['effective_spec_sha256'], manifest['effective_spec_sha256'])
for source in manifest['sources']:
    check('source '+Path(source['source']).name, sha(Path(source['source'])) == source['sha256'], source['sha256'])
    if 'frozen' in source:
        check('frozen '+Path(source['frozen']).name, sha(ROOT/source['frozen']) == source['sha256'], source['sha256'])
for name,digest in manifest['protected_files'].items():
    check('protected '+name, sha(ROOT/name) == digest, digest)
approval = json.loads((SPEC/'approvals/phase01_approval.json').read_text())
check('Phase 1 explicit approval', approval['status']=='APPROVED' and approval['user_message']=='批准本轮 Phase 1 修订', 'current conversation approval')
for name,digest in approval['approved_artifact_hashes'].items():
    if 'traceability' not in name:
        check('approved artifact unchanged '+name, sha(ROOT/name)==digest, digest)
preflight=json.loads((AUDIT/'phase02_preflight.json').read_text())
check('entry commit pushed', preflight['entry_commit']==preflight['remote_tracking_after_successful_push'], preflight['entry_commit'])
check('clean entry tree', preflight['working_tree_before_phase02']=='', 'checked before new formal output')
check('branch', subprocess.check_output(['git','branch','--show-current'],cwd=ROOT).decode().strip()=='codex/mah-model-rebuild', 'isolated requested branch')
check('no later formal output', sorted(p.name for p in REV.glob('*.tex'))==['01_primitives_and_timing.tex','02_demand_profit_derivation.tex'], 'only approved Phase 1 and current Phase 2')

one=(REV/'01_primitives_and_timing.tex').read_text()
two=(REV/'02_demand_profit_derivation.tex').read_text()
labels=re.findall(r'\\label\{([^}]+)\}',one+'\n'+two)
refs=re.findall(r'\\(?:eqref|ref)\{([^}]+)\}',one+'\n'+two)
check('unique labels',len(labels)==len(set(labels)),str(len(labels)))
check('references resolve',set(refs)<=set(labels),str(sorted(set(refs)-set(labels))))
check('no active old model',not re.search(r'\\eta\b|\\Gamma\b|logit|inclusive value|R_i\^\{event\}|\\bar\s*R',one+'\n'+two,re.I),'formal scope only; exclusion prose in notes not scanned as a mechanism')
check('no new phase mechanisms',not re.search(r'\\begin\{proposition\}|\\max_\{x|\\Psi|D_m\s*=|S_m\s*=',two),'no route choice, advancement or CMO derivation')
check('A defined before demand',two.index('Let \\(A>0')<two.index('y(p;q)=Aq'), 'scale and elasticity defined before use')
check('pricing domain',r'\max_{p\geq c}' in two,'note Phase 2 domain retained')
check('PV domain',r'\varphi\in[0,1)' in two and r'\beta\in(0,1)' in two,'endpoint 1 used only as a limit')
check('period index defined',two.index('t=0,1,')<two.index(r'\sum_{t=0}'),'t is an index, not a new state')
check('SOC and global maximum', 'eq:p02-price-soc' in two and 'unique global maximum' in two and 'positive below' in two,'manual proof separately recorded')
check('conditional PV boundary','not the downstream realization probability' in two and 'gross operating present value' in two,'realization and separately incurred costs excluded')
check('unit normalization','normalized length one' in two and r'\mathsf C^{\varepsilon}\mathsf Y^{1-\varepsilon}' in two,'period cash flows and demand-scale dimensions')
check('q boundary',r'q\downarrow0' in two,'holding c and other parameters fixed')
check('cost boundaries',r'c\to\infty' in two and r'c\downarrow0' in two,'zero cost is outside the maintained domain')
check('survival boundaries',r'\varphi=0' in two and r'\varphi\uparrow1' in two,'no domain extension')
check('elasticity boundary',r'\varepsilon=1' in two and r'0<\varepsilon<1' in two,'failure of finite interior optimum outside maintained domain')

registry=(NOTES/'01_symbols_and_objects.md').read_text()
registry=registry.split('## 3. Active object registry through Phase 2')[1].split('## 4.')[0]
object_rows=[l for l in registry.splitlines() if l.startswith('| $') or l.startswith('| observed ')]
categories={'primitive parameter','exogenous firm characteristic','exogenous project characteristic','control','endogenous firm-level object','endogenous route-level object','equilibrium price','aggregate/distributional primitive','derived observed outcome'}
check('38 unique-category objects',len(object_rows)==38 and all(l.split('|')[2].strip() in categories for l in object_rows),'Phase 1 28 + Phase 2 10 rows')
dependency=(NOTES/'02_equation_dependency_map.md').read_text()
p2labels=re.findall(r'\\label\{(eq:p02-[^}]+)\}',two)
check('all equation dependencies registered',len(p2labels)==9 and all(x in dependency for x in p2labels),'9 pricing/profit/PV equation labels')
check('dependency pricing domain',r'\max_{p\geq c}' in dependency and r'\max_{p>0}' not in dependency,'same feasible set as the formal module')
assumptions=(NOTES/'03_assumptions_and_scope.md').read_text()
check('assumption domains agree',r'\varphi\in[0,1)' in assumptions and r'\varphi\in[0,1]' not in assumptions,'original note domain')
for label in ['A-P02-DEMAND-01','A-P02-PRICE-01','A-P02-PV-01','A-P02-ACCOUNT-01','A-P02-POLICY-01']:
    check('assumption '+label,label in assumptions,'scope and use matrix')
rows=list(csv.DictReader((SPEC/'instruction_traceability_matrix.csv').open()))
ids=[row['requirement_id'] for row in rows]
check('traceability unique',len(ids)==len(set(ids)),str(len(rows)))
check('Phase 2 traceability',all(f'P02-{x}' in ids for x in ['D01','D02','D03','D04','G01','G02','G03','G04','G05']),'atomic deliverables and gates')
check('Phase 2 approval pending',all(row['approval_status']=='No' and row['current_status']!='APPROVED' for row in rows if row['requirement_id'].startswith('P02-')),'no self approval')
check('later phases not started',all(row['current_status']=='NOT STARTED' for row in rows if re.match(r'P(?:0[3-9]|1[0-8])-',row['requirement_id'])),'no advance beyond Phase 2')
numeric=json.loads((AUDIT/'phase02_algebra_results.json').read_text())
check('independent numeric verification',numeric['fail_count']==0 and numeric['parameter_cases']==60,f"{numeric['pass_count']} checks passed")
log=(AUDIT/'phase02_compile_log.txt').read_text()
check('actual compile', (AUDIT/'phase02_revision_review.pdf').exists() and 'Output written on' in log,'Tectonic final log')
check('no compile or reference warnings',not re.search(r'Overfull|Underfull|undefined|LaTeX Warning|^!',log,re.M),'final LaTeX log')
for file in ['phase02_independent_derivation.md','phase02_redline_audit.md','phase02_visual_audit.md']:
    check('manual evidence '+file,(AUDIT/file).exists(),file)
result={'scope':'current note+v1.1 Phase 2, with approved Phase 1 protected','checks':checks,'pass_count':sum(x['result']=='PASS' for x in checks),'fail_count':sum(x['result']=='FAIL' for x in checks)}
(AUDIT/'phase02_static_audit_results.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['scope','pass_count','fail_count']}))
for x in checks:
    if x['result']=='FAIL':print(x)
raise SystemExit(bool(result['fail_count']))
