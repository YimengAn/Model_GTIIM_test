%  程序名称: TCGRmodel（灰色投射四面体综合关联模型）
%  程序功能: 绘制原始数据矩阵折线图
%  数据输入：各数组序列
%  结果输出：折线图
clc,clear all;
format short g;



%% 输入矩阵原始数据矩阵（注意：时间序列为行向量）
sheetNames = sheetnames("AQI.xls");
data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{1},"Range","C2:Z29"); % 读入table
data_original=data{2:28,:}; % table 转 matrix
% data_original=[];
[m1,n1]=size(data_original); % m1=对象/指标个数，n1=时间长度，

%% 绘图

% % 1 对象较少时
% plot(data_original)
% axis([0,m1+1,min(min(data_original))-5,max(max(data_original))+5])
% legend('南京','常州','徐州','淮安','南通','宿迁','无锡','扬州','盐城','苏州','泰州','镇江','连云港')


% 2 对象较多时，分组绘图
group1=data_original(1,:); % 上海市
group2=data_original(2:10,:); % 江苏省
group3=data_original(11:19,:); % 浙江省
group4=data_original(20:27,:); % 安徽省

subplot(2,2,1)
plot(group1)
axis([1,n1,min(min(data_original))-5,max(max(data_original))+5])
set(gca,'xtick',1:1:n1)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});

legend('SH','location','north')
%legend boxoff;
title('\bf{(a) AQI time series of Shanghai}','FontSize',16);
% legend('上海')
% title('上海市AQI指数序列')

subplot(2,2,2)
plot(group2')
axis([1,n1,min(min(data_original))-5,max(max(data_original))+5])
set(gca,'xtick',1:1:n1)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','location','north','NumColumns',5);
%legend boxoff;
title('\bf{(b) AQI time series of cities in Jiangsu Province}','FontSize',16);
% legend('南京','无锡','常州','苏州','南通','盐城','扬州','镇江','泰州')
% title('江苏省各市AQI指数序列')

subplot(2,2,3);
plot(group3');
axis([1,n1,min(min(data_original))-5,max(max(data_original))+5]);
set(gca,'xtick',1:1:n1);
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','location','north','NumColumns',5);
%legend boxoff;
title('\bf{(c) AQI time series of cities in Zhejiang Province}','FontSize',16)
% legend('杭州','宁波','温州','嘉兴','湖州','绍兴','金华','舟山','台州')
% title('浙江省各市AQI指数序列')

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
% title('安徽省各市AQI指数序列')
% legend('合肥','芜湖','马鞍','铜陵','安庆','滁州','池州','宣城')

% 调整图窗大小
set (gcf,'Position',[100,100,1280,900]); 

%%%%%%%%%%%%%%%%%%%%%%%%%% 3 提取个别对象进行比较 %%%%%%%%%%%%%%%%%%%%%%%
% group=[data_original(19,:);data_original(20,:);data_original(17,:);data_original(25,:)];
% plot(group')
% axis([0,n1+1,min(min(group))-5,max(max(group))+10])
% legend('19.合肥','20.芜湖','17.舟山','25.滁州')
% 
% group=[data_original(16,:);data_original(18,:);data_original(6,:);data_original(15,:)];
% plot(group')
% axis([0,n1+1,min(min(group))-5,max(max(group))+10])
% legend('16.金华','18.台州','6.南通','15.绍兴')

% group1=group(1:2,:); 
% group2=data_original(3:4,:);
% 
% subplot(1,2,1)
% plot(group1')
% axis([0,n1+1,min(min(group))-5,max(max(group))+5])
% legend('南京','无锡')
% 
% subplot(1,2,2)
% plot(group2')
% axis([0,n1+1,min(min(group))-5,max(max(group))+5])
% legend('泰州','镇江')

