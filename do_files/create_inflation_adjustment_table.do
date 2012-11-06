local target_year `1'

insheet using "csv/cpi-u-rs.csv", names clear
gen t_curr = cpiurs if p_year == `target_year'
egen curr = max(t_curr)
gen adjust = curr / cpiurs
keep p_year adjust
save "dta/inflation_adjustment", replace
