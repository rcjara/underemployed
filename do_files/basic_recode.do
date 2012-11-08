*Keep only the employed ("at work", and "has job, not at work last week")
*Don't keep armed forces
keep if empstat == 10 | empstat == 12

*************
* education *
*************
recode educ (0/72 = 1)(73 = 2)(81 = 3)(91/92 = 4)(111 = 5)(120/125 = 6), gen(educ6)
assert educ6 >= 1 & educ6 <= 6

capture label drop educ6_lbl
label define educ6_lbl ///
  1 "Less than HS"   ///
  2 "HS"            ///
  3 "Some College" ///
  4 "Associate's Degree" ///
  5 "B.A./B.S."   ///
  6 "Advanced Degree"
label values educ6 educ6_lbl

recode educ (0/72 = 1)(73 = 2)(80/100 = 3)(110/111 = 4)(120/125 = 5), gen(educ5)
assert educ5 >= 1 & educ5 <= 5

capture label drop educ5_lbl
label define educ5_lbl ///
  1 "Less than HS"   ///
  2 "HS"            ///
  3 "Some College" ///
  4 "B.A./B.S."   ///
  5 "Advanced Degree"
label values educ5 educ5_lbl

mvdecode incwage, mv(999998/999999 = .)
rename incwage earnings

gen p_year = year - 1
label var p_year "Previous Year (the year for which earnings refer)"

do "do_files/adjust_for_inflation" earnings

recode race (100 = 1)(200 = 2)(else = 4), gen(race4)
replace race4 = 3 if hispan

capture label drop race4_lbl
label define race4_lbl ///
  1 "Non-Hispanic White" ///
  2 "Non-Hispanic Black" ///
  3 "Hispanic" ///
  4 "Other / More than one race"
label values race4 race4_lbl

gen hrs_worked = uhrswork * wkswork1
assert !missing(hrs_worked)
gen hrs_worked2 = cond(hrs_worked > 3500, 3500, hrs_worked)

rename wtsupp wgt
keep year wgt pernum age sex race4 educ5 educ6 earnings occ ind classwkr hrs_worked hrs_worked2

