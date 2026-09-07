"""Read-only scope-aware checks; does not grant approval or alter phase state."""
from pathlib import Path
import csv
import hashlib
import json
import re
import subprocess

ROOT = Path(__file__).resolve().parents[3]
SPEC = ROOT / 'paper/model_rebuild/spec/revision_20260907'
REV = ROOT / 'paper/model_rebuild/revision_20260907'
NOTES = ROOT / 'paper/model_notes/revision_20260907'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
checks = []

def check(name, passed, evidence):
    checks.append(dict(check=name, result='PASS' if passed else 'FAIL', evidence=evidence))

manifest = json.loads((SPEC / 'provenance.json').read_text())
for source in manifest['sources']:
    file = Path(source['source'])
    check('SOURCE ' + file.name, sha(file) == source['sha256'], source['sha256'])
    if 'frozen' in source:
        check('FROZEN ' + file.name, sha(ROOT / source['frozen']) == sha(file), source['frozen'])
for name, digest in manifest['protected_files'].items():
    check('PROTECTED ' + name, sha(ROOT / name) == digest, digest)
branch = subprocess.check_output(['git', 'branch', '--show-current'], cwd=ROOT).decode().strip()
check('BRANCH', branch == 'codex/mah-model-rebuild', branch)
check('LOCKED BASE', subprocess.run(['git', 'merge-base', '--is-ancestor', 'cd5b6e4', 'HEAD'], cwd=ROOT).returncode == 0, 'cd5b6e4 remains ancestor; no reset')
effective = SPEC / 'MAH_model_rebuild_effective_spec_note_v1.1.md'
text = effective.read_text()
check('EFFECTIVE HASH', sha(effective) == manifest['effective_spec_sha256'], sha(effective))
redline_block = text.split('# 2. Absolute Red Lines')[1].split('# 3.')[0]
check('28 RED LINES', list(map(int, re.findall(r'^(\d+)\. Do ', redline_block, re.M))) == list(range(1, 29)), 'effective §2')
check('18 FORMAL PHASES', list(map(int, re.findall(r'^# \d+\. Phase (\d+) ', text, re.M))) == list(range(1, 19)), 'formal headings, not historical example row numbers')
for letter in 'ABCDEFGHIJKLMNOPQRSTUVW':
    check('AMENDMENT ' + letter, 'AMD11-' + letter in text, 'construction record; substantive application also manually reviewed')
check('NO V1.2 CONTROL INTERPRETATION', not re.search(r'original-drug innovation investment|broader than pure|not pure clinical', text), 'active effective specification')
check('PREFERRED COST', "C_X'(x_i)" in text and 'C_R' not in text, 'Phase 5 cost and value-gap FOC')
check('INTERNAL INFEASIBILITY RETAINED', 'F_I(m,k_i)=+\\infty' in text and 'k_i<\\underline' in text, 'specification Phase 3 and mandatory QA; mathematical check deferred to Phase 3')
stack = 0
balanced = True
for delimiter in re.findall(r'\\\[|\\\]', text):
    stack += 1 if delimiter == r'\[' else -1
    balanced &= stack in (0, 1)
check('SPEC DISPLAY DELIMITERS', balanced and stack == 0, 'no nested/unclosed display caused by amendment insertions')
rows = list(csv.DictReader((SPEC / 'instruction_traceability_matrix.csv').open()))
ids = [row['requirement_id'] for row in rows]
check('TRACEABILITY UNIQUE', len(ids) == len(set(ids)), f'{len(ids)} rows')
for prefix, count in [('RL-', 28), ('SUCCESS-', 13)]:
    check('TRACEABILITY ' + prefix, all(f'{prefix}{n:02}' in ids for n in range(1, count+1)), str(count))
check('TRACEABILITY PHASES', all(f'P{n:02}-D01' in ids and f'P{n:02}-G01' in ids for n in range(1, 19)), 'deliverables and gates for 18 phases')
approval_file = SPEC / 'approvals/phase01_approval.json'
approval = json.loads(approval_file.read_text()) if approval_file.exists() else {}
check('NO SELF APPROVAL', all(not row['approval_status'].startswith('Yes') or (row['requirement_id'].startswith('P01-') and approval.get('user_message') == '批准本轮 Phase 1 修订') for row in rows), 'Phase 1 Yes requires current explicit approval record; later phases remain unapproved')
module = (REV / '01_primitives_and_timing.tex').read_text()
labels = re.findall(r'\\label\{([^}]+)\}', module)
refs = re.findall(r'\\(?:eqref|ref)\{([^}]+)\}', module)
check('UNIQUE LABELS', len(labels) == len(set(labels)), str(len(labels)))
check('RESOLVED REFERENCES', set(refs) <= set(labels), str(sorted(set(refs)-set(labels))))
check('PHASE SCOPE', [p.name for p in REV.glob('*.tex')] == ['01_primitives_and_timing.tex'], 'no later-phase formal output created')
check('BASELINE TOKENS', not re.search(r'\\eta\b|\\Gamma\b|logit|inclusive value|\\begin\{proposition\}', module, re.I), 'formal Phase 1 module; exclusions in notes are not treated as active mechanisms')
check('CONTROL BOUNDARY', 'project-development / advancement intensity' in module and 'outside this control' in module, 'canonical definition and upstream exclusion')
check('NO V1.2 IN MODULE', not re.search(r'original-drug innovation investment|broader than pure|v1\.2', module), 'Phase 1 formal output')
check('CLASS LABELS DEFINED', 'original/breakthrough-oriented' in module and 'incremental/improved' in module, 'O and Inc classified; no extra control')
check('PRICE BEFORE ROUTE ARGUMENT', module.index('Let \\(p_m\\)') < module.index('r_i^*(q,m;M,p_m)'), 'defined before use')
check('REGIME BEFORE VALUE ARGUMENT', module.index('regime be \\(M') < module.index('Omega_i(M,p_m)'), 'defined before use')
registry = (NOTES / '01_symbols_and_objects.md').read_text()
registry = registry.split('## 3. Active Phase 1 object registry')[1].split('## 4.')[0]
object_rows = [l for l in registry.splitlines() if l.startswith('| $') or l.startswith('| observed ')]
categories = {'primitive parameter','exogenous firm characteristic','exogenous project characteristic','control','endogenous firm-level object','endogenous route-level object','equilibrium price','aggregate/distributional primitive','derived observed outcome'}
check('OBJECT TAXONOMY', len(object_rows) == 28 and all(l.split('|')[2].strip() in categories for l in object_rows), '28 rows; exactly one allowed category each')
check('TIMING', all(f'Stage {n}.' in module for n in range(6)) and 'simultaneous equilibrium' in module, 'stage 5 is consistency, not an unanticipated later shock')
check('NO NOVELTY SIGN CLAIM', 'Nothing in this section implies an increase' in module, 'economic scope statement')
result = dict(scope='note+v1.1 specification and current Phase 1 ONLY', checks=checks, pass_count=sum(x['result']=='PASS' for x in checks), fail_count=sum(x['result']=='FAIL' for x in checks), limitations='Semantic claims require manual audit. Actual LaTeX/visual audit recorded separately. No claim that Phase 2--18 has passed this revision.')
(REV / 'audit/static_audit_results.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps({k:result[k] for k in ('scope','pass_count','fail_count')}))
for x in checks:
    if x['result']=='FAIL': print(x)
raise SystemExit(bool(result['fail_count']))
