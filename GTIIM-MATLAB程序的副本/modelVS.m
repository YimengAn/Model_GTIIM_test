%  ��������: �����С����������VSͼ 
%  ������: �������������������е�ʱ���������� (��һ��Ϊ���ֵ ������������Ҫ+1) 
%  �������룺����������
%  ��������ͼ��

%% ����Ա�ģ�͸���
M=2

%% ���������飨��һ��Ϊ MAX���У�
data=xlsread('G:\�ҵ�����\���������ģ��\ʵ����ֵ����MATLAB����\topsis������19-20(ԭʼ������Ķ�).xls',1,'C2:Z29'); % ������27��
[m,n]=size(data); % m=m1+1��n=n1

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
% �������������������е�ʱ���������� (��һ��Ϊ���ֵ ������������Ҫ+1) 
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