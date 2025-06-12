% This function plots the grain size distribution (GSD)
% given a list of grain radii and the number of bins

function plot_AboavWeaire(num_faces, num_neighbor_faces)
    
    figure
    sms = num_faces.*num_neighbor_faces;
    plot(num_faces,sms,'.','MarkerSize',20)
    title("Aboav-Weaire law")
    xlabel('s')
    ylabel('sm_{s}')
    set(gca,'FontSize',20)
    grid on

    % Fit a line to the data
    hold on
    p = polyfit(num_faces, sms, 1); % p(1) is the slope, p(2) is the intercept
    x_fit = linspace(min(num_faces), max(num_faces), 100);
    y_fit = polyval(p, x_fit); % Calculate y values using the fitted polynomial
    plot(x_fit, y_fit, 'r-', 'LineWidth', 2);
    slope = p(1);
    intercept = p(2);
    text_str = sprintf('Slope: %.2f\nIntercept: %.2f', slope, intercept);
    text(20, 40, text_str, 'FontSize', 16, 'Color', 'k');

end