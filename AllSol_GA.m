
clc;

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
pc= 0.92; %Crossover Rate
pm= 0.06; %Mutation Rate
best_fitness = 0;


X= zeros(92,8); %solutions array
flag=1;

for k=1:450

pc= 0.75+ 0.20*rand();
pm= 0.05 + 0.01*rand();
% pc= 0.7895;
% pm=0.05;
    
%% Set Options for GA Optimizer
options = optimoptions('ga');
options = optimoptions(options,'PopulationSize', N);
options = optimoptions(options,'CrossoverFraction', pc);
options = optimoptions(options,'MaxGenerations', max_gen);
options = optimoptions(options,'MaxStallGenerations', max_stall_gen);
options = optimoptions(options,'CreationFcn', @gacreationuniform); 
options = optimoptions(options,'CrossoverFcn', @crossovertwopoint); %select two point crossover
options = optimoptions(options,'MutationFcn', {  @mutationuniform pm }); %select unifrom muatation
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'PlotFcn', { @gaplotbestf });
%options = optimoptions(options,'OutputFcn', { @outFcn });
options = optimoptions(options,'FitnessLimit', best_fitness);

%% Run Optimizer 

[x, fval]= ga(@(x)fitness_fcn(x),nvars,[],[],[],[],lb,ub,[],intcon,options);

if fval==0 
    if flag==1
        X(flag,:)= x;
        flag=flag+1;
    end
    if flag>1
       if sum(X(flag-1,:)==x)~=8
           X(flag,:)= x;
           flag=flag+1;
       end
        
    end
end

end

%% Save solution
%find unique Solutions 
C= unique(X, 'rows');
save('Unique_sol.mat','C'); %saves All solutions to a File
disp(C);

