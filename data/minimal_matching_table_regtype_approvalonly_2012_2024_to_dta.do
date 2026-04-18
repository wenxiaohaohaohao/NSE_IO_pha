version 18.0

clear all
set more off

* ------------------------------------------------------------
* Excel -> Stata dta
* Source: data/minimal_matching_table_regtype_approvalonly_2012_2024.xlsx
* Sheet : minimal_match
* Output: data/minimal_matching_table_regtype_approvalonly_2012_2024.dta
* ------------------------------------------------------------

global ROOT "D:/working_paper/DANNI"
global XLSX "$ROOT/data/minimal_matching_table_regtype_approvalonly_2012_2024.xlsx"
global DTA  "$ROOT/data/minimal_matching_table_regtype_approvalonly_2012_2024.dta"

capture log close
log using "$ROOT/data/minimal_matching_table_regtype_approvalonly_2012_2024_import.log", replace text

display as text "Importing Excel file: $XLSX"
import excel using "$XLSX", sheet("minimal_match") firstrow clear

* Translation dictionary:
* Excel column order  -> Stata variable name -> Stata variable label
* 1  序号            -> seq               -> 序号
* 2  受理号          -> acceptance_no     -> 受理号
* 3  申报类型        -> application_type  -> 申报类型
* 4  注册类型        -> registration_type -> 注册类型
* 5  MAH企业         -> mah_company       -> MAH企业
* 6  药品生产企业    -> manufacturer      -> 药品生产企业
* 7  批准文号        -> approval_no       -> 批准文号
* 8  审评侧企业名    -> cde_company       -> 审评侧企业名
* 9  批文侧上市许可持有人 -> approval_holder -> 批文侧上市许可持有人
* 10 CDE企业名称     -> cde_company_name  -> CDE企业名称
* 11 NMPA企业名称    -> nmpa_company_name -> NMPA企业名称

* The original Excel headers contain Chinese text and spaces.
* Rename the imported variables directly.
rename 序号 seq
rename 受理号 acceptance_no
rename 申报类型 application_type
rename 注册类型 registration_type
rename MAH企业 mah_company
rename 药品生产企业 manufacturer
rename 批准文号 approval_no
rename 审评侧企业名 cde_company
rename 批文侧上市许可持有人 approval_holder
rename CDE企业名称 cde_company_name
rename NMPA企业名称 nmpa_company_name

label variable seq               "序号"
label variable acceptance_no     "受理号"
label variable application_type  "申报类型"
label variable registration_type "注册类型"
label variable mah_company       "MAH企业"
label variable manufacturer      "药品生产企业"
label variable approval_no       "批准文号"
label variable cde_company       "审评侧企业名"
label variable approval_holder   "批文侧上市许可持有人"
label variable cde_company_name  "CDE企业名称"
label variable nmpa_company_name "NMPA企业名称"

* Clean string variables: keep internal spaces, remove leading/trailing spaces only.
ds, has(type string)
foreach v of varlist `r(varlist)' {
    replace `v' = strtrim(`v')
}

* Ensure the sequence column is numeric.
capture destring seq, replace ignore(",")

order seq acceptance_no application_type registration_type mah_company manufacturer approval_no cde_company approval_holder cde_company_name nmpa_company_name

label data "Minimal matching table (reg type, approval only, 2012-2024)"

display as text "Saving Stata dataset: $DTA"
save "$DTA", replace

display as text "Verifying saved dataset"
use "$DTA", clear
count
describe

log close