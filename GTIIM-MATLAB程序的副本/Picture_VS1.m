%  程序功能: 提取个别对象时间序列做对比分析
clc;
clear all;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Time series 数据输入 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 选择污染物
z = 28;
sheetNames = sheetnames("AQI.xls") 
% 读入table, z=sheet number;
data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
data = data{:,:} % table 转 matrix
[m,n]=size(data); % m1=对象/指标个数，n1=时间长度，

%% 自定义筛选序列做对比
group = data([1,1+2,1+4,1+22,1+25],:); 
plot(group')

%% 模型结果对比
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
% %% 导入数据
% sheetNames = sheetnames("heatmap.xls") 
% %% 绘图
% g = 7; % sheet number
% subplot(2,2,4)
% data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{g},"Range","B3:AC26"); 
% data = data{:,:} % table 转 matrix
% 
% % 绘制热力图
% h = heatmap(data);  
% h.Colormap = flipud(pink);  % 色块颜色（%bone %jet %parula %flipud(pink) 倒转pink颜色）
% 
% % 设置坐标
% % h.XLabel = 'Cities';
% h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
% h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% % 数据标签的文本颜色
% h.CellLabelColor = 'w'; % none无 auto默认 w白色
% % 网格线
% h.GridVisible = 'off'; % on/off
% % 标题
% h.Title = '\bf{(d) The heatmap of AQI pollutant}';
% h.FontSize = 16; 
