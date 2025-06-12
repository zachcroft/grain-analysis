% This function plots the grain size distribution (GSD)
% given a list of grain radii and the number of bins

function plot_GSD(radii, num_bins)

    histogram(radii, num_bins)

    title("Grain Size Distribution")
    xlabel("Radius")
    ylabel("Counts")
    set(gca,'FontSize',16)
    grid on

end