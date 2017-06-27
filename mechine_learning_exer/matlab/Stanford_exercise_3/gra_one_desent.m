function [ theta ] = gra_one_desent(alpha,theta_in,x, y)
%
%   Detailed explanation goes here
m=length(x);
old_theta = theta_in;
k = zeros(1,length(old_theta));
for j=1:length(old_theta)
    for i=1:m
       k(j) = k(j) + (old_theta*x(i,:)'-y(i))*x(i,j);
    end  
end

new_theta = old_theta - alpha*1/m*k;

theta = new_theta;
end

