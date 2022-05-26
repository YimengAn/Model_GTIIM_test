%  ������: ��ȡ�������ʱ���������Աȷ���
clc;
clear all;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Time series �������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ѡ����Ⱦ��
z = 28;
sheetNames = sheetnames("AQI.xls") 
% ����table, z=sheet number;
data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
data = data{:,:} % table ת matrix
[m,n]=size(data); % m1=����/ָ�������n1=ʱ�䳤�ȣ�

%% �Զ���ɸѡ�������Ա�
group = data([1,1+2,1+4,1+22,1+25],:); 
plot(group')

%% ģ�ͽ���Ա�
subplot(3,2,1)
group1 = [data(1,:);data(1+4,:)];
plot(group1')
axis([0,n+1,min(min(data))-5,max(max(data))+5])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('Negative ideal series','CZ')
title('\bf{(a) the city with maximum degree in GTCIM.}','FontSize',16)

subplot(3,2,2)
group2 = [data(1,:);data(1+25,:)];
plot(group2')
axis([0,n+1,min(min(data))-5,max(max(data))+5])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('Negative ideal series','CuZ')
title('\bf{(b) the city with maximum degree in HGDIM.}','FontSize',16)

subplot(3,2,3)
group3 = [data(1,:);data(1+25,:)];
plot(group3')
axis([0,n+1,min(min(data))-5,max(max(data))+5])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('Negative ideal series','CuZ')
title('\bf{(c) the city with maximum degree in SGIM}','FontSize',16')

subplot(3,2,4)
group4 = [data(1,:);data(1+22,:)];
plot(group4')
axis([0,n+1,min(min(data))-5,max(max(data))+5])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('Negative ideal series','MS')
title('\bf{(d) the city with maximum degree in CSM(\eta =1)}','FontSize',16)

subplot(3,2,5)
group5 = [data(1,:);data(1+22,:)];
plot(group5')
axis([0,n+1,min(min(data))-5,max(max(data))+5])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('Negative ideal series','MS')
title('\bf{(e) the city with maximum degree in CSM(\eta =0.5)}','FontSize',16)

subplot(3,2,6)
group6 = [data(1,:);data(1+2,:)];
plot(group6')
axis([0,n+1,min(min(data))-5,max(max(data))+5])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('Negative ideal series','NJ')
title('\bf{(f) the city with maximum degree in CSM(\eta =0)}','FontSize',16)


% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Heatmap   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% ��������
% sheetNames = sheetnames("heatmap.xls") 
% %% ��ͼ
% g = 7; % sheet number
% subplot(2,2,4)
% data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{g},"Range","B3:AC26"); 
% data = data{:,:} % table ת matrix
% 
% % ��������ͼ
% h = heatmap(data);  
% h.Colormap = flipud(pink);  % ɫ����ɫ��%bone %jet %parula %flipud(pink) ��תpink��ɫ��
% 
% % ��������
% % h.XLabel = 'Cities';
% h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
% h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% % ���ݱ�ǩ���ı���ɫ
% h.CellLabelColor = 'w'; % none�� autoĬ�� w��ɫ
% % ������
% h.GridVisible = 'off'; % on/off
% % ����
% h.Title = '\bf{(d) The heatmap of AQI pollutant}';
% h.FontSize = 16; 
