clc;
clear;
Y=[50 74 119 152 68 44; 
   69 69 97 142 152 83];
t=Y(:,1);
X0=Y(:,2);
Xi=Y(:,3);
Xj1=Y(:,4);
Xj2=Y(:,5);
% % 时间序列图
% plot(t,X0,t,Xi)%图1
% plot(t,X0,t,Xi,t,Xj)%图2
% plot(t,X0,t,Xi,t,Xj1,t,Xj2)%图3
% % 三维空间散点图
% z0=[0 0];
% z1=[1 1];
% scatter3(z0,t,X0)
% hold on
% scatter3(z1,t,Xi)


% 面板数据图
%X0与Xi四面体单元
XXX=[2.1 1.8; 2.6 1.2];
mesh(XXX)
hold on
%X0与Xj四面体单元
YYY=[2.1 2; 2.6 1]
mesh(YYY)


