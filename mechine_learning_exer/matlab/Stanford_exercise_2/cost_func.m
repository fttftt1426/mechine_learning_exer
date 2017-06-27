function [ j_out ] = cost_func( theta1, theta2, x, y)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
m = length(y);
k = 0;
for i=1:m
   k = k + ([theta1,theta2]*x(i,:)'-y(i))^2;
end

j_out = (1/(2*m))*k;

end


