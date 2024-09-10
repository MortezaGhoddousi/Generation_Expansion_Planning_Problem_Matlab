function [capacity, Cinv] = cons(year, capacity, Cinv, inputArg1, initial_capacity, inv_cost)
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
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
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
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
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
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
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
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
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
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
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
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
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
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
        end
    case 8
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
        end
    case 9
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
        end
    case 10
        if inputArg1(((year-1)*3)+1) == 1
            capacity(1) = capacity(1) + initial_capacity(1);
            Cinv = Cinv + inv_cost(1) * initial_capacity(1);
        end
        if inputArg1(((year-1)*3)+2) == 1
            capacity(2) = capacity(2) + initial_capacity(2);
            Cinv = Cinv + inv_cost(2) * initial_capacity(2);
        end
        if inputArg1(((year-1)*3)+3) == 1
            capacity(3) = capacity(3) + initial_capacity(3) + randi([10, 50]);
            Cinv = Cinv + inv_cost(3) * initial_capacity(3) * (initial_capacity(3) + randi([10, 50]));
        end
end
end