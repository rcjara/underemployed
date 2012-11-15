use "dta/cps_2010-2012_basic_recode" if sex == 1, clear
*keep if age >= 30 & age <= 59
*keep if hrs_worked > 1750

joinby occ using  "dta/occ_ed_flags_males_2010-2012", unmatched(master)
*assert _merge == 3
*drop _merge
*
*gen bf1_cond2a = !bf1_cond1 & bf1_cond2
*table bf1_cond1 [pw=wgt]  if educ6 == 5, row f(%12.0f)
*table bf1_cond2a [pw=wgt] if educ6 == 5, row f(%12.0f)
*table ba_flag1 [pw=wgt] if educ6 == 5, row f(%12.0f)
*table ba_flag2 [pw=wgt] if educ6 == 5, row f(%12.0f)
*
