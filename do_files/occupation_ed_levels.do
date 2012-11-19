gen join_id = 1

***************************
* economy median earnings *
***************************
preserve

tempfile economy_earnings
collapse (median) earnings [pw=wgt]
rename earnings econ_earnings
gen join_id = 1
save `economy_earnings'

restore

*******************************************************
* create education proportions for the entire economy *
*******************************************************
preserve

tempfile economy_education
collapse (rawsum) pop=wgt (median) earnings [pw=wgt], by(educ5)

gen join_id = 1
rename earnings econ_ed_earnings
rename pop      econ_ed_pop

reshape wide econ_ed_pop econ_ed_earnings, i(join_id) j(educ5)

make_proportion econ_ed_pop*

save `economy_education'

restore

**************************************************
* create education proportions for specific occs *
**************************************************

collapse (rawsum) pop=wgt (median) earnings [pw=wgt], by(occ educ5)

rename earnings occ_ed_earnings
rename pop      occ_ed_pop

reshape wide occ_ed_pop occ_ed_earnings, i(occ) j(educ5)

make_proportion occ_ed_pop*

gen join_id = 1

joinby join_id using `economy_earnings', unmatched(both)
assert _merge == 3
drop _merge

joinby join_id using `economy_education', unmatched(both)
assert _merge == 3
drop _merge
