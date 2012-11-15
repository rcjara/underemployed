* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                ///
  int     year      1-4      ///
  long    serial    5-9      ///
  byte    numprec   10-11    ///
  float   hwtsupp   12-21    ///
  double  hhincome  22-29    ///
  byte    month     30-31    ///
  byte    pernum    32-33    ///
  float   wtsupp    34-41    ///
  byte    age       42-43    ///
  byte    sex       44-44    ///
  int     race      45-47    ///
  byte    marst     48-48    ///
  long    bpl       49-53    ///
  byte    citizen   54-54    ///
  int     hispan    55-57    ///
  int     educ      58-60    ///
  byte    empstat   61-62    ///
  int     occ       63-66    ///
  int     ind       67-70    ///
  byte    classwkr  71-72    ///
  byte    wkswork1  73-74    ///
  byte    uhrswork  75-76    ///
  byte    pension   77-77    ///
  byte    union     78-78    ///
  double  ftotval   79-88    ///
  double  inctot    89-96    ///
  long    incwage   97-103   ///
  long    incbus    104-110  ///
  long    incfarm   111-117  ///
  long    oincbus   118-123  ///
  using `"cps_00042.dat"'

replace hwtsupp  = hwtsupp  / 10000
replace wtsupp   = wtsupp   / 100

format hwtsupp  %10.4f
format hhincome %8.0f
format wtsupp   %8.2f
format ftotval  %10.0f
format inctot   %8.0f

label var year     `"Survey year"'
label var serial   `"Household serial number"'
label var numprec  `"Number of person records following"'
label var hwtsupp  `"Household weight, Supplement"'
label var hhincome `"Total household income"'
label var month    `"Month"'
label var pernum   `"Person number in sample unit"'
label var wtsupp   `"Supplement Weight"'
label var age      `"Age"'
label var sex      `"Sex"'
label var race     `"Race"'
label var marst    `"Marital status"'
label var bpl      `"Birthplace"'
label var citizen  `"Citizenship status"'
label var hispan   `"Hispanic origin"'
label var educ     `"Educational attainment recode"'
label var empstat  `"Employment status"'
label var occ      `"Occupation"'
label var ind      `"Industry"'
label var classwkr `"Class of worker"'
label var wkswork1 `"Weeks worked last year"'
label var uhrswork `"Usual hours worked per week (last yr)"'
label var pension  `"Pension plan at work"'
label var union    `"Union membership"'
label var ftotval  `"Total family income"'
label var inctot   `"Total personal income"'
label var incwage  `"Wage and salary income"'
label var incbus   `"Non-farm business income"'
label var incfarm  `"Farm income"'
label var oincbus  `"Earnings from other work included business self-employment earnings"'

label define hwtsupp_lbl 0000000000 `"0000000000"'
label values hwtsupp hwtsupp_lbl

label define month_lbl 01 `"January"'
label define month_lbl 02 `"February"', add
label define month_lbl 03 `"March"', add
label define month_lbl 04 `"April"', add
label define month_lbl 05 `"May"', add
label define month_lbl 06 `"June"', add
label define month_lbl 07 `"July"', add
label define month_lbl 08 `"August"', add
label define month_lbl 09 `"September"', add
label define month_lbl 10 `"October"', add
label define month_lbl 11 `"November"', add
label define month_lbl 12 `"December"', add
label values month month_lbl

