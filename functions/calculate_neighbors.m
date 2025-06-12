% This function calculates the neighbor information, 
% organized in an adjacency matrix

function [adjacency_matrix] = calculate_neighbors(array)
    disp("Calculating neighbor adjacency...")
    XD = 1;
    Nx = size(array,1);
    Ny = size(array,2);
    Nz = size(array,3);

    gid_list = unique(array);
    
    adjacency_matrix = zeros(length(gid_list));

    % Pick a GID
    for N = 1:length(gid_list)
    
        % Get list of coords this GID occupies
        [ind_x, ind_y, ind_z] = ind2sub(size(array), find(array == gid_list(N)));
        
        % Get minimum and maximum indices for each direction
        min_index_x = min(ind_x);
        max_index_x = max(ind_x);
        
        min_index_y = min(ind_y);
        max_index_y = max(ind_y);
        
        min_index_z = min(ind_z);
        max_index_z = max(ind_z);
        
        B = array(max(1,min_index_x - (XD+1)):min(Nx,max_index_x + (XD+1)), max(1,min_index_y - (XD+1)):min(Ny,max_index_y + (XD+1)), max(1,min_index_z - (XD+1)):min(Nz,max_index_z + (XD+1)));
        
        % Get list of grains within this subvolume
        gid_list_subV = unique(B);
        
        % Extract the grain
        C = (B == gid_list(N));
        
        % Dilate the grain by XD pixels
        D = imdilate(C,strel('sphere',XD));
        
        % Add the dilated grain to the subvolume
        E = D.*B;
        
        % Subtract
        overlap_list = unique(E);
        overlap_list = overlap_list(2:end);
    
        % Use the overlap list to update the adjacency matrix
        for i = 1:size(overlap_list)
            %adjacency_matrix(1,find(gid_list == overlap_list(i))) = 1; % Include this line for an outerregion=1
            adjacency_matrix(N,find(gid_list == overlap_list(i))) = 1;
        end
    end 
end

