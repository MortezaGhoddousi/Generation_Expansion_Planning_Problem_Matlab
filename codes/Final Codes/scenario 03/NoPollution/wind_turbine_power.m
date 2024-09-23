function power_output = wind_turbine_power(wind_speed)

cut_in_speed = 5;
rated_speed = 15;
cut_out_speed = 25;
rated_power = 90; 

if wind_speed < cut_in_speed
    power_output = 0;
elseif wind_speed <= rated_speed
    power_output = rated_power * (wind_speed - cut_in_speed) / (rated_speed - cut_in_speed);
elseif wind_speed <= cut_out_speed
    power_output = rated_power;
else
    power_output = 0;
end
end