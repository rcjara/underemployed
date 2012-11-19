capture program drop make_proportion
program define make_proportion
  local vars `1'
  tempvar ttl
  egen `ttl' = rowtotal(`vars')
  foreach var of varlist `vars' {
    replace `var' = `var' / `ttl'
  }
end

capture program drop reshape_by_educ6
program define reshape_by_educ6
  local order `1'
  local qualified_level `2'
  rename `qualified_level' qualified

  collapse (rawsum) pop=wgt (median) earnings [pw=wgt], by(qualified educ6)
  reshape wide pop earnings, i(qualified) j(educ6)

  gen status = "`qualified_level'" if _n == 1
  gen order = 1000 * `order' + _n
  order order status qualified pop* earnings*
end

capture program drop gen_status_var
program define gen_status_var
  local status_var `1'
  local flag_var `2'
  gen `status_var' = 1
  //bizzare order is so that
  replace `status_var' = 3 if `flag_var'1
  replace `status_var' = 2 if `flag_var'2
end

