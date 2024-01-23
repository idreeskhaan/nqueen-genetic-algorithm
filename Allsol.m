


%retrieve the genration data
X= GenData.Population;  %size= (N, 8, max_gen)
temp = size(X);

flag=1;
best_sol=[];
for i=1:temp(3)
   
   for j=1:temp(1)
       
       yi=fitness_fcn(X(j,:,i));
       if yi==0  && flag==1 
          best_sol(flag,:)= X(j,:,i);
          flag=flag+1;
       end
       
       if (yi==0 && flag>1)
             if (best_sol(flag-1,:)~=X(j,:,i))
                 best_sol(flag,:)= X(j,:,i);
                 flag=flag+1;
             end
       end
   end
    
end

disp("All solutions")
disp(best_sol)

