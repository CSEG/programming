function [t_k,S_1,S_2,Dt,A] = Harmonics_t(answer);
% Usage [t_k,S_1,S_2,Dt,A] = Harmonics_t(answer);

A = str2double(answer);
t = (A(1):A(3):A(2))';
Interv = A(10);
Dt = (A(1):Interv:A(2))';

S_1 = zeros(length(t),length(Dt));
S_2 = S_1;
t_k = S_2;

for k = 0:length(Dt)-1
    t_k(:,k+1) = t+Dt(k+1);
    S_1(:,k+1) = A(4).*sind(2*pi*A(5).*(t_k(:,k+1))-A(6));
    S_2(:,k+1) = A(7).*sind(2*pi*A(8).*(t_k(:,k+1))-A(9));
end
