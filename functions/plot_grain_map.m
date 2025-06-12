% This function plots the microstructure as a 
% three-slice

function plot_grain_map(grain_map)

    figure

    % Plotting a 3 slice
    x_slice = 1;
    y_slice = 1;
    z_slice = size(grain_map,1);
    h = slice(grain_map, x_slice, [],[]);
    set(h, 'EdgeColor', 'none');
    hold on
    g = slice(grain_map, [], y_slice,[]);
    set(g, 'EdgeColor', 'none');
    i = slice(grain_map, [], [],z_slice);
    set(i, 'EdgeColor', 'none');

    [rows, cols, ~] = size(grain_map); % Size of the data
      
    
    % Draw top borders
    z_value = size(grain_map,1);
    xCorners = [1, cols, cols, 1];
    yCorners = [1, 1, rows, rows]; 
    zCorners = [z_value, z_value, z_value, z_value];
    patch(xCorners, yCorners, zCorners, 'k', 'FaceAlpha', 0, 'linewidth', 2); 

    % Draw right borders
    y_value = 1;  % Desired y-value (elevated)
    xCorners = [1, cols, cols, 1];  % X coordinates of rectangle corners
    zCorners = [1, 1, rows, rows];  % Z coordinates of rectangle corners
    yCorners = [y_value, y_value, y_value, y_value];
    patch(xCorners, yCorners, zCorners, 'k', 'FaceAlpha', 0, 'linewidth', 2); 

    % Draw left borders
    x_value = 1;  % Desired y-value (elevated)
    zCorners = [1, cols, cols, 1];  % X coordinates of rectangle corners
    xCorners = [1, 1, rows, rows];  % Z coordinates of rectangle corners
    yCorners = [x_value, x_value, x_value, x_value];
    patch(yCorners, xCorners, zCorners, 'k', 'FaceAlpha', 0, 'linewidth', 2); 
    
    view(3); axis off;
    camproj('perspective');

    %clim([0 3500]); colormap(cmap)
    cmap = RdBu(256);
    colormap(cmap)
    hold off

    xlim([-1 size(grain_map,1);])
    ylim([-1 size(grain_map,1);])
    zlim([-1 size(grain_map,1);])
    grid on
    axis equal

    %set(gcf,"Position",[300 300 500 500])
    drawnow

end