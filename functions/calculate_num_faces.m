% This function calculates the number of faces
% each grain has, given its neighbor information
% (adjacency matrix)

function [num_faces] = calculate_num_faces(grain_map, adjacency)
 
    % Count num faces as sum of each row in adjacency matrix
    num_grains = length(unique(grain_map));
    num_faces = zeros(num_grains,1);
    
    for i = 1:num_grains
        num_faces(i) = sum(adjacency(:,i)) - 1;
    end
end