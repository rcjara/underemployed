***************************
* create convenience vars *
***************************
local scopes occ econ

foreach scope of local scopes {
  gen  `scope'_lhs_share     = `scope'_ed_pop1
  gen  `scope'_hs_share      = `scope'_ed_pop2
  gen  `scope'_sc_share      = `scope'_ed_pop3
  gen  `scope'_ba_share      = `scope'_ed_pop4
  gen  `scope'_grad_share    = `scope'_ed_pop5

  gen  `scope'_lhs_earnings  = `scope'_ed_earnings1
  gen  `scope'_hs_earnings   = `scope'_ed_earnings2
  gen  `scope'_sc_earnings   = `scope'_ed_earnings3
  gen  `scope'_ba_earnings   = `scope'_ed_earnings4
  gen  `scope'_grad_earnings = `scope'_ed_earnings5

  egen `scope'_higher_ed_share  = rowtotal(`scope'_ba_share `scope'_grad_share)
  egen `scope'_sc_above_share   = rowtotal(`scope'_sc_share `scope'_higher_ed_share)
  egen `scope'_hs_above_share   = rowtotal(`scope'_hs_share `scope'_sc_above_share)
  gen  `scope'_grad_share_of_higher_ed = `scope'_grad_share / `scope'_higher_ed_share
}

************
* FLAG 1's *
************
***************
* grad flag 1 *
***************
*1. BA/Grad in share in occ  greater than BA/Grad share for economy as a whole for that gender
*and grad share of BA/grad combined greater than the graduate share of BA plus Grad sharefor that gender
*or 2.  BA/Grad in share in occ  greater than BA/Grad share for economy as a whole for that gender and grad earnings at lest 30% greater than BA earnings in that occ
*or 3. in remaining occupations, if grad median is greater than 90% of overall grad median for that gender and 15% higher than BA median in that occ

gen gf1_cond1 = occ_higher_ed_share > econ_higher_ed_share ///
                & occ_grad_share_of_higher_ed > econ_grad_share_of_higher_ed

gen gf1_cond2 = !missing(occ_ba_share) ///
                & occ_higher_ed_share > econ_higher_ed_share ///
                & occ_grad_earnings > (occ_ba_earnings * 1.3)

gen gf1_cond3 = occ_grad_earnings > (econ_grad_earnings * 0.9) ///
                & occ_grad_earnings > (occ_ba_earnings * 1.15)

gen grad_flag1 = !missing(occ_grad_share) & (gf1_cond1 | gf1_cond2 | gf1_cond3)

*************
* ba flag 1 *
*************
*1. BA plus Grad in share in occ  greater than BA/Grad share for economy as a whole for that gender
*or 2. in remaining occupations, if BA median in that occ is greater than 90% of overall BA median for that gender and 15% higher than some college median in that occ

gen bf1_cond1 = occ_higher_ed_share > econ_higher_ed_share

gen bf1_cond2 = !missing(occ_sc_share) ///
                & occ_ba_earnings > econ_ba_earnings ///
                & occ_ba_earnings > (occ_sc_earnings * 1.15)

gen ba_flag1 = !missing(occ_ba_share) & (bf1_cond1 | bf1_cond2)

***************
* some flag 1 *
***************
*1. sum of shares of some college, BA and Grad in share in occ  greater than some/BA/Grad share for economy as a whole for that gender
*or 2. in remaining occupations, if some median in that occ is greater than 90% of overall some median for that gender and 15% higher than HS only median in that occ

gen sc1_cond1 = (occ_sc_share / occ_sc_above_share) > (econ_sc_share / econ_sc_above_share)

gen sc1_cond2 = !missing(occ_lhs_share) ///
                & occ_sc_earnings > (econ_sc_earnings * 0.9) ///
                & occ_sc_earnings > (1.15 * occ_lhs_earnings)

gen some_flag1 = !missing(occ_sc_share) & (sc1_cond1 | sc1_cond2)

*************
* hs flag 1 *
*************
*1. sum of shares of HS, some college, BA and Grad in share in occ  greater than HS/some/BA/Grad share for economy as a whole for that gender
*or 2. in remaining occupations, if HS median in that occ is greater than 90% of overall HS median for that gender and 15% higher than HS dropout median in that occ

gen hsf1_cond1 = occ_hs_above_share > econ_hs_above_share

gen hsf1_cond2 = !missing(occ_lhs_earnings) ///
                 & occ_hs_earnings > (econ_hs_earnings * 0.9) ///
                 & occ_hs_earnings > (occ_lhs_earnings * 1.15)

gen hs_flag1 = !missing(occ_hs_share) & (hsf1_cond1 | hsf1_cond2)

************
* FLAG 2's *
************
*************
* ba flag 2 *
*************
*1. If BA share in occ is less than combined BA share of BA/Grad combined
*and grad median inside of the occ has a greater premium than the graduate median premium over BA median for all workers of that gender

gen baf2_cond1 = (occ_ba_share / occ_higher_ed_share) < (econ_ba_share / econ_higher_ed_share)
gen baf2_cond2 = (occ_grad_earnings - occ_ba_earnings) > (econ_grad_earnings - econ_ba_earnings)

gen ba_flag2 = ba_flag1 & baf2_cond1 & baf2_cond2

***************
* some flag 2 *
***************
*1. If some share in occ is less than combined some share of Some/BA/Grad combined
*and median inside of the occ is at least 30% greater than the some median in that occ for that gender

*The logic here is to identify jobs where a person with one education level is working in an occ in which has a disproportionate share of those with higher levels of education.

*So the some share of some plus is 45.2%, therefore this condition means only do the flag2 test if the share in that occupation has some share of some plue less than this figure.
*

gen sf2_cond1 = (occ_sc_share / occ_sc_above_share) < (econ_sc_share / econ_sc_above_share)

gen sf2_cond2 = !missing(occ_sc_earnings) ///
                & occ_ba_earnings > (occ_sc_earnings * 1.2)

gen some_flag2 = some_flag1 & sf2_cond1 & sf2_cond2

*************
* hs flag 2 *
*************
*1. If HS share in occ is less than combined HS share of HS/Some/BA/Grad combined
*and Some median inside of the occ is at least 30% greater than the HS median in that occ for that gender

gen hsf2_cond1 = (occ_hs_share / occ_hs_above_share) < (econ_hs_share / econ_hs_above_share)

gen hsf2_cond2 = !missing(occ_lhs_earnings) ///
                 & occ_sc_earnings > (occ_hs_earnings * 1.2)

gen hs_flag2 = hs_flag1 & hsf2_cond1 & hsf2_cond2

local vars_to_keep occ grad_flag1 ba_flag1 some_flag1 hs_flag1 ba_flag2 some_flag2 hs_flag2
keep  `vars_to_keep'
order `vars_to_keep'