label define age_lbl 00 `"Under 1 year"'
label define age_lbl 01 `"1"', add
label define age_lbl 02 `"2"', add
label define age_lbl 03 `"3"', add
label define age_lbl 04 `"4"', add
label define age_lbl 05 `"5"', add
label define age_lbl 06 `"6"', add
label define age_lbl 07 `"7"', add
label define age_lbl 08 `"8"', add
label define age_lbl 09 `"9"', add
label define age_lbl 10 `"10"', add
label define age_lbl 11 `"11"', add
label define age_lbl 12 `"12"', add
label define age_lbl 13 `"13"', add
label define age_lbl 14 `"14"', add
label define age_lbl 15 `"15"', add
label define age_lbl 16 `"16"', add
label define age_lbl 17 `"17"', add
label define age_lbl 18 `"18"', add
label define age_lbl 19 `"19"', add
label define age_lbl 20 `"20"', add
label define age_lbl 21 `"21"', add
label define age_lbl 22 `"22"', add
label define age_lbl 23 `"23"', add
label define age_lbl 24 `"24"', add
label define age_lbl 25 `"25"', add
label define age_lbl 26 `"26"', add
label define age_lbl 27 `"27"', add
label define age_lbl 28 `"28"', add
label define age_lbl 29 `"29"', add
label define age_lbl 30 `"30"', add
label define age_lbl 31 `"31"', add
label define age_lbl 32 `"32"', add
label define age_lbl 33 `"33"', add
label define age_lbl 34 `"34"', add
label define age_lbl 35 `"35"', add
label define age_lbl 36 `"36"', add
label define age_lbl 37 `"37"', add
label define age_lbl 38 `"38"', add
label define age_lbl 39 `"39"', add
label define age_lbl 40 `"40"', add
label define age_lbl 41 `"41"', add
label define age_lbl 42 `"42"', add
label define age_lbl 43 `"43"', add
label define age_lbl 44 `"44"', add
label define age_lbl 45 `"45"', add
label define age_lbl 46 `"46"', add
label define age_lbl 47 `"47"', add
label define age_lbl 48 `"48"', add
label define age_lbl 49 `"49"', add
label define age_lbl 50 `"50"', add
label define age_lbl 51 `"51"', add
label define age_lbl 52 `"52"', add
label define age_lbl 53 `"53"', add
label define age_lbl 54 `"54"', add
label define age_lbl 55 `"55"', add
label define age_lbl 56 `"56"', add
label define age_lbl 57 `"57"', add
label define age_lbl 58 `"58"', add
label define age_lbl 59 `"59"', add
label define age_lbl 60 `"60"', add
label define age_lbl 61 `"61"', add
label define age_lbl 62 `"62"', add
label define age_lbl 63 `"63"', add
label define age_lbl 64 `"64"', add
label define age_lbl 65 `"65"', add
label define age_lbl 66 `"66"', add
label define age_lbl 67 `"67"', add
label define age_lbl 68 `"68"', add
label define age_lbl 69 `"69"', add
label define age_lbl 70 `"70"', add
label define age_lbl 71 `"71"', add
label define age_lbl 72 `"72"', add
label define age_lbl 73 `"73"', add
label define age_lbl 74 `"74"', add
label define age_lbl 75 `"75"', add
label define age_lbl 76 `"76"', add
label define age_lbl 77 `"77"', add
label define age_lbl 78 `"78"', add
label define age_lbl 79 `"79"', add
label define age_lbl 80 `"80"', add
label define age_lbl 81 `"81"', add
label define age_lbl 82 `"82"', add
label define age_lbl 83 `"83"', add
label define age_lbl 84 `"84"', add
label define age_lbl 85 `"85"', add
label define age_lbl 86 `"86"', add
label define age_lbl 87 `"87"', add
label define age_lbl 88 `"88"', add
label define age_lbl 89 `"89"', add
label define age_lbl 90 `"90 (90+, 1988-2002)"', add
label define age_lbl 91 `"91"', add
label define age_lbl 92 `"92"', add
label define age_lbl 93 `"93"', add
label define age_lbl 94 `"94"', add
label define age_lbl 95 `"95"', add
label define age_lbl 96 `"96"', add
label define age_lbl 97 `"97"', add
label define age_lbl 98 `"98"', add
label define age_lbl 99 `"99+"', add
label values age age_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label values sex sex_lbl

label define race_lbl 100 `"White"'
label define race_lbl 200 `"Black/Negro"', add
label define race_lbl 300 `"American Indian/Aleut/Eskimo"', add
label define race_lbl 650 `"Asian or Pacific Islander"', add
label define race_lbl 651 `"Asian only"', add
label define race_lbl 652 `"Hawaiian/Pacific Islander only"', add
label define race_lbl 700 `"Other (single) race, n.e.c."', add
label define race_lbl 801 `"White-Black"', add
label define race_lbl 802 `"White-American Indian"', add
label define race_lbl 803 `"White-Asian"', add
label define race_lbl 804 `"White-Hawaiian/Pacific Islander"', add
label define race_lbl 805 `"Black-American Indian"', add
label define race_lbl 806 `"Black-Asian"', add
label define race_lbl 807 `"Black-Hawaiian/Pacific Islander"', add
label define race_lbl 808 `"American Indian-Asian"', add
label define race_lbl 809 `"Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 810 `"White-Black-American Indian"', add
label define race_lbl 811 `"White-Black-Asian"', add
label define race_lbl 812 `"White-American Indian-Asian"', add
label define race_lbl 813 `"White-Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 814 `"White-Black-American Indian-Asian"', add
label define race_lbl 820 `"Two or three races, unspecified"', add
label define race_lbl 830 `"Four or five races, unspecified"', add
label define race_lbl 999 `"NIU"', add
label values race race_lbl

label define marst_lbl 1 `"Married, spouse present"'
label define marst_lbl 2 `"Married, spouse absent"', add
label define marst_lbl 3 `"Separated"', add
label define marst_lbl 4 `"Divorced"', add
label define marst_lbl 5 `"Widowed"', add
label define marst_lbl 6 `"Never married/single"', add
label define marst_lbl 9 `"Unknown"', add
label values marst marst_lbl

