

l2=0.50;
l3=1.50;
p=0.50;
alpha= deg2rad(0);


theta2= linspace(0,2*pi,100);
theta3= asin(-l2/l3*sin(theta2));
px= l2*cos(theta2)+ p*cos(alpha-theta3);
py= l2*sin(theta2)+ p*sin(alpha-theta3);

plot(px,py)


% syms theta2;
% theta3= asin(-l2/l3*sin(theta2));
% px= l2*cos(theta2)+ p*cos(alpha-theta3);
% py= l2*sin(theta2)+ p*sin(alpha-theta3);