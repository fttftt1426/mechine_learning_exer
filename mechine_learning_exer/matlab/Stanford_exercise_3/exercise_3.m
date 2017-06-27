%Change the theta to scan the difference of the wave

x=load('ex3x.dat');
y=load('ex3y.dat');
m=length(x);
x=[ones(m,1),x];
sigma=std(x);
mu=mean(x);
x(:,2)=(x(:,2)-mu(2))./sigma(2);
x(:,3)=(x(:,3)-mu(3))./sigma(3);
std(x);
mean(x);

% while alpha = 0.1 , J1 = **
theta = zeros(size(x(1,:)))';
alpha = 0.1; %decide by you! 0.01 0.03 0.1 0.3 1.3
J1 =zeros(50,1);
for num=1:50
    J1(num)=cost_func(theta,x,y);
    theta = (gra_one_desent(alpha,theta',x,y))';
end


% while alpha = 0.3 , J2 = **
theta = zeros(size(x(1,:)))';
alpha = 0.3; %decide by you! 0.01 0.03 0.1 0.3 1.3
J2 =zeros(50,1);
for num=1:50
    J2(num)=cost_func(theta,x,y);
    theta = (gra_one_desent(alpha,theta',x,y))';
end


% while alpha = 0.01 , J3 = **
theta = zeros(size(x(1,:)))';
alpha = 0.01; %decide by you! 0.01 0.03 0.1 0.3 1.3
J3 =zeros(50,1);
for num=1:50
    J3(num)=cost_func(theta,x,y);
    theta = (gra_one_desent(alpha,theta',x,y))';
end

% while alpha = 0.03 , J4 = **
theta = zeros(size(x(1,:)))';
alpha = 0.03; %decide by you! 0.01 0.03 0.1 0.3 1.3
J4 =zeros(50,1);
for num=1:50
    J4(num)=cost_func(theta,x,y);
    theta = (gra_one_desent(alpha,theta',x,y))';
end

% while alpha = 1.3 , J5 = **
theta = zeros(size(x(1,:)))';
alpha = 1.3; %decide by you! 0.01 0.03 0.1 0.3 1.3
J5 =zeros(50,1);
for num=1:50
    J5(num)=cost_func(theta,x,y);
    theta = (gra_one_desent(alpha,theta',x,y))';
end

% while alpha = 1 , J6 = **
theta = zeros(size(x(1,:)))';
alpha = 1; %decide by you! 0.01 0.03 0.1 0.3 1.3
J6 =zeros(50,1);
for num=1:50
    J6(num)=cost_func(theta,x,y);
    theta = (gra_one_desent(alpha,theta',x,y))';
end

% while alpha = 1.4 , J7 = **
theta = zeros(size(x(1,:)))';
alpha = 1.4; %decide by you! 0.01 0.03 0.1 0.3 1.3
J7 =zeros(50,1);
for num=1:50
    J7(num)=cost_func(theta,x,y);
    theta = (gra_one_desent(alpha,theta',x,y))';
end




figure;
xlabel('Number of iteration');
plot(0:49,J1(1:50),'b-');
hold on;
plot(0:49,J2(1:50),'r-');
plot(0:49,J3(1:50),'k--');
plot(0:49,J4(1:50),'b--');
plot(0:49,J5(1:50),'r--');
plot(0:49,J6(1:50),'k--');

%plot(0:49,J7(1:50),'-.');  %alpha=1.4
ylabel('Cost J');
legend('0.1','0.3','0.01','0.03','1.3','1');



% Normal equation
theta = (x'*x)^(-1)*x'*y;         %The result is the same as grandient descent