label define bpl_lbl 09900 `"United States, n.s."'
label define bpl_lbl 10000 `"American Samoa"', add
label define bpl_lbl 10500 `"Guam"', add
label define bpl_lbl 11000 `"Puerto Rico"', add
label define bpl_lbl 11500 `"U.S. Virgin Islands"', add
label define bpl_lbl 12090 `"U.S. outlying areas, n.s."', add
label define bpl_lbl 15000 `"Canada"', add
label define bpl_lbl 16010 `"Bermuda"', add
label define bpl_lbl 19900 `"North America, n.s."', add
label define bpl_lbl 20000 `"Mexico"', add
label define bpl_lbl 21010 `"Belize/British Honduras"', add
label define bpl_lbl 21020 `"Costa Rica"', add
label define bpl_lbl 21030 `"El Salvador"', add
label define bpl_lbl 21040 `"Guatemala"', add
label define bpl_lbl 21050 `"Honduras"', add
label define bpl_lbl 21060 `"Nicaragua"', add
label define bpl_lbl 21070 `"Panama"', add
label define bpl_lbl 21090 `"Central America, n.s."', add
label define bpl_lbl 25000 `"Cuba"', add
label define bpl_lbl 26010 `"Dominican Republic"', add
label define bpl_lbl 26020 `"Haiti"', add
label define bpl_lbl 26030 `"Jamaica"', add
label define bpl_lbl 26043 `"Bahamas"', add
label define bpl_lbl 26044 `"Barbados"', add
label define bpl_lbl 26054 `"Dominica"', add
label define bpl_lbl 26055 `"Grenada"', add
label define bpl_lbl 26060 `"Trinidad and Tobago"', add
label define bpl_lbl 26065 `"Antigua and Barbuda"', add
label define bpl_lbl 26070 `"St. Kitts--Nevis"', add
label define bpl_lbl 26075 `"St. Lucia"', add
label define bpl_lbl 26080 `"St. Vincent and the Grenadi"', add
label define bpl_lbl 26091 `"Caribbean, n.s."', add
label define bpl_lbl 30005 `"Argentina"', add
label define bpl_lbl 30010 `"Bolivia"', add
label define bpl_lbl 30015 `"Brazil"', add
label define bpl_lbl 30020 `"Chile"', add
label define bpl_lbl 30025 `"Colombia"', add
label define bpl_lbl 30030 `"Ecuador"', add
label define bpl_lbl 30040 `"Guyana/British Guiana"', add
label define bpl_lbl 30050 `"Peru"', add
label define bpl_lbl 30060 `"Uruguay"', add
label define bpl_lbl 30065 `"Venezuela"', add
label define bpl_lbl 30070 `"Paraguay"', add
label define bpl_lbl 30090 `"South America, n.s."', add
label define bpl_lbl 31000 `"Americas, n.s."', add
label define bpl_lbl 40000 `"Denmark"', add
label define bpl_lbl 40100 `"Finland"', add
label define bpl_lbl 40400 `"Norway"', add
label define bpl_lbl 40500 `"Sweden"', add
label define bpl_lbl 41000 `"England"', add
label define bpl_lbl 41100 `"Scotland"', add
label define bpl_lbl 41200 `"Wales"', add
label define bpl_lbl 41300 `"United Kingdom, n.s."', add
label define bpl_lbl 41400 `"Ireland"', add
label define bpl_lbl 41410 `"Northern Ireland"', add
label define bpl_lbl 42000 `"Belgium"', add
label define bpl_lbl 42100 `"France"', add
label define bpl_lbl 42500 `"Netherlands"', add
label define bpl_lbl 42600 `"Switzerland"', add
label define bpl_lbl 43300 `"Greece"', add
label define bpl_lbl 43400 `"Italy"', add
label define bpl_lbl 43600 `"Portugal"', add
label define bpl_lbl 43610 `"Azores"', add
label define bpl_lbl 43800 `"Spain"', add
label define bpl_lbl 45000 `"Austria"', add
label define bpl_lbl 45200 `"Czechoslavakia"', add
label define bpl_lbl 45212 `"Slovakia"', add
label define bpl_lbl 45213 `"Czech Republic"', add
label define bpl_lbl 45300 `"Germany"', add
label define bpl_lbl 45400 `"Hungary"', add
label define bpl_lbl 45500 `"Poland"', add
label define bpl_lbl 45600 `"Romania"', add
label define bpl_lbl 45650 `"Bulgaria"', add
label define bpl_lbl 45675 `"Albania"', add
label define bpl_lbl 45700 `"Yugoslavia"', add
label define bpl_lbl 45720 `"Bosnia and Herzegovina"', add
label define bpl_lbl 45730 `"Croatia"', add
label define bpl_lbl 45740 `"Macedonia"', add
label define bpl_lbl 45750 `"Serbia"', add
label define bpl_lbl 45760 `"Kosovo"', add
label define bpl_lbl 46100 `"Latvia"', add
label define bpl_lbl 46200 `"Lithuania"', add
label define bpl_lbl 46500 `"Other USSR/Russia"', add
label define bpl_lbl 46530 `"Ukraine"', add
label define bpl_lbl 46535 `"Belarus"', add
label define bpl_lbl 46540 `"Moldova"', add
label define bpl_lbl 46590 `"USSR, n.s."', add
label define bpl_lbl 49900 `"Europe, n.s."', add
label define bpl_lbl 50000 `"China"', add
label define bpl_lbl 50010 `"Hong Kong"', add
label define bpl_lbl 50040 `"Taiwan"', add
label define bpl_lbl 50100 `"Japan"', add
label define bpl_lbl 50200 `"Korea"', add
label define bpl_lbl 50220 `"South Korea"', add
label define bpl_lbl 51100 `"Cambodia"', add
label define bpl_lbl 51200 `"Indonesia"', add
label define bpl_lbl 51300 `"Laos"', add
label define bpl_lbl 51400 `"Malaysia"', add
label define bpl_lbl 51500 `"Philippines"', add
label define bpl_lbl 51600 `"Singapore"', add
label define bpl_lbl 51700 `"Thailand"', add
label define bpl_lbl 51800 `"Vietnam"', add
label define bpl_lbl 52000 `"Afghanistan"', add
label define bpl_lbl 52100 `"India"', add
label define bpl_lbl 52110 `"Bangladesh"', add
label define bpl_lbl 52130 `"Burma"', add
label define bpl_lbl 52140 `"Pakistan"', add
label define bpl_lbl 52150 `"Sri Lanka"', add
label define bpl_lbl 52200 `"Nepal"', add
label define bpl_lbl 55100 `"Armenia"', add
label define bpl_lbl 55200 `"Azerbaijan"', add
label define bpl_lbl 55300 `"Georgia"', add
label define bpl_lbl 55400 `"Uzbekistan"', add
label define bpl_lbl 53000 `"Iran"', add
label define bpl_lbl 53200 `"Iraq"', add
label define bpl_lbl 53400 `"Israel"', add
label define bpl_lbl 53420 `"Palestine"', add
label define bpl_lbl 53500 `"Jordan"', add
label define bpl_lbl 53700 `"Lebanon"', add
label define bpl_lbl 54000 `"Saudi Arabia"', add
label define bpl_lbl 54100 `"Syria"', add
label define bpl_lbl 54200 `"Turkey"', add
label define bpl_lbl 54300 `"Cyprus"', add
label define bpl_lbl 54350 `"Kuwait"', add
label define bpl_lbl 54400 `"Yemen"', add
label define bpl_lbl 54700 `"Middle East, n.s."', add
label define bpl_lbl 59900 `"Asia, n.e.c./n.s."', add
label define bpl_lbl 60010 `"Northern Africa"', add
label define bpl_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpl_lbl 60014 `"Morocco"', add
label define bpl_lbl 60016 `"Algeria"', add
label define bpl_lbl 60018 `"Sudan"', add
label define bpl_lbl 60023 `"Ghana"', add
label define bpl_lbl 60031 `"Nigeria"', add
label define bpl_lbl 60032 `"Cameroon"', add
label define bpl_lbl 60033 `"Cape Verde"', add
label define bpl_lbl 60034 `"Liberia"', add
label define bpl_lbl 60035 `"Senegal"', add
label define bpl_lbl 60036 `"Sierra Leone"', add
label define bpl_lbl 60040 `"Eritrea"', add
label define bpl_lbl 60044 `"Ethiopia"', add
label define bpl_lbl 60045 `"Kenya"', add
label define bpl_lbl 60050 `"Somalia"', add
label define bpl_lbl 60060 `"Tanzania"', add
label define bpl_lbl 60065 `"Uganda"', add
label define bpl_lbl 60070 `"Zimbabwe"', add
label define bpl_lbl 60094 `"South Africa (Union of)"', add
label define bpl_lbl 60099 `"Africa, n.s./n.e.c."', add
label define bpl_lbl 70010 `"Australia"', add
label define bpl_lbl 70020 `"New Zealand"', add
label define bpl_lbl 71000 `"Pacific Islands"', add
label define bpl_lbl 71021 `"Fiji"', add
label define bpl_lbl 71022 `"Tonga"', add
label define bpl_lbl 71023 `"Samoa"', add
label define bpl_lbl 96000 `"Other, n.e.c. and unknown"', add
label define bpl_lbl 99999 `"NIU"', add
label values bpl bpl_lbl

label define citizen_lbl 0 `"NIU"'
label define citizen_lbl 1 `"Born abroad of American parents"', add
label define citizen_lbl 2 `"Naturalized citizen"', add
label define citizen_lbl 3 `"Not a citizen"', add
label define citizen_lbl 9 `"NIU"', add
label values citizen citizen_lbl

