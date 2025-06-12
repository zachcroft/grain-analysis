% This script shows example usage of the analysis
% functions in the repository
clear all; close all;
addpath('functions')
addpath('microstructures')


% Load an example microstructure
load("128x128x128_128grains.mat")


[volumes, radii] = calculate_grain_size(data);
plot_GSD(radii, 14);
neighbors = calculate_neighbors(data);
num_faces = calculate_num_faces(data, neighbors);
plot_R_vs_num_faces(radii, num_faces);
plot_grain_map(data);

num_neighbor_faces = calculate_neighbor_faces(num_faces,neighbors);
plot_AboavWeaire(num_faces, num_neighbor_faces)

plot_face_distribution(num_faces,20)