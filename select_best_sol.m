



clc;
X= GenData.x;
temp= size(X);
fileID = fopen('bestSol.txt','w');
for i=1:temp(1)
    
   y= fitness_fcn(X(i,:))
   
   if(y<=16)
       fprintf(fileID,X(i,:));
   end
    
end
fclose(fileID);



