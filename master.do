set more off

do do_files/fns

cd "downloads"
do cps_00041
cd ..

save "dta/cps_2010-2012_raw", replace

do do_files/create_inflation_adjustment_table 2011

use "dta/cps_2010-2012_raw", replace
do do_files/basic_recode
save "dta/cps_2010-2012_basic_recode", replace
