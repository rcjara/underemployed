* You must have run create_inflation_adjustment_table first
* You must have p_year (the previous year, i.e. the year the income came from) defined in order for this table to work.
* Vars to adjust after joining with the adjustment are optional.

*make sure variable adjust does not already exist
gen adjust = .
drop adjust

joinby p_year using "dta/inflation_adjustment", unmatched(master)
assert _merge == 3
drop _merge

foreach var of local 1 {
  replace `var' = `var' * adjust
}


