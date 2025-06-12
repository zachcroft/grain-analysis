% This function plots the grain size distribution (GSD)
% given a list of grain radii and the number of bins

function plot_R_vs_num_faces(radii, num_faces)

    figure
    plot(radii, num_faces,'o')

    title("Face distribution")
    xlabel("Radius")
    ylabel("Number of faces")
    set(gca,'FontSize',16)
    grid on

end