/*
  Skeleton Stata script for building pre/post transition matrices for the
  MAH organizational-restructuring project.

  Expected input dataset:
    - one observation per firm-year
    - variables:
        firm_id
        year
        type4

  Recommended coding:
    1 = rd
    2 = prod
    3 = mix
    4 = transition

  This is a template only. Replace paths and variable names as needed.
*/

clear all
set more off

local data_in  "firm_type_panel.dta"
local out_dir  "research_notes"

local pre_start   2011
local pre_end     2014
local post_start  2016
local post_end    2022

use "`data_in'", clear

sort firm_id year
xtset firm_id year
isid firm_id year

gen next_year = F.year
gen next_type = F.type4
gen to_type = next_type
replace to_type = 5 if missing(next_type) & year < `post_end'

label define type5 1 "rd" 2 "prod" 3 "mix" 4 "transition" 5 "exit"
label values type4 type5
label values to_type type5

capture program drop make_transition_table
program define make_transition_table
    syntax, START(integer) END(integer) OUTFILE(string)

    preserve
    keep if inrange(year, `start', `end')
    keep if !missing(type4)
    keep if !missing(to_type)

    contract type4 to_type, freq(count)
    bysort type4: egen total_from = total(count)
    gen share = count / total_from

    tempfile longdata
    save `longdata'

    use `longdata', clear
    keep type4 to_type count
    reshape wide count, i(type4) j(to_type)
    rename type4 from_type
    export delimited using "`outfile'", replace

    use `longdata', clear
    keep type4 to_type share
    reshape wide share, i(type4) j(to_type)
    rename type4 from_type
    local sharefile = subinstr("`outfile'", "_counts.csv", "_shares.csv", .)
    export delimited using "`sharefile'", replace
    restore
end

make_transition_table, start(`pre_start') end(`pre_end') ///
    outfile("`out_dir'/transition_matrix_pre_policy_counts.csv")

make_transition_table, start(`post_start') end(`post_end') ///
    outfile("`out_dir'/transition_matrix_post_policy_counts.csv")

bysort firm_id (year): gen first_year = year[1]
gen entry_obs = year == first_year

capture program drop make_entry_table
program define make_entry_table
    syntax, START(integer) END(integer) OUTFILE(string)

    preserve
    keep if entry_obs == 1
    keep if inrange(year, `start', `end')
    contract type4, freq(count)
    egen total = total(count)
    gen share = count / total
    export delimited using "`outfile'", replace
    restore
end

make_entry_table, start(`pre_start') end(`pre_end') ///
    outfile("`out_dir'/entry_distribution_pre_policy.csv")

make_entry_table, start(`post_start') end(`post_end') ///
    outfile("`out_dir'/entry_distribution_post_policy.csv")

display "Transition matrix templates exported."
