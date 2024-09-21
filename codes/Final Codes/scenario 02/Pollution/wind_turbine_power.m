function power_output = wind_turbine_power(wind_speed)
% Replace these values with the actual cut-in, rated, and cut-out speeds from the image
cut_in_speed = 5;
rated_speed = 15;
cut_out_speed = 25;
rated_power = 1000; % Replace with the rated power from the image

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