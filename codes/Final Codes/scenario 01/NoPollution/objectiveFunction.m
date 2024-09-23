function [outputArg1] = objectiveFunction(inputArg1)
    for i = 1:numel(inputArg1)
        if inputArg1(i) < 0.5
            inputArg1(i) = 0;
        else
            inputArg1(i) = 1;
        end
    end

    % Check number of plants on a period
    Cred = 0;
    checkNumber = reshape(inputArg1, 5, 10);
    checkNumber = sum(checkNumber');
    for i = 1:numel(checkNumber)
        if checkNumber(i) > 5
            Cred = Cred + 10000;
        end
    end

    % Define Parameters
    num_years = 10; % Planning horizon in years
    num_plants = 5; % Number of potential new plants
    initial_capacity = [100, 150, 100, 110, 200]; % Initial capacity of existing plants (MW)
    inv_cost = [1000, 800, 900, 1100, 900]; % Investment cost for new plants ($/MW)
    fuel_cost = [50, 60, 55, 55, 70]; % Fuel cost for plants ($/MWh)
    o_m_cost = [10, 12, 10, 11, 15]; % Operation & maintenance cost ($/MWh)
    pollution_cost = [100, 120, 200, 90, 50]; % Pollution cost ($/MWh)
    demand_growth = 0.1; % Annual demand growth rate
    initial_demand = 600; % Initial demand (MW)
    pollution_rate = [1.5, 1.6, 1.8, 1, 0.8]; % Pollution rate per plant (units/MWh)
    FOR = [0.05, 0.08, 0.06, 0.05, 0.07]; % Forced outage rate
    Cost_ENSt = 1000; % Cost of energy not served (R/MWh)
    inflation = 0.3;

    % Define demand response parameters
    eligible_loads = [1, 2, 3, 4, 5]; % Example of eligible loads
    omission_penalty = [100, 80, 120, 110, 130]; % Penalty for omitting eligible loads
    demand_response_trigger = 1; % Trigger for demand response (1 if activated, 0 otherwise)

    % Initialize variables
    capacity = initial_capacity;
    demand = initial_demand;
    total_cost = zeros(1, num_years);
    pollution = zeros(1, num_years);

    % Loop over planning horizon
    for year = 1:num_years
        % Calculate annual demand
        demand = demand * (1 + demand_growth);
        available_capacity = sum(capacity) - sum(FOR .* capacity);

        % Initialize annual costs
        Cinv = 0;
        Cfuel = 0;
        Co_m = 0;
        CENS = 0;
        Cpoll = 0;

        % Determine if new capacity is needed
        [capacity, Cinv] = cons(year, capacity, Cinv, inputArg1, initial_capacity, inv_cost, demand, false);

        % Calculate annual costs and pollution
        for i = 1:num_plants
            energy_output = capacity(i) * (1 - FOR(i));
            Cfuel = Cfuel + fuel_cost(i) * energy_output;
            Co_m = Co_m + o_m_cost(i) * capacity(i);
            Cpoll = Cpoll + (pollution_rate(i) * energy_output) * pollution_cost(i);
            pollution(year) = pollution(year) + pollution_rate(i) * energy_output;
        end

        % Calculate ENS and its cost
        if available_capacity < demand
            ENS = demand - available_capacity;
            CENS = Cost_ENSt * ENS;
        else
            ENS = 0; %#ok
        end

        % Calculate total cost
        Ctotal = Cinv + Cfuel + Co_m + CENS + Cred;
        total_cost(year) = Ctotal*(year*inflation);

        % Incorporate demand response
        if demand_response_trigger
            for i = 1:length(eligible_loads)
                if inputArg1(eligible_loads(i)) == 0 
                    Ctotal = Ctotal + omission_penalty(i);
                end
            end
        end
    end

    outputArg1 = mse([sum(total_cost)]);
end