label define hispan_lbl 000 `"Not Hispanic"'
label define hispan_lbl 100 `"Mexican"', add
label define hispan_lbl 102 `"Mexican American"', add
label define hispan_lbl 103 `"Mexicano/Mexicana"', add
label define hispan_lbl 104 `"Chicano/Chicana"', add
label define hispan_lbl 108 `"Mexican (Mexicano)"', add
label define hispan_lbl 109 `"Mexicano/Chicano"', add
label define hispan_lbl 200 `"Puerto Rican"', add
label define hispan_lbl 300 `"Cuban"', add
label define hispan_lbl 400 `"Other Spanish"', add
label define hispan_lbl 410 `"Central/South American"', add
label define hispan_lbl 901 `"Do not know"', add
label define hispan_lbl 902 `"N/A (and no response 1985-87)"', add
label values hispan hispan_lbl

label define educ_lbl 000 `"NIU or no schooling"'
label define educ_lbl 001 `"NIU"', add
label define educ_lbl 002 `"None or preschool"', add
label define educ_lbl 010 `"Grades 1, 2, 3, or 4"', add
label define educ_lbl 011 `"Grade 1"', add
label define educ_lbl 012 `"Grade 2"', add
label define educ_lbl 013 `"Grade 3"', add
label define educ_lbl 014 `"Grade 4"', add
label define educ_lbl 020 `"Grades 5 or 6"', add
label define educ_lbl 021 `"Grade 5"', add
label define educ_lbl 022 `"Grade 6"', add
label define educ_lbl 030 `"Grades 7 or 8"', add
label define educ_lbl 031 `"Grade 7"', add
label define educ_lbl 032 `"Grade 8"', add
label define educ_lbl 040 `"Grade 9"', add
label define educ_lbl 050 `"Grade 10"', add
label define educ_lbl 060 `"Grade 11"', add
label define educ_lbl 070 `"Grade 12"', add
label define educ_lbl 071 `"12th grade, no diploma"', add
label define educ_lbl 072 `"12th grade, diploma unclear"', add
label define educ_lbl 073 `"High school diploma or equivalent"', add
label define educ_lbl 080 `"1 year of college"', add
label define educ_lbl 081 `"Some college but no degree"', add
label define educ_lbl 090 `"2 years of college"', add
label define educ_lbl 091 `"Associate's degree, occupational/vocational program"', add
label define educ_lbl 092 `"Associate's degree, academic program"', add
label define educ_lbl 100 `"3 years of college"', add
label define educ_lbl 110 `"4 years of college"', add
label define educ_lbl 111 `"Bachelor's degree"', add
label define educ_lbl 120 `"5+ years of college"', add
label define educ_lbl 121 `"5 years of college"', add
label define educ_lbl 122 `"6+ years of college"', add
label define educ_lbl 123 `"Master's degree"', add
label define educ_lbl 124 `"Professional school degree"', add
label define educ_lbl 125 `"Doctorate degree"', add
label define educ_lbl 999 `"Missing/Unknown"', add
label values educ educ_lbl

label define empstat_lbl 00 `"NIU"'
label define empstat_lbl 10 `"At work"', add
label define empstat_lbl 12 `"Has job, not at work last week"', add
label define empstat_lbl 13 `"Armed Forces"', add
label define empstat_lbl 20 `"Unemployed"', add
label define empstat_lbl 21 `"Unemployed, experienced worker"', add
label define empstat_lbl 22 `"Unemployed, new worker"', add
label define empstat_lbl 30 `"Not in labor force"', add
label define empstat_lbl 31 `"NILF, housework"', add
label define empstat_lbl 32 `"NILF, unable to work"', add
label define empstat_lbl 33 `"NILF, school"', add
label define empstat_lbl 34 `"NILF, other"', add
label define empstat_lbl 35 `"NILF, unpaid, lt 15 hours"', add
label values empstat empstat_lbl

