function [capacity, Cinv] = cons(year, capacity, Cinv, inputArg1, initial_capacity, inv_cost, demand)
shape_parameter = 20;
scale_parameter = 1;
lower_bound = 1;
upper_bound = 20;
if year > 7
    allow_new_capacity = false;
else
    allow_new_capacity = true;
end
switch year
    case 1
        if inputArg1(((year-1)*5)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*5)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*5)+4) == 1
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        end
        if inputArg1(((year-1)*5)+5) == 1
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        end
        if inputArg1(((year-1)*5)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        end
    case 2
        if inputArg1(((year-1)*5)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*5)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*5)+4) == 1
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        end
        if inputArg1(((year-1)*5)+5) == 1
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        end
        if inputArg1(((year-1)*5)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        end
    case 3
        if inputArg1(((year-1)*5)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*5)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*5)+4) == 1
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        end
        if inputArg1(((year-1)*5)+5) == 1
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        end
        if inputArg1(((year-1)*5)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        end
    case 4
        if inputArg1(((year-1)*5)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*5)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*5)+4) == 1
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        end
        if inputArg1(((year-1)*5)+5) == 1
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        end
        if inputArg1(((year-1)*5)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        end
    case 5
        if inputArg1(((year-1)*5)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*5)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*5)+4) == 1
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        end
        if inputArg1(((year-1)*5)+5) == 1
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        end
        if inputArg1(((year-1)*5)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        end
    case 6
        if inputArg1(((year-1)*5)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*5)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*5)+4) == 1
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        end
        if inputArg1(((year-1)*5)+5) == 1
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        end
        if inputArg1(((year-1)*5)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        end
    case 7
        if inputArg1(((year-1)*5)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*5)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*5)+4) == 1
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        end
        if inputArg1(((year-1)*5)+5) == 1
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        end
        if inputArg1(((year-1)*5)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        end
    case 8
        if inputArg1(((year-1)*5)+1) == 1 && allow_new_capacity
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        elseif inputArg1(((year-1)*5)+1) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(1) = capacity(1) - initial_capacity(1);
                Cinv = Cinv + inv_cost(1) * initial_capacity(1) / 2;
            end
        end
        if inputArg1(((year-1)*5)+2) == 1 && allow_new_capacity
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        elseif inputArg1(((year-1)*3)+2) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(2) = capacity(2) - initial_capacity(2);
                Cinv = Cinv + inv_cost(2) * initial_capacity(2) / 2;
            end
        end
        if inputArg1(((year-1)*5)+4) == 1 && allow_new_capacity
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        elseif inputArg1(((year-1)*5)+4) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(4) = capacity(4) - initial_capacity(4);
                Cinv = Cinv + inv_cost(4) * initial_capacity(4) / 2;
            end
        end
        if inputArg1(((year-1)*5)+5) == 1 && allow_new_capacity
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        elseif inputArg1(((year-1)*3)+5) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(5) = capacity(5) - initial_capacity(5);
                Cinv = Cinv + inv_cost(5) * initial_capacity(5) / 2;
            end
        end
        if inputArg1(((year-1)*5)+3) == 1 && allow_new_capacity
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        elseif inputArg1(((year-1)*5)+3) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(3) = capacity(3) - initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3) / 2;
            end
        end
    case 9
        if inputArg1(((year-1)*5)+1) == 1 && allow_new_capacity
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        elseif inputArg1(((year-1)*5)+1) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(1) = capacity(1) - initial_capacity(1);
                Cinv = Cinv + inv_cost(1) * initial_capacity(1) / 2;
            end
        end
        if inputArg1(((year-1)*5)+2) == 1 && allow_new_capacity
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        elseif inputArg1(((year-1)*5)+2) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(2) = capacity(2) - initial_capacity(2);
                Cinv = Cinv + inv_cost(2) * initial_capacity(2) / 2;
            end
        end
        if inputArg1(((year-1)*5)+4) == 1 && allow_new_capacity
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        elseif inputArg1(((year-1)*5)+4) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(4) = capacity(4) - initial_capacity(4);
                Cinv = Cinv + inv_cost(4) * initial_capacity(4) / 2;
            end
        end
        if inputArg1(((year-1)*5)+5) == 1 && allow_new_capacity
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        elseif inputArg1(((year-1)*3)+5) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(5) = capacity(5) - initial_capacity(5);
                Cinv = Cinv + inv_cost(5) * initial_capacity(5) / 2;
            end
        end
        if inputArg1(((year-1)*5)+3) == 1 && allow_new_capacity
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        elseif inputArg1(((year-1)*5)+3) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(3) = capacity(3) - initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3) / 2;
            end
        end
    case 10
        if inputArg1(((year-1)*5)+1) == 1 && allow_new_capacity
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        elseif inputArg1(((year-1)*5)+1) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(1) = capacity(1) - initial_capacity(1);
                Cinv = Cinv + inv_cost(1) * initial_capacity(1) / 2;
            end
        end
        if inputArg1(((year-1)*5)+2) == 1 && allow_new_capacity
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        elseif inputArg1(((year-1)*5)+2) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(2) = capacity(2) - initial_capacity(2);
                Cinv = Cinv + inv_cost(2) * initial_capacity(2) / 2;
            end
        end
        if inputArg1(((year-1)*5)+4) == 1 && allow_new_capacity
            capacity(4) = capacity(4) + initial_capacity(4);
            Cinv = Cinv + inv_cost(4) * initial_capacity(4);
        elseif inputArg1(((year-1)*5)+4) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(4) = capacity(4) - initial_capacity(4);
                Cinv = Cinv + inv_cost(4) * initial_capacity(4) / 2;
            end
        end
        if inputArg1(((year-1)*5)+5) == 1 && allow_new_capacity
            capacity(5) = capacity(5) + initial_capacity(5);
            Cinv = Cinv + inv_cost(5) * initial_capacity(5);
        elseif inputArg1(((year-1)*3)+5) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(5) = capacity(5) - initial_capacity(5);
                Cinv = Cinv + inv_cost(5) * initial_capacity(5) / 2;
            end
        end
        if inputArg1(((year-1)*5)+3) == 1 && allow_new_capacity
            capacity(3) = capacity(3) + initial_capacity(3);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3);
        elseif inputArg1(((year-1)*5)+3) == 0 && allow_new_capacity
            if sum(capacity) < demand
                capacity(3) = capacity(3) - initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3) / 2;
            end
        end
end
end