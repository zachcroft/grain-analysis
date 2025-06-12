% This functions calculates the grain volumes by counting
% voxels, and also the equivalent radii by applying 
% R = ((3V)/(4pi))^(1/3)

function [volumes,radii] = calculate_grain_size(grain_map)


    disp(size(grain_map))


    gid_list = unique(grain_map);
    num_grains = length(gid_list);
    volumes = zeros(num_grains,1);

    for i = 1:num_grains
        grain = (grain_map == gid_list(i));

        V = sum(grain,'all');

        volumes(i) = V;
    end

    radii = ((3.*volumes)./(4*pi)).^(1/3);

end