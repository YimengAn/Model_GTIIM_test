%  ��������: TCGRmodel����ɫͶ���������ۺϹ���ģ�ͣ�
%  ������: ����ԭʼ���ݾ�������ͼ
%  �������룺����������
%  ������������ͼ
clc,clear all;
format short g;



%% �������ԭʼ���ݾ���ע�⣺ʱ������Ϊ��������
sheetNames = sheetnames("AQI.xls");
data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{1},"Range","C2:Z29"); % ����table
data_original=data{2:28,:}; % table ת matrix
% data_original=[];
[m1,n1]=size(data_original); % m1=����/ָ�������n1=ʱ�䳤�ȣ�

%% ��ͼ

% % 1 �������ʱ
% plot(data_original)
% axis([0,m1+1,min(min(data_original))-5,max(max(data_original))+5])
% legend('�Ͼ�','����','����','����','��ͨ','��Ǩ','����','����','�γ�','����','̩��','��','���Ƹ�')


% 2 ����϶�ʱ�������ͼ
group1=data_original(1,:); % �Ϻ���
group2=data_original(2:10,:); % ����ʡ
group3=data_original(11:19,:); % �㽭ʡ
group4=data_original(20:27,:); % ����ʡ

subplot(2,2,1)
plot(group1)
axis([1,n1,min(min(data_original))-5,max(max(data_original))+5])
set(gca,'xtick',1:1:n1)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});

legend('SH','location','north')
%legend boxoff;
title('\bf{(a) AQI time series of Shanghai}','FontSize',16);
% legend('�Ϻ�')
% title('�Ϻ���AQIָ������')

subplot(2,2,2)
plot(group2')
axis([1,n1,min(min(data_original))-5,max(max(data_original))+5])
set(gca,'xtick',1:1:n1)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','location','north','NumColumns',5);
%legend boxoff;
title('\bf{(b) AQI time series of cities in Jiangsu Province}','FontSize',16);
% legend('�Ͼ�','����','����','����','��ͨ','�γ�','����','��','̩��')
% title('����ʡ����AQIָ������')

subplot(2,2,3);
plot(group3');
axis([1,n1,min(min(data_original))-5,max(max(data_original))+5]);
set(gca,'xtick',1:1:n1);
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','location','north','NumColumns',5);
%legend boxoff;
title('\bf{(c) AQI time series of cities in Zhejiang Province}','FontSize',16)
% legend('����','����','����','����','����','����','��','��ɽ','̨��')
% title('�㽭ʡ����AQIָ������')

subplot(2,2,4);
plot(group4');
axis([1,n1,min(min(data_original))-5,max(max(data_original))+5]);
set(gca,'xtick',1:1:n1);
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
title('\bf{(d) AQI time series of cities in Anhui Province}','FontSize',16);
% legend boxoff;
legend('HF','WH','MS','TL','AQ','CuZ','CiZ','XC','location','north','NumColumns',4);
% legend('HF','WH','MAS','TL','AQ','ChZ','CiZ','XC','orientation','horizontal','location','north');
% title('����ʡ����AQIָ������')
% legend('�Ϸ�','�ߺ�','��','ͭ��','����','����','����','����')

% ����ͼ����С
set (gcf,'Position',[100,100,1280,900]); 

%%%%%%%%%%%%%%%%%%%%%%%%%% 3 ��ȡ���������бȽ� %%%%%%%%%%%%%%%%%%%%%%%
% group=[data_original(19,:);data_original(20,:);data_original(17,:);data_original(25,:)];
% plot(group')
% axis([0,n1+1,min(min(group))-5,max(max(group))+10])
% legend('19.�Ϸ�','20.�ߺ�','17.��ɽ','25.����')
% 
% group=[data_original(16,:);data_original(18,:);data_original(6,:);data_original(15,:)];
% plot(group')
% axis([0,n1+1,min(min(group))-5,max(max(group))+10])
% legend('16.��','18.̨��','6.��ͨ','15.����')

% group1=group(1:2,:); 
% group2=data_original(3:4,:);
% 
% subplot(1,2,1)
% plot(group1')
% axis([0,n1+1,min(min(group))-5,max(max(group))+5])
% legend('�Ͼ�','����')
% 
% subplot(1,2,2)
% plot(group2')
% axis([0,n1+1,min(min(group))-5,max(max(group))+5])
% legend('̩��','��')

