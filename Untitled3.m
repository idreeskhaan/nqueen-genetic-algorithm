
clc;
clear all;

% Name: Muhammad Idrees
% ID: 100850191

%% Input Paramters to the GA Optimizer
nvars= 8;
lb= [0 0 0 0 0 0 0 0]; %lower bounds
ub= [7 7 7 7 7 7 7 7]; %upper bounds
intcon= [1 2 3 4 5 6 7 8]; %applied since all values should be integers
N= 80; %population size
max_gen= 250; %max generations
max_stall_gen= 250; %max stall generations
pc= 0.80; %Crossover Rate
pm= 0.05; %Mutation Rate

%% GA Options Settings
options = optimoptions('ga');
options = optimoptions(options,'PopulationSize', N);
options = optimoptions(options,'CrossoverFraction', pc);
options = optimoptions(options,'MaxGenerations', max_gen);
options = optimoptions(options,'MaxStallGenerations', max_stall_gen);
options = optimoptions(options,'CreationFcn', @gacreationuniform);
options = optimoptions(options,'CrossoverFcn', @crossovertwopoint);
options = optimoptions(options,'MutationFcn', {  @mutationuniform pm });
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'PlotFcn', { @gaplotbestf });

%% Run Optimizer 

[x, fval]= ga(@(x)fitness_fcn(x),nvars,[],[],[],[],lb,ub,[],intcon,options);

%% Display Solution
disp("Best Solution: " + num2str(x))
disp("Fitness Value: " + num2str(fval))



