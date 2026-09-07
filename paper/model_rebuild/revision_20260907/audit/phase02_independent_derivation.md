# Phase 2 独立推导复核

范围：原 note §7 与本轮 note+v1.1；以 September 1 正式模块为被审对象，不引用历史 PASS 作为本轮证明。以下 u、h 仅为复核用的无量纲代换，不是新增模型状态。

## 1. 与正式推导不同的定价复核

固定 A,q,c>0 和 epsilon>1，令 u=p/c≥1。目标利润为

\[
(p-c)Aq p^{-\varepsilon}
 =Aq c^{1-\varepsilon}h(u),\qquad h(u)=(u-1)u^{-\varepsilon}.
\]

乘子严格为正，因此只需最大化 h：

\[
h'(u)=u^{-\varepsilon-1}[\varepsilon-(\varepsilon-1)u].
\]

u*=epsilon/(epsilon-1)>1 是唯一驻点。h'(1)>0，u<u* 时正，u>u* 时负；h(1)=0 且 h(u)→0 当 u→∞，故为唯一全局最大值。这里不假定目标函数在整个无界域全局凹。

在驻点处

\[
h''(u^*)=-(\varepsilon-1)(u^*)^{-\varepsilon-1}<0.
\]

乘回 Aq c^(1-epsilon) 并用 du/dp=1/c，得到

\[
\frac{d^2[(p-c)y]}{dp^2}\bigg|_{p^*}
=-Aq(\varepsilon-1)(p^*)^{-\varepsilon-1}<0.
\]

这与正式模块 SOC 一致。直接展开目标函数 Aq[p^(1-epsilon)-c p^(-epsilon)] 再求二阶导，也得到 Aq epsilon p^(-epsilon-2)[(epsilon-1)p-(epsilon+1)c]，在 p* 代入后同值。

## 2. 利润与两项导数

在 u* 处 h(u*)=(epsilon-1)^(epsilon-1)/epsilon^epsilon，从而

\[
\pi(q,c)=Aq\frac{(\varepsilon-1)^{\varepsilon-1}}{\varepsilon^{\varepsilon}}c^{1-\varepsilon}.
\]

保持其他参数不变，对数微分给出 pi_q=pi/q>0 与 pi_c=(1-epsilon)pi/c<0。另用 envelope theorem 在 p* 固定时对目标求 c 导数，得到 -Aq(p*)^(-epsilon)，与 (1-epsilon)pi/c 完全相同。此处 q、c 为连续条件参数，不对二元 M 求导，也不把产品价 p 当作 CMO 价 p_m。

## 3. 现值与时点

t=0 是已商业化后的第一笔利润；每个经营期间长度归一为一，pi 是这一期间的货币现金流。beta∈(0,1)，phi∈[0,1)，持续经营 t 期的条件概率为 phi^t，故

\[
R=\pi\sum_{t=0}^{\infty}(\beta\varphi)^t=\frac{\pi}{1-\beta\varphi}.
\]

几何级数收敛；R_q=R/q、R_c=(1-epsilon)R/c。s(q) 是发生在该经营流之前的下游实现概率，不应重复乘入条件经营现值。本阶段没有求 route values 或额外的时点折现。

## 4. 维度与成本核算

- p,c：货币/物理产出；q 无量纲；一个经营期内 A 的量纲 C^epsilon Y^(1-epsilon)。因此 y=Aq p^(-epsilon) 是该期物理产出，(p-c)y 是该期货币额。
- 折现和存续概率无量纲；几何和把各期货币现金流转换成时点 0 的货币现值，不混用连续流量与离散金额。
- 货币单位缩放 alpha：p,c 乘 alpha，A 乘 alpha^epsilon，pi 与 R 乘 alpha。物理产出单位缩放 delta：p,c 除 delta，A 乘 delta^(1-epsilon)，货币利润不变。数值验证同时检查这两个变换。
- c 仅在 p-c 内扣除一次；R 不含路线 setup cost、tau_E 或单独采购的 capacity payment。具体路线核算在 Phases 3/4 复核，不能重复在 c 内外扣同一成本。
- 旧 reduced-form return 不是本阶段的输入。唯一活动链为 y→最优价→pi→R；旧对象的位置级 crosswalk 保留到 Phase 12。

## 5. 条件与边界

| 检查 | 条件/推导 | 结果 |
|---|---|---|
| 下界 p=c | 利润 0；一阶导 Aq c^(-epsilon)>0 | PASS |
| p→∞ | epsilon>1，(p-c)p^(-epsilon)→0 | PASS |
| q↓0 | 固定正 c，pi 与 R 线性趋零；q=0 的唯一性不在正域结论内 | PASS |
| c→∞ | 1-epsilon<0，所以 pi,R→0 | PASS |
| c↓0 | 1-epsilon<0，所以 pi,R→∞；保持 c>0 的正式域 | PASS |
| phi=0 | 几何和只含首期，R=pi | PASS |
| phi↑1 | 极限为 pi/(1-beta)，beta<1；phi=1 不纳入正式域 | PASS |
| epsilon=1 | 利润 Aq(1-c/p) 严格递增趋向 Aq，无有限最大点 | PASS |
| 0<epsilon<1 | 主导项 Aq p^(1-epsilon)→∞ | PASS |

涉及 k_i、route E、M、entrusted advantage、CMO supply 和 nu 的强制边界尚不属于 Phase 2，保持分配给对应后续阶段，不记录为已证明。

## 6. 数值交叉核验与精度

verify_phase02_algebra.py 在 60 组 (A,q,c,epsilon) 下复核代入、单峰符号、可行最优点、单位缩放，并检查 12 组 beta/phi 的几何和。最终 255 PASS / 0 FAIL。

首次双边差分在高弹性参数下的无量纲驻点残差约 3.3e-6，略高于 3e-6 阈值；这是 O(h²) 截断误差，不是解析 FOC 非零。保留首次结果 phase02_numeric_trial.json，使用同一阈值及步长 h、h/2 的 Richardson 外推消去首项截断误差，再与解析 FOC 比较。没有放宽阈值或修改模型公式。数值格点不替代上述解析全局证明。

## 7. 经济含义与范围

本结果描述商业化条件下的经营利润机会。残余需求弹性限制产品加价，高边际制造成本提高最优产品价格并缩小项目经营利润。后续组织选择才会比较这一利润机会与不同路线的成本。本阶段不推出 MAH 直接影响需求、生产率、成功概率、项目开发强度或最终产品数，也不推出福利或 novelty 排序。

结论：Phase 2 现有核心推导可保留；本轮主要补清首次定义、离散经营期单位、参数边界与经济解释。当前无核心推导或架构 P0。