label define occ_lbl 0000 `"0"'
label define occ_lbl 0001 `"1"', add
label define occ_lbl 0002 `"2"', add
label define occ_lbl 0003 `"3"', add
label define occ_lbl 0004 `"4"', add
label define occ_lbl 0005 `"5"', add
label define occ_lbl 0006 `"6"', add
label define occ_lbl 0007 `"7"', add
label define occ_lbl 0008 `"8"', add
label define occ_lbl 0009 `"9"', add
label define occ_lbl 0010 `"10"', add
label define occ_lbl 0011 `"11"', add
label define occ_lbl 0012 `"12"', add
label define occ_lbl 0013 `"13"', add
label define occ_lbl 0014 `"14"', add
label define occ_lbl 0015 `"15"', add
label define occ_lbl 0016 `"16"', add
label define occ_lbl 0017 `"17"', add
label define occ_lbl 0018 `"18"', add
label define occ_lbl 0019 `"19"', add
label define occ_lbl 0020 `"20"', add
label define occ_lbl 0021 `"21"', add
label define occ_lbl 0022 `"22"', add
label define occ_lbl 0023 `"23"', add
label define occ_lbl 0024 `"24"', add
label define occ_lbl 0025 `"25"', add
label define occ_lbl 0026 `"26"', add
label define occ_lbl 0027 `"27"', add
label define occ_lbl 0028 `"28"', add
label define occ_lbl 0029 `"29"', add
label define occ_lbl 0030 `"30"', add
label define occ_lbl 0031 `"31"', add
label define occ_lbl 0032 `"32"', add
label define occ_lbl 0033 `"33"', add
label define occ_lbl 0034 `"34"', add
label define occ_lbl 0035 `"35"', add
label define occ_lbl 0036 `"36"', add
label define occ_lbl 0037 `"37"', add
label define occ_lbl 0099 `"99"', add
label values occ occ_lbl

label define ind_lbl 0000 `"0"'
label values ind ind_lbl

