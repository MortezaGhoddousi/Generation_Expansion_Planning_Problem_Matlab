function [] = showRes(x)
for year = 1:10
    for plant = 1:3
        if x((year-1)*3 + plant) == 1
          
            disp (['New plant has been created in ', num2str(year), 'th year and type of it is ', num2str(plant)])
        end
    end
end
end