clear; clc
%% this is simulation to the BZ Oscillation
%%%%param of the velocity
%k_o, k_t , k_tt , k_f, k_fi =0;
%C_BrO2,C_BrO3, C_Br = 0;
%%%%not using in this program


C_Bro_t = 20;
tau = [0;600];
y = [C_Bro_t;C_Bro_t;C_Bro_t^2];

[tt,yy] = ode45(@bzocisolver,tau,y);
plot(tt,log(yy(:,2)),'-','linewidth',1.2)
xlabel('t/s','fontsize',12)
ylabel('lgy能斯特电势','fontsize',12)
title(sprintf('通过orgontor机理matlab模拟振荡图C_{BrO_2^-}'));
hold on;



