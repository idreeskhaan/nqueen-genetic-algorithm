


clc;
close all;

problem.solver= 'ga';
problem.options= optimoptions('ga');
problem.fitnessfcn= @(x)fcn(x);
problem.nvars= 8;
problem.lb= [0 0 0 0 0 0 0 0];
problem.ub= [7 7 7 7 7 7 7 7];

[x, fval]= ga(problem);


