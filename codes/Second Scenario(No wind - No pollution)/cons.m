function [capacity, Cinv] = cons(year, capacity, Cinv, inputArg1, initial_capacity, inv_cost, demand)
shape_parameter = 200;
scale_parameter = 100;
lower_bound = 100;
upper_bound = 300;
if year > 7
    allow_new_capacity = false;
else
    allow_new_capacity = true;
end
switch year
    case 1
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        end
    case 2
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        end
    case 3
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        end
    case 4
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        end
    case 5
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        end
    case 6
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        end
    case 7
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        end
    case 8
        if inputArg1(((year-1)*3)+1) == 1 && allow_new_capacity
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        elseif inputArg1(((year-1)*3)+1) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(1) = capacity(1) - initial_capacity(1);
                Cinv = Cinv + inv_cost(1) * initial_capacity(1) / 2;
            end         
        end
        if inputArg1(((year-1)*3)+2) == 1 && allow_new_capacity
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        elseif inputArg1(((year-1)*3)+2) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(2) = capacity(2) - initial_capacity(2);
                Cinv = Cinv + inv_cost(2) * initial_capacity(2) / 2;
            end
        end
        if inputArg1(((year-1)*3)+3) == 1 && allow_new_capacity
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        elseif inputArg1(((year-1)*3)+3) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(3) = capacity(3) - initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3) / 2;
            end
        end
    case 9
        if inputArg1(((year-1)*3)+1) == 1 && allow_new_capacity
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        elseif inputArg1(((year-1)*3)+1) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(1) = capacity(1) - initial_capacity(1);
                Cinv = Cinv + inv_cost(1) * initial_capacity(1) / 2;
            end
        end
        if inputArg1(((year-1)*3)+2) == 1 && allow_new_capacity
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        elseif inputArg1(((year-1)*3)+2) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(2) = capacity(2) - initial_capacity(2);
                Cinv = Cinv + inv_cost(2) * initial_capacity(2) / 2;
            end
        end
        if inputArg1(((year-1)*3)+3) == 1 && allow_new_capacity
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        elseif inputArg1(((year-1)*3)+3) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(3) = capacity(3) - initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3) / 2;
            end
        end
    case 10
        if inputArg1(((year-1)*3)+1) == 1 && allow_new_capacity
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        elseif inputArg1(((year-1)*3)+1) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(1) = capacity(1) - initial_capacity(1);
                Cinv = Cinv + inv_cost(1) * initial_capacity(1) / 2;
            end
        end
        if inputArg1(((year-1)*3)+2) == 1 && allow_new_capacity
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        elseif inputArg1(((year-1)*3)+2) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(2) = capacity(2) - initial_capacity(2);
                Cinv = Cinv + inv_cost(2) * initial_capacity(2) / 2;
            end
        end
        if inputArg1(((year-1)*3)+3) == 1 && allow_new_capacity
            weibull_random = weibull_rng_bounded(shape_parameter, scale_parameter, lower_bound, upper_bound);
            capacity(3) = capacity(3) + initial_capacity(3) + weibull_random;
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + weibull_random);
        elseif inputArg1(((year-1)*3)+3) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(3) = capacity(3) - initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3) / 2;
            end
        end
end
end