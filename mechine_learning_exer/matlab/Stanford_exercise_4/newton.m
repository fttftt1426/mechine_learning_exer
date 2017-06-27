function [ theta_out ] = newton( x, y )

s = size(x);
theta = zeros(1,s(2));
gradient = zeros(s(2),1);
hessian = zeros(s(2),s(2));
j = 0;
m = s(1);
thred = 10^(-5);
cnt = 0;
g = inline('1.0 ./ (1.0 + exp(-z))');

while((j>=thred)||(j==0))
    for i=1:m
        gradient = gradient + 1/m*(theta*x(i,:)'-y(i))*x(i,:)';
        hessian = hessian + 1/m*g(theta*x(i,:)')*(1-g(theta*x(i,:)'))*x(i,:)'*x(i,:);
    end
    theta = theta' - hessian^(-1)*gradient;
    theta = theta';
    cnt = cnt + 1;
    
    for i=1:m
        j = j + 1/m*(-y(i)*log(hessian)-(1-y(i))*log(1-hessian));
        
    end
end

theta_out = theta;
end

