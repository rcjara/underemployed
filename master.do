set more off

do do_files/fns

*cd "downloads"
*do cps_00041
*cd ..
*
*save "dta/cps_2010-2012_raw", replace
*
*do do_files/create_inflation_adjustment_table 2011
*
*use "dta/cps_2010-2012_raw", replace
*do do_files/basic_recode
*save "dta/cps_2010-2012_basic_recode", replace

use "dta/cps_2010-2012_basic_recode" if sex == 1, clear
do do_files/occupation_ed_levels
save "dta/occ_ed_levels_males_2010-2012", replace

use "dta/occ_ed_levels_males_2010-2012", clear
do do_files/occupation_level_flags
save "dta/occ_ed_flags_males_2010-2012", replace

