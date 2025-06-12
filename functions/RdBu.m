% A function to use the RdBu colormap that is used in VisIt and 
% Paraview. The input parameter m is the number of values in the 
% colormap (I suggest setting it to 256)
% - Zach Croft
function c = RdBu(m)
  % Define the positions and color values (RGBA) from the XML data
  positions = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
  colors = [
      103 0 31 255;       % 103, 0, 31, 255
      178 24 43 255;      % 178, 24, 43, 255
      214 96 77 255;      % 214, 96, 77, 255
      244 165 130 255;    % 244, 165, 130, 255
      253 219 199 255;    % 253, 219, 199, 255
      247 247 247 255;    % 247, 247, 247, 255
      209 229 240 255;    % 209, 229, 240, 255
      146 197 222 255;    % 146, 197, 222, 255
      67 147 195 255;     % 67, 147, 195, 255
      33 102 172 255;     % 33, 102, 172, 255
      5 48 97 255         % 5, 48, 97, 255
  ];
  
  % Normalize the RGBA values to [0, 1]
  normalized_colors = colors(:, 1:3) / 255; % Only RGB, normalize to [0, 1]
  alpha_values = colors(:, 4) / 255; % Normalize the alpha channel (opacity)
  
  % Create an empty colormap of size 256 (or any other size you prefer)
  colormap_size = m;
  colormap_matrix = zeros(colormap_size, 3); % Only RGB channels
  
  % Create the colormap matrix
  current_row = 1;
  for i = 1:length(positions)-1
      % Interpolation range
      start_pos = positions(i);
      end_pos = positions(i+1);
      
      % Number of rows to interpolate between these two control points
      num_points = round((end_pos - start_pos) * colormap_size);
      num_points = max(1, num_points); % Ensure at least 1 point
      
      % Interpolate RGB values
      r_interp = linspace(normalized_colors(i, 1), normalized_colors(i+1, 1), num_points);
      g_interp = linspace(normalized_colors(i, 2), normalized_colors(i+1, 2), num_points);
      b_interp = linspace(normalized_colors(i, 3), normalized_colors(i+1, 3), num_points);
      
      % Assign the interpolated values to the colormap matrix
      colormap_matrix(current_row:current_row+num_points-1, :) = [r_interp', g_interp', b_interp'];
      
      % Update the current row pointer
      current_row = current_row + num_points;
  end
  
  % Ensure the colormap matrix has exactly the right size (in case of rounding errors)
  c = colormap_matrix(1:colormap_size, :);
end
