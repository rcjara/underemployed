set more off

do do_files/fns

*cd "downloads"
*do usa_00015
*cd ..
*
*save "dta/acs_2011_raw", replace
*
*do do_files/create_inflation_adjustment_table 2011
*
*use "dta/acs_2011_raw", clear
*do do_files/basic_recode
*save "dta/acs_2011_basic_recode", replace
*
*use "dta/acs_2011_basic_recode" if sex == 1, clear
*save "dta/acs_2011_males_recoded", replace
*do do_files/occupation_ed_levels
*save "dta/occ_ed_levels_males_2011", replace
*
*use "dta/occ_ed_levels_males_2011", clear
*do do_files/occupation_level_flags
*save "dta/occ_ed_flags_males_2011", replace

do do_files/flag_cond_test
*
do do_files/generate_basic_table acs_2011_males_recoded occ_ed_flags_males_2011 males_underemployed_2011

