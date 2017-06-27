% Date : 6.22 2017
% Zhang Rui 

% First exam : Grandient descent to solve linear regression problem
x = load('ex2x.dat')
y = load('ex2y.dat')
plot(x,y,'o')
ylabel('Height in meters')
xlabel('Age in years')
m = length(y)
x=[ones(m,1),x]
theta = gra_desent(x,y)
hold on
plot(x(:,2),x*theta','-')
legend('Training data','Linear regression')

% Secend exam : the curve of cost function
J_vals = zero(100,100)
theta0_vals = linspace(-3,3,100)
theta1_vals = linspace(-1,1,100)
for i= 1:length(theta0_vals)
    for j=1:length(theta1_vals)
        t=[theta0_vals(i),theta1_vals(j)];
        J_vals(i,j)=cost_func(t(1),t(2),x,y);
    end
end
J_vals = J_vals'
figure
surf(theta0_vals,theta1_vals,J_vals)
xlabel('\theta_0')
ylabel('\theta_1')
