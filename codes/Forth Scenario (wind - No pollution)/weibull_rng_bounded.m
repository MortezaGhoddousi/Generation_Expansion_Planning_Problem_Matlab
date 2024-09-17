function weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound)
weibull_random = wblrnd(shape_parameter, scale_parameter);
while weibull_random < lower_bound || weibull_random > upper_bound
    weibull_random = wblrnd(shape_parameter, scale_parameter);
end
end