label define classwkr_lbl 00 `"NIU"'
label define classwkr_lbl 10 `"Self-employed"', add
label define classwkr_lbl 13 `"Self-employed, not incorporated"', add
label define classwkr_lbl 14 `"Self-employed, incorporated"', add
label define classwkr_lbl 20 `"Works for wages or salary"', add
label define classwkr_lbl 21 `"Wage/salary, private"', add
label define classwkr_lbl 22 `"Private, for profit"', add
label define classwkr_lbl 23 `"Private, nonprofit"', add
label define classwkr_lbl 24 `"Wage/salary, government"', add
label define classwkr_lbl 25 `"Federal government employee"', add
label define classwkr_lbl 26 `"Armed forces"', add
label define classwkr_lbl 27 `"State government employee"', add
label define classwkr_lbl 28 `"Local government employee"', add
label define classwkr_lbl 29 `"Unpaid family worker"', add
label define classwkr_lbl 99 `"Missing/Unknown"', add
label values classwkr classwkr_lbl

label define wkswork1_lbl 00 `"NIU"'
label define wkswork1_lbl 01 `"1 week"', add
label define wkswork1_lbl 02 `"2 weeks"', add
label define wkswork1_lbl 03 `"3 weeks"', add
label define wkswork1_lbl 04 `"4 weeks"', add
label define wkswork1_lbl 05 `"5 weeks"', add
label define wkswork1_lbl 06 `"6 weeks"', add
label define wkswork1_lbl 07 `"7 weeks"', add
label define wkswork1_lbl 08 `"8 weeks"', add
label define wkswork1_lbl 09 `"9 weeks"', add
label define wkswork1_lbl 10 `"10 weeks"', add
label define wkswork1_lbl 11 `"11 weeks"', add
label define wkswork1_lbl 12 `"12 weeks"', add
label define wkswork1_lbl 13 `"13 weeks"', add
label define wkswork1_lbl 14 `"14 weeks"', add
label define wkswork1_lbl 15 `"15 weeks"', add
label define wkswork1_lbl 16 `"16 weeks"', add
label define wkswork1_lbl 17 `"17 weeks"', add
label define wkswork1_lbl 18 `"18 weeks"', add
label define wkswork1_lbl 19 `"19 weeks"', add
label define wkswork1_lbl 20 `"20 weeks"', add
label define wkswork1_lbl 21 `"21 weeks"', add
label define wkswork1_lbl 22 `"22 weeks"', add
label define wkswork1_lbl 23 `"23 weeks"', add
label define wkswork1_lbl 24 `"24 weeks"', add
label define wkswork1_lbl 25 `"25 weeks"', add
label define wkswork1_lbl 26 `"26 weeks"', add
label define wkswork1_lbl 27 `"27 weeks"', add
label define wkswork1_lbl 28 `"28 weeks"', add
label define wkswork1_lbl 29 `"29 weeks"', add
label define wkswork1_lbl 30 `"30 weeks"', add
label define wkswork1_lbl 31 `"31 weeks"', add
label define wkswork1_lbl 32 `"32 weeks"', add
label define wkswork1_lbl 33 `"33 weeks"', add
label define wkswork1_lbl 34 `"34 weeks"', add
label define wkswork1_lbl 35 `"35 weeks"', add
label define wkswork1_lbl 36 `"36 weeks"', add
label define wkswork1_lbl 37 `"37 weeks"', add
label define wkswork1_lbl 38 `"38 weeks"', add
label define wkswork1_lbl 39 `"39 weeks"', add
label define wkswork1_lbl 40 `"40 weeks"', add
label define wkswork1_lbl 41 `"41 weeks"', add
label define wkswork1_lbl 42 `"42 weeks"', add
label define wkswork1_lbl 43 `"43 weeks"', add
label define wkswork1_lbl 44 `"44 weeks"', add
label define wkswork1_lbl 45 `"45 weeks"', add
label define wkswork1_lbl 46 `"46 weeks"', add
label define wkswork1_lbl 47 `"47 weeks"', add
label define wkswork1_lbl 48 `"48 weeks"', add
label define wkswork1_lbl 49 `"49 weeks"', add
label define wkswork1_lbl 50 `"50 weeks"', add
label define wkswork1_lbl 51 `"51 weeks"', add
label define wkswork1_lbl 52 `"52 weeks"', add
label values wkswork1 wkswork1_lbl

