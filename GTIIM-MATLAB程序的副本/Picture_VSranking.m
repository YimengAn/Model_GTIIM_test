%  程序名称：各模型关联序比较
%  结果输出：模型间关联序变化趋势图
clc,clear all;


%%  1. 输入数据
data = readtable('/Users/anyimeng/Desktop/GTIIM/Table/Ranking_topsis.xlsx', ...
    'VariableNamingRule','preserve',"Sheet",'data_order',"Range","U34:AE60");
data = data{:,:};
% m=对象个数；n=模型个数
[m,n]=size(data); 
% 排序
Data = sortrows(data);  % 根据第一列升序排列
    

%% 2. 绘图
H = plot(Data');
% 设置坐标轴
axis([0.5,n+0.5,-1,m+2])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'GDIM','CS_{0.9}','CS_{0.8}','CS_{0.7}','CS_{0.6}','CS_{0.5}', ...
    'CS_{0.4}','CS_{0.3}','CS_{0.2}','CS_{0.1}','1-ED'});
set(gca,'ytick',1:1:m)
set(gca,'yticklabel',{'no.1','no.2','no.3','no.4','no.5','no.6','no.7','no.8', ...
    'no.9','no.10','no.11','no.12','no.13','no.14','no.15','no.16','no.17','no.18', ...
    'no.19','no.20','no.21','no.22','no.23','no.24','no.35','no.26','no.27'});

% 创建 legend
Legend = legend('SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX', ...
    'HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC');
set(Legend,'Location','northeastoutside','FontSize',12);
title(Legend,'Cities');

% 创建 ylabel
ylabel('Ranking order');

% 创建 xlabel
xlabel('Models');

% 设置线条样式
set(H,'LineWidth',2);
set(H(1),'DisplayName','CZ','MarkerSize',30,'Marker','.');
set(H(2),'DisplayName','CuZ','MarkerSize',30,'Marker','.');
set(H(3),'DisplayName','YZ','MarkerSize',30,'Marker','.');
set(H(4),'DisplayName','ZJ','MarkerSize',30,'Marker','.');
set(H(5),'DisplayName','WX','MarkerSize',30,'Marker','.');
set(H(6),'DisplayName','NJ','MarkerSize',30,'Marker','.');
set(H(7),'DisplayName','HF','MarkerSize',30,'Marker','.');
set(H(8),'DisplayName','MS','MarkerSize',10,'Marker','x');
set(H(9),'DisplayName','WH','MarkerSize',10,'Marker','x');
set(H(10),'DisplayName','TiZ','MarkerSize',10,'Marker','x');
set(H(11),'DisplayName','AQ','MarkerSize',10,'Marker','x');
set(H(12),'DisplayName','SZ','MarkerSize',10,'Marker','x');
set(H(13),'DisplayName','HuZ','MarkerSize',10,'Marker','x');
set(H(14),'DisplayName','CiZ','MarkerSize',10,'Marker','x');
set(H(15),'DisplayName','HaZ','MarkerSize',10,'Marker','+');
set(H(16),'DisplayName','YC','MarkerSize',10,'Marker','+');
set(H(17),'DisplayName','TL','MarkerSize',10,'Marker','+');
set(H(18),'DisplayName','JX','MarkerSize',10,'Marker','+');
set(H(19),'DisplayName','SH','MarkerSize',10,'Marker','+');
set(H(20),'DisplayName','NT','MarkerSize',10,'Marker','+');
set(H(21),'DisplayName','JH','MarkerSize',10,'Marker','+');
set(H(22),'DisplayName','SX','MarkerSize',8,'Marker','o');
set(H(23),'DisplayName','XC','MarkerSize',8,'Marker','o');
set(H(24),'DisplayName','NB','MarkerSize',8,'Marker','o');
set(H(25),'DisplayName','WZ','MarkerSize',8,'Marker','o');
set(H(26),'DisplayName','TZ','MarkerSize',8,'Marker','o');
set(H(27),'DisplayName','ZS','MarkerSize',8,'Marker','o');

