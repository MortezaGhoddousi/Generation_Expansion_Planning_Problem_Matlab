function [outputArg1] = objectiveFunction(inputArg1)
for i = 1:numel(inputArg1)
    if inputArg1(i) < 0.5
        inputArg1(i) = 0;
    else
        inputArg1(i) = 1;
    end
end
% Define Parameters
num_years = 10; % Planning horizon in years
num_plants = 3; % Number of potential new plants
initial_capacity = [100, 150, 200]; % Initial capacity of existing plants (MW)
inv_cost = [1000, 800, 1200]; % Investment cost for new plants ($/MW)
fuel_cost = [50, 60, 45]; % Fuel cost for plants ($/MWh)
o_m_cost = [10, 12, 8]; % Operation & maintenance cost ($/MWh)
pollution_limit = [1000, 800, 1200]; % Pollution limit (units)
demand_growth = 0.05; % Annual demand growth rate
initial_demand = 500; % Initial demand (MW)
pollution_rate = [0.5, 0.7, 0.4]; % Pollution rate per plant (units/MWh)
FOR = [0.05, 0.08, 0.06]; % Forced outage rate
reserve_percentage = 15; % Reserve percentage
LOLP_max = 0.1; % Maximum acceptable LOLP
Cost_ENSt = 1000; % Cost of energy not served (R/MWh)

% Initialize variables
capacity = initial_capacity;
demand = initial_demand;
total_cost = zeros(1, num_years);
pollution = zeros(1, num_years);

% Define constraints
fuel_constraint = 10000; % Maximum fuel usage (units)
fuel_usage = [0.8, 0.9, 0.7]; % Fuel usage (units/MWh)
pollution_types = 1; % Number of pollution types

% Loop over planning horizon
for year = 1:num_years
    % Calculate annual demand
    demand = demand * (1 + demand_growth);
    required_reserve = demand * reserve_percentage / 100;
    available_capacity = sum(capacity) - sum(FOR .* capacity);
    
    % Initialize annual costs
    Cinv = 0;
    Cfuel = 0;
    Co_m = 0;
    CENS = 0;
    
    % Determine if new capacity is needed

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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
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
                capacity(3) = capacity(3) + initial_capacity(3);
                Cinv = Cinv + inv_cost(3) * initial_capacity(3);
            end
    end
   
    % Calculate annual costs and pollution
    for i = 1:num_plants
        energy_output = capacity(i) * (1 - FOR(i));
        Cfuel = Cfuel + fuel_cost(i) * energy_output;
        Co_m = Co_m + o_m_cost(i) * capacity(i);
        pollution(year) = pollution(year) + pollution_rate(i) * energy_output;
    end
    
    
    % Calculate ENS and its cost
    if available_capacity < demand
        ENS = demand - available_capacity;
        CENS = Cost_ENSt * ENS;
    else
        ENS = 0;
    end
    
    % Calculate total cost
    Ctotal = Cinv + Cfuel + Co_m + CENS;
    total_cost(year) = Ctotal;
    
end

outputArg1 = mse([sum(total_cost), sum(pollution)]);

end