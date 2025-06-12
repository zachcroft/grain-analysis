% This function calculates the average number of faces
% that the neighbors of a grain has (which is needed
% for validating the Aboav-Weaire law)

function num_neighbor_faces = calculate_neighbor_faces(num_faces,adjacency_matrix)
    
    N = length(num_faces);
    num_neighbor_faces = zeros(N,1);

    % Loop over rows of adjacency matrix
    for i = 1:N
        
        % Get list of neighbor indices (col. equal to 1)
        indices = find(adjacency_matrix(i,:) == 1);

        % Remove self from list
        indices(indices == i) = [];

        % Count number of neighbors
        num_neighbors = length(indices);

        % Calculate mean num. of faces of neighbors
        sum = 0;
        for j = 1:num_neighbors
            sum = sum + num_faces(indices(j));
        end
        sum = sum / num_neighbors;

        % Store in array
        num_neighbor_faces(i) = sum;
        
    end

end