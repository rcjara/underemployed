local case_file `1'
local flag_file `2'
local dest_file `3'

**********************
* combine with flags *
**********************
use "dta/`case_file'", clear
keep occ wgt earnings educ6
joinby occ using "dta/`flag_file'", unmatched(both)
assert _merge == 3
drop _merge

************************
* generate status vars *
************************
tempfile accumulator

*economy totals
preserve

collapse (rawsum) pop=wgt (median) earnings [pw=wgt], by(educ6)

gen qualified = 0
reshape wide pop earnings, i(qualified) j(educ6)

gen order = 0
gen status = "Economy Total"

order order status qualified pop* earnings*

save `accumulator', replace

restore

*ba status
preserve

gen_status_var ba_lf_status ba_flag
reshape_by_educ6 1 ba_lf_status
append using `accumulator'
save `accumulator', replace

restore

*grad status
preserve

gen grad_lf_status = 1
replace grad_lf_status = 3 if grad_flag1

reshape_by_educ6 2 grad_lf_status
append using `accumulator'
save `accumulator', replace

restore

*some college status
preserve

gen_status_var some_lf_status some_flag
reshape_by_educ6 3 some_lf_status
append using `accumulator'
save `accumulator', replace

restore

*high school status
preserve

gen_status_var hs_lf_status hs_flag
reshape_by_educ6 4 hs_lf_status
append using `accumulator'
save `accumulator', replace

restore

*AA status

gen aa_lf_status = 1
replace aa_lf_status = 3 if some_flag1 & educ6 == 4
replace aa_lf_status = 2 if some_flag2 & educ6 == 4

reshape_by_educ6 5 aa_lf_status
append using `accumulator'

******************
* export results *
******************
sort order

label var pop1 "Less than HS"
label var pop2 "HS"
label var pop3 "Some Collage (No AA)"
label var pop4 "AA"
label var pop5 "B.A/B.S."
label var pop6 "Graduate Degree"

label var earnings1 "Less than HS"
label var earnings2 "HS"
label var earnings3 "Some Collage (No AA)"
label var earnings4 "AA"
label var earnings5 "B.A/B.S."
label var earnings6 "Graduate Degree"

capture label drop qualified_lbl
label define qualified_lbl ///
  0 "" ///
  1 "Overqualified" ///
  2 "Underqualified" ///
  3 "Rightly Qualified"


label val qualified qualified_lbl

format pop* %12.0f
format earnings* %12.0f
outsheet using "predeliverables/`dest_file'.csv", comma replace
