capture program drop make_proportion
program define make_proportion
  local vars `1'
  tempvar ttl
  egen `ttl' = rowtotal(`vars')
  foreach var of varlist `vars' {
    replace `var' = `var' / `ttl'
  }

end

