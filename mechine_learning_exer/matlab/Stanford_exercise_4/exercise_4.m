% Newtons Method to implement logistic regression on a classification problem

x=load('ex4x.dat')
y=load('ex4y.dat')
m=length(x)
x=[ones(m,1),x]

pos=find(y==1)
neg = find(y==0)
plot(x(pos,2),x(pos,3),'+')
hold on
plot(x(neg,2),x(neg,3),'o')
hold on
xlabel('Exam 1 score')
ylabel('Exam 2 score')


%define Sigmoid function
g = inline('1.0 ./ (1.0 + exp(-z))')

thred = 10^(-10);
theta = zeros(size(x,2),1);

cnt = 0;
brk = 0;
while(brk~=1)
    %Calculate the hypothesis function
    z = x * theta;
    h = g(z);

    %Calculate gradient and hession
    grad = (1/m).*x'*(h-y);
    H = (1/m).*x'* diag(h) * diag(1-h) * x;
    J(i) = (1/m)*sum(-y.*log(h)-(1-y).*log(1-h),1);
    theta = theta - H\grad; % theta = theta - H^(-1)*grad  is the same
    cnt = cnt + 1;
    if(abs(J(i)-J(i-1))<thred)
        brk = 1;
    end
    
end

% Calculate the probability that a student with score 20 on exam 1 and 
% score 80 on exam 2 will not be admitted
prob = 1- g([1,20,80]*theta);
plot_x = [min(x(:,2))-2,max(x(:,2))+2];
% To find the plot that match theta'*x = 0
plot_y = (-1./theta(3).*(theta(2).*plot_x+theta(1)));
plot(plot_x,plot_y);
legend('Admitted','Not admitted','Decision Boundary');
hold off;

% Plot J
figure;
plot(0:cnt-1,J,'o--','MakerFaceColor','r','MakerSize',8);
xlabel('Iteration');
ylabel('J');