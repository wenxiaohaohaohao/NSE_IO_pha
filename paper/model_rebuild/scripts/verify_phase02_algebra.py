"""Independent dimensionless and numerical checks of the Phase-2 kernel."""
from pathlib import Path
import itertools,json,math
ROOT=Path(__file__).resolve().parents[3]
AUDIT=ROOT/'paper/model_rebuild/revision_20260907/audit'
checks=[]
def test(name,ok,evidence):checks.append(dict(name=name,result='PASS' if ok else 'FAIL',evidence=evidence))
max_foc=0.;max_soc=0.;max_partial=0.;count=0
# Price-normalized objective h(u)=(u-1)u^-e, u=p/c. This derives the
# stationary point without differentiating the manuscript's currency formula.
for scale,q,c,e in itertools.product([.4,3.],[.2,2.],[.05,1.,40.],[1.05,1.5,2.,5.,10.]):
 count+=1
 def f(p):return (p-c)*scale*q*p**(-e)
 u=e/(e-1);p=c*u;profit=f(p)
 derived=scale*q*((e-1)**(e-1))/(e**e)*c**(1-e)
 test(f'{count}: profit substitution',math.isclose(profit,derived,rel_tol=2e-12),'objective evaluated at normalized stationary point')
 h=p*1e-4
 central=(f(p+h)-f(p-h))/(2*h)
 central_half=(f(p+h/2)-f(p-h/2))/h
 richardson=(4*central_half-central)/3
 max_foc=max(max_foc,abs(richardson)*p/profit)
 soc=(f(p+h)-2*f(p)+f(p-h))/(h*h)
 # Independent h'' at u*=e/(e-1), mapped back by du/dp=1/c.
 soc_u=-(e-1)*u**(-e-1)
 soc_alt=scale*q*c**(-e-1)*soc_u
 max_soc=max(max_soc,abs(soc/soc_alt-1))
 test(f'{count}: derivative sign crossing',all((1-e+e*c/z)>0 for z in [c,(c+p)/2]) and all((1-e+e*c/z)<0 for z in [p*1.01,p*10]),'profit derivative divided by positive scale*q*p^-e')
 test(f'{count}: feasible global candidate',p>c and all(f(max(c,p*k))<=profit*(1+1e-12) for k in [.1,.5,.9,1.,1.1,2.,10.,1000.]),'boundary and broad price grid; analytic global proof separately recorded')
 # Numerical partial derivative of optimized objective, solving price again.
 def opt(qq,cc):
  pp=cc*e/(e-1)
  return (pp-cc)*scale*qq*pp**(-e)
 dq=q*1e-5;dc=c*1e-5
 qdiff=(opt(q+dq,c)-opt(q-dq,c))/(2*dq)
 cdiff=(opt(q,c+dc)-opt(q,c-dc))/(2*dc)
 max_partial=max(max_partial,abs(qdiff/(profit/q)-1),abs(cdiff/((1-e)*profit/c)-1))
 # Currency and physical-output unit changes are independent accounting tests.
 alpha=2.7;delta=3.1
 newcurrency=(alpha*p-alpha*c)*(scale*alpha**e)*q*(alpha*p)**(-e)
 newoutput=(p/delta-c/delta)*(scale*delta**(1-e))*q*(p/delta)**(-e)
 test(f'{count}: unit invariance',math.isclose(newcurrency,alpha*profit,rel_tol=1e-12) and math.isclose(newoutput,profit,rel_tol=1e-12),'currency conversion scales profit; physical unit conversion leaves money unchanged')
for beta,phi in itertools.product([.2,.9,.99],[0.,.2,.8,.999]):
 ratio=beta*phi
 finite=sum(ratio**t for t in range(2000))
 exact=1/(1-ratio)
 tail=ratio**2000/(1-ratio)
 test(f'PV beta={beta},phi={phi}',math.isclose(finite+tail,exact,rel_tol=2e-12),'finite geometric cash-flow sum plus exact residual tail')
test('FOC finite-difference residual',max_foc<3e-6,{'max_scaled_residual':max_foc})
test('SOC independent normalized derivative',max_soc<2e-5,{'max_relative_error':max_soc})
test('Profit partial derivatives',max_partial<1e-6,{'max_relative_error':max_partial})
result={'scope':'conditional pricing and operating PV only; analytic proof still required','parameter_cases':count,'checks':checks,'pass_count':sum(x['result']=='PASS' for x in checks),'fail_count':sum(x['result']=='FAIL' for x in checks)}
(AUDIT/'phase02_algebra_results.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['parameter_cases','pass_count','fail_count']}))
for item in checks:
 if item['result']=='FAIL':print(item)
raise SystemExit(bool(result['fail_count']))
