% This function plots the face distribution,
% i.e., the frequency of number of faces. The
% distribution should be log normal

function plot_face_distribution(num_faces, num_bins)

    figure
    histogram(num_faces, num_bins)

    title("Face Distribution")
    xlabel("Number of faces")
    ylabel("Counts")
    set(gca,'FontSize',16)
    grid on

end