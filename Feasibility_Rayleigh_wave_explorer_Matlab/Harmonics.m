function [t,S_1,S_2] = Harmonics(answer);
% Usage [t,S_1,S_2] = Harmonics(answer);

A = str2double(answer);
t = (A(1):A(3):A(2));
S_1 = A(4).*sind(2*pi*A(5).*t-A(6));
S_2 = A(7).*sind(2*pi*A(8).*t-A(9));

