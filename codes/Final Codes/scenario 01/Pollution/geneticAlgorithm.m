clc; clear; close all;

intcon = 1;
rng default % For reproducibility
fun = @objectiveFunction;
A = [];
b = [];
Aeq = [];
beq = [];
lb = [zeros(1, 50)];
ub = [ones(1, 50)];
nonlcon = [];
options = optimoptions('ga','PlotFcn', @gaplotbestf, 'MaxGenerations', 70);
x = ga(fun,50,A,b,Aeq,beq,lb,ub,nonlcon,intcon, options);

inputArg1 = x;
for i = 1:numel(inputArg1)
    if inputArg1(i) < 0.5
        inputArg1(i) = 0;
    else
        inputArg1(i) = 1;
    end
end
% showRes(inputArg1)

res = reshape(inputArg1, 5, 10);
disp (res')

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
reserve_percentage = 15; % Reserve percentage
LOLP_max = 0.1; % Maximum acceptable LOLP

% Define demand response parameters
eligible_loads = [1, 2, 3, 4, 5]; % Example of eligible loads
omission_penalty = [100, 80, 120, 110, 130]; % Penalty for omitting eligible loads
demand_response_trigger = 1; % Trigger for demand response (1 if activated, 0 otherwise)

% Initialize variables
capacity = initial_capacity;
demand = initial_demand;
total_cost = zeros(1, num_years);
pollution = zeros(1, num_years);

% Define constraints
fuel_constraint = 10000; % Maximum fuel usage (units)
fuel_usage = [0.8, 0.9, 0.7, 0.6, 0.8]; % Fuel usage (units/MWh)
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
    Cpoll = 0;

    % Determine if new capacity is needed
    [capacity, Cinv] = cons(year, capacity, Cinv, inputArg1, initial_capacity, inv_cost, demand, true);

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
        ENS(year) = demand - available_capacity; %#ok
        CENS = Cost_ENSt * ENS(year);
    else
        ENS(year) = 0; %#ok
    end

    % Calculate total cost
    Ctotal = Cinv + Cfuel + Co_m + CENS + Cpoll;
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


% Plot results
figure;
plot(1:num_years, total_cost, '-o');
xlabel('Year');
ylabel('Total Cost ($)');
title('Total Cost over Planning Horizon');

figure;
plot(1:num_years, pollution, '-o');
xlabel('Year');
ylabel('Pollution (units)');
title('Pollution over Planning Horizon');

figure;
plot(1:num_years, ENS, '-o');
xlabel('Year');
ylabel('Energy Not Served (MWh)');
title('Energy Not Served over Planning Horizon');
