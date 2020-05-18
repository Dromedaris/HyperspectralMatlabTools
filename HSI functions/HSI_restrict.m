function HSI_limited = HSI_restrict(HSI,upper_bound, lower_bound)

HSI_limited  = max(min(HSI,upper_bound),lower_bound);

end