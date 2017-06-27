function [ j_out ] = cost_func( theta, x, y)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
m = length(y);
j_out = 1/(2*m)*(x*theta-y)'*(x*theta-y);


end