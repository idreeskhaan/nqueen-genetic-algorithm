
function y= fitness_fcn(x)

y=0; %initial/best fitness score
%diagonal attacks
 for i=1:length(x)
     for j=1:length(x)
         row_diff= abs(i-j); 
         col_diff= abs(x(i)-x(j));
         if row_diff == col_diff & i~=j
            y=y+1; %penalize the fitness fcn
         end
          
     end    
 end

%column attacks
  for i=1:length(x)
     for j=1:length(x)
         if x(i)== x(j) & i~=j
            y=y+1; %penalize the fitness fcn
         end
          
     end    
 end
 
end