label define uhrswork_lbl 00 `"NIU"'
label define uhrswork_lbl 01 `"1 hour"', add
label define uhrswork_lbl 02 `"2 hours"', add
label define uhrswork_lbl 03 `"3 hours"', add
label define uhrswork_lbl 04 `"4 hours"', add
label define uhrswork_lbl 05 `"5 hours"', add
label define uhrswork_lbl 06 `"6 hours"', add
label define uhrswork_lbl 07 `"7 hours"', add
label define uhrswork_lbl 08 `"8 hours"', add
label define uhrswork_lbl 09 `"9 hours"', add
label define uhrswork_lbl 10 `"10 hours"', add
label define uhrswork_lbl 11 `"11 hours"', add
label define uhrswork_lbl 12 `"12 hours"', add
label define uhrswork_lbl 13 `"13 hours"', add
label define uhrswork_lbl 14 `"14 hours"', add
label define uhrswork_lbl 15 `"15 hours"', add
label define uhrswork_lbl 16 `"16 hours"', add
label define uhrswork_lbl 17 `"17 hours"', add
label define uhrswork_lbl 18 `"18 hours"', add
label define uhrswork_lbl 19 `"19 hours"', add
label define uhrswork_lbl 20 `"20 hours"', add
label define uhrswork_lbl 21 `"21 hours"', add
label define uhrswork_lbl 22 `"22 hours"', add
label define uhrswork_lbl 23 `"23 hours"', add
label define uhrswork_lbl 24 `"24 hours"', add
label define uhrswork_lbl 25 `"25 hours"', add
label define uhrswork_lbl 26 `"26 hours"', add
label define uhrswork_lbl 27 `"27 hours"', add
label define uhrswork_lbl 28 `"28 hours"', add
label define uhrswork_lbl 29 `"29 hours"', add
label define uhrswork_lbl 30 `"30 hours"', add
label define uhrswork_lbl 31 `"31 hours"', add
label define uhrswork_lbl 32 `"32 hours"', add
label define uhrswork_lbl 33 `"33 hours"', add
label define uhrswork_lbl 34 `"34 hours"', add
label define uhrswork_lbl 35 `"35 hours"', add
label define uhrswork_lbl 36 `"36 hours"', add
label define uhrswork_lbl 37 `"37 hours"', add
label define uhrswork_lbl 38 `"38 hours"', add
label define uhrswork_lbl 39 `"39 hours"', add
label define uhrswork_lbl 40 `"40 hours"', add
label define uhrswork_lbl 41 `"41 hours"', add
label define uhrswork_lbl 42 `"42 hours"', add
label define uhrswork_lbl 43 `"43 hours"', add
label define uhrswork_lbl 44 `"44 hours"', add
label define uhrswork_lbl 45 `"45 hours"', add
label define uhrswork_lbl 46 `"46 hours"', add
label define uhrswork_lbl 47 `"47 hours"', add
label define uhrswork_lbl 48 `"48 hours"', add
label define uhrswork_lbl 49 `"49 hours"', add
label define uhrswork_lbl 50 `"50 hours"', add
label define uhrswork_lbl 51 `"51 hours"', add
label define uhrswork_lbl 52 `"52 hours"', add
label define uhrswork_lbl 53 `"53 hours"', add
label define uhrswork_lbl 54 `"54 hours"', add
label define uhrswork_lbl 55 `"55 hours"', add
label define uhrswork_lbl 56 `"56 hours"', add
label define uhrswork_lbl 57 `"57 hours"', add
label define uhrswork_lbl 58 `"58 hours"', add
label define uhrswork_lbl 59 `"59 hours"', add
label define uhrswork_lbl 60 `"60 hours"', add
label define uhrswork_lbl 61 `"61 hours"', add
label define uhrswork_lbl 62 `"62 hours"', add
label define uhrswork_lbl 63 `"63 hours"', add
label define uhrswork_lbl 64 `"64 hours"', add
label define uhrswork_lbl 65 `"65 hours"', add
label define uhrswork_lbl 66 `"66 hours"', add
label define uhrswork_lbl 67 `"67 hours"', add
label define uhrswork_lbl 68 `"68 hours"', add
label define uhrswork_lbl 69 `"69 hours"', add
label define uhrswork_lbl 70 `"70 hours"', add
label define uhrswork_lbl 71 `"71 hours"', add
label define uhrswork_lbl 72 `"72 hours"', add
label define uhrswork_lbl 73 `"73 hours"', add
label define uhrswork_lbl 74 `"74 hours"', add
label define uhrswork_lbl 75 `"75 hours"', add
label define uhrswork_lbl 76 `"76 hours"', add
label define uhrswork_lbl 77 `"77 hours"', add
label define uhrswork_lbl 78 `"78 hours"', add
label define uhrswork_lbl 79 `"79 hours"', add
label define uhrswork_lbl 80 `"80 hours"', add
label define uhrswork_lbl 81 `"81 hours"', add
label define uhrswork_lbl 82 `"82 hours"', add
label define uhrswork_lbl 83 `"83 hours"', add
label define uhrswork_lbl 84 `"84 hours"', add
label define uhrswork_lbl 85 `"85 hours"', add
label define uhrswork_lbl 86 `"86 hours"', add
label define uhrswork_lbl 87 `"87 hours"', add
label define uhrswork_lbl 88 `"88 hours"', add
label define uhrswork_lbl 89 `"89 hours"', add
label define uhrswork_lbl 90 `"90 hours"', add
label define uhrswork_lbl 91 `"91 hours"', add
label define uhrswork_lbl 92 `"92 hours"', add
label define uhrswork_lbl 93 `"93 hours"', add
label define uhrswork_lbl 94 `"94 hours"', add
label define uhrswork_lbl 95 `"95 hours"', add
label define uhrswork_lbl 96 `"96 hours"', add
label define uhrswork_lbl 97 `"97 hours"', add
label define uhrswork_lbl 98 `"98 hours"', add
label define uhrswork_lbl 99 `"99 hours plus"', add
label values uhrswork uhrswork_lbl

label define pension_lbl 0 `"NIU"'
label define pension_lbl 1 `"No pension plan at work"', add
label define pension_lbl 2 `"Pension plan at work, but not included"', add
label define pension_lbl 3 `"Included in pension plan at work"', add
label values pension pension_lbl

label define union_lbl 0 `"NIU"'
label define union_lbl 1 `"No union coverage"', add
label define union_lbl 2 `"Member of labor union"', add
label define union_lbl 3 `"Covered by union but not a member"', add
label values union union_lbl

label define ftotval_lbl 0000999999 `"999999"'
label values ftotval ftotval_lbl

label define inctot_lbl 99999999 `"99999999"'
label values inctot inctot_lbl

label define incwage_lbl 9999999 `"9999999"'
label values incwage incwage_lbl

label define incbus_lbl 9999999 `"9999999"'
label values incbus incbus_lbl

label define incfarm_lbl 9999999 `"9999999"'
label values incfarm incfarm_lbl


