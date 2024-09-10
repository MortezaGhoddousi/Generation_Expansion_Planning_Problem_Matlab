clc; clear; close all;

intcon = 1;
rng default % For reproducibility
fun = @objectiveFunction;
A = [];
b = [];
Aeq = [];
beq = [];
lb = [zeros(1, 30)];
ub = [ones(1, 30)];
nonlcon = [];
options = optimoptions('ga','PlotFcn', @gaplotbestf, 'MaxGenerations', 50);
x = ga(fun,30,A,b,Aeq,beq,lb,ub,nonlcon,intcon, options);

inputArg1 = x;
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
demand_growth = 0.1; % Annual demand growth rate
initial_demand = 500; % Initial demand (MW)
pollution_rate = [0.5, 0.7, 0.4]; % Pollution rate per plant (units/MWh)
FOR = [0.05, 0.08, 0.06]; % Forced outage rate
reserve_percentage = 15; % Reserve percentage
LOLP_max = 0.1; % Maximum acceptable LOLP
Cost_ENSt = 10000; % Cost of energy not served (R/MWh)

% Define demand response parameters
eligible_loads = [1, 2, 3]; % Example of eligible loads
omission_penalty = [100, 80, 120]; % Penalty for omitting eligible loads
demand_response_trigger = 1; % Trigger for demand response (1 if activated, 0 otherwise)

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
    [capacity, Cinv] = cons(year, capacity, Cinv, inputArg1, initial_capacity, inv_cost);

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
