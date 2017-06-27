function [ theta ] = gra_desent(x, y)
%
%   Detailed explanation goes here
m=length(x);
old_theta = zeros(1,length(x(1,:)));
cnt=0;
bk=0;
while(1)
    cnt=cnt+1;
    k = zeros(1,length(old_theta));
    for j=1:length(old_theta)
        for i=1:m
           k(j) = k(j) + (old_theta*x(i,:)'-y(i))*x(i,j);
        end  
    end

    new_theta = old_theta - 0.07*1/m*k;
    for j=1:length(old_theta)
        if(abs(new_theta(j)-old_theta(j))<10^(-10))
            if(j==length(old_theta))
               bk = 1;
            else
                continue;
            end
        else
            break;
        end
       
    end
    if(bk==1)
       break;
    end
    old_theta = new_theta;
end
theta = new_theta;
end

