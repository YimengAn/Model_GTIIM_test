%  程序名称: 最大最小关联度序列VS图 
%  程序功能: 考察地区序列与最大序列的时间序列趋势 (第一列为最大值 后面城市序号需要+1) 
%  数据输入：各数组序列
%  结果输出：图像

%% 输入对比模型个数
M=2

%% 输入数据组（第一行为 MAX序列）
data=xlsread('G:\我的论文\四面体关联模型\实例数值计算MATLAB程序\topsis长三角19-20(原始数据勿改动).xls',1,'C2:Z29'); % 长三角27市
[m,n]=size(data); % m=m1+1，n=n1

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  mymodel  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
group1=[data(1,:);data(5,:)]; % MAX and \Gamma_{max}
group2=[data(1,:);data(19,:)]; % MAX and \Gamma_{min}

subplot(M,2,1)
plot(group1')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order1.CZ')
title('(a) \Gamma_{max}=0.8131')

subplot(M,2,2)
plot(group2')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order27.ZS');
title('(b) \Gamma_{min}=0.2185');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GDTEP model  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 考察地区序列与最大序列的时间序列趋势 (第一列为最大值 后面城市序号需要+1) 
group3=[data(1,:);data(21,:)]; % MAX and \Gamma_{max}
group4=[data(1,:);data(20,:)]; % MAX and \Gamma_{min}

subplot(M,2,3)
plot(group3')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order1.HF')
title('(a) \Gamma_{max}=0.8195')

subplot(M,2,4)
plot(group4')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order27.T2Z');
title('(b) \Gamma_{min}=0.3651');