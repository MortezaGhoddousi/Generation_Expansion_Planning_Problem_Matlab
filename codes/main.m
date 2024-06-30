clc; clear; close all;

% Generation Expansion Planning Script

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
    if available_capacity < demand + required_reserve
        % Add new plant (for simplicity, add first plant that meets the criteria)
        for i = 1:num_plants
            if available_capacity + initial_capacity(i) >= demand + required_reserve
                capacity(i) = capacity(i) + initial_capacity(i);
                Cinv = Cinv + inv_cost(i) * initial_capacity(i);
                break;
            end
        end
    end
    
    % Calculate annual costs and pollution
    for i = 1:num_plants
        energy_output = capacity(i) * (1 - FOR(i));
        Cfuel = Cfuel + fuel_cost(i) * energy_output;
        Co_m = Co_m + o_m_cost(i) * capacity(i);
        pollution(year) = pollution(year) + pollution_rate(i) * energy_output;
    end
    
    % Check pollution constraint
    if any(pollution(year) > pollution_limit)
        warning('Pollution limit exceeded in year %d', year);
    end
    
    % Check fuel constraint
    if sum(fuel_usage .* capacity) > fuel_constraint
        warning('Fuel constraint exceeded in year %d', year);
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
    
    % Display annual results
    fprintf('Year %d: Total Cost = $%.2f, Pollution = %.2f units, ENS = %.2f MWh\n', year, Ctotal, pollution(year), ENS);
end

% Plot results
figure;
subplot(3,1,1);
plot(1:num_years, total_cost, '-o');
xlabel('Year');
ylabel('Total Cost ($)');
title('Total Cost over Planning Horizon');

subplot(3,1,2);
plot(1:num_years, pollution, '-o');
xlabel('Year');
ylabel('Pollution (units)');
title('Pollution over Planning Horizon');

subplot(3,1,3);
plot(1:num_years, ENS, '-o');
xlabel('Year');
ylabel('Energy Not Served (MWh)');
title('Energy Not Served over Planning Horizon');