function [x,fval,exitflag,output,population,score] = generate_code(nvars,lb,ub,intcon,PopulationSize_Data,CrossoverFraction_Data,MaxGenerations_Data,MaxStallGenerations_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'PopulationSize', PopulationSize_Data);
options = optimoptions(options,'CrossoverFraction', CrossoverFraction_Data);
options = optimoptions(options,'MaxGenerations', MaxGenerations_Data);
options = optimoptions(options,'MaxStallGenerations', MaxStallGenerations_Data);
options = optimoptions(options,'CreationFcn', @gacreationuniform);
options = optimoptions(options,'CrossoverFcn', @crossovertwopoint);
options = optimoptions(options,'MutationFcn', {  @mutationuniform 0.01 });
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'PlotFcn', { @gaplotbestf });
options = optimoptions(options,'OutputFcn', { @outFcn });
[x,fval,exitflag,output,population,score] = ...
ga(@(x)fitness_fcn(x),nvars,[],[],[],[],lb,ub,[],intcon,options);
