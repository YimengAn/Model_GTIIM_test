sheetNames = sheetnames("NO2.xls");
dataNO2 = readtable('NO2.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{28},"Range","C2:Z29"); % 读入table
dataNO2_original=dataNO2{:,:}; % table 转 matrix
% data_original=[];
[m1,n1]=size(dataNO2_original); % m1=对象/指标个数，n1=时间长度，

sheetNames = sheetnames("O3.xls");
dataO3 = readtable('O3.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{28},"Range","C2:Z29"); % 读入table
dataO3_original=dataO3{:,:}; % table 转 matrix

subplot(1,2,1)
plot(dataNO2_original','linewidth',0.5,'LineStyle','-');
%axis([1,n1,min(min(dataNO2_original))-5,max(max(dataO3_original))+5])
axis([1,n1,0,180]);
set(gca,'xtick',1:1:n1);
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
title('\bf{(a) NO_{2} time series of 27 cities in the YRD}','FontSize',16)
xtickangle(45);
hold on;
p1 = plot(dataNO2_original(1,:)','linewidth',2,'LineStyle','-','Marker','o');
legend([p1],{'X_{max}^{NO_{2}}'});

subplot(1,2,2);
plot(dataO3_original','linewidth',1,'LineStyle','-.');
%axis([1,n1,min(min(dataNO2_original))-5,max(max(dataO3_original))+5])
axis([1,n1,0,180]);
set(gca,'xtick',1:1:n1);
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
title('\bf{(b) O_{3} time series of 27 cities in the YRD}','FontSize',16);
xtickangle(45);
hold on;
p2 = plot(dataO3_original(1,:)','linewidth',2,'LineStyle','-.','Marker','o');
legend([p2],{'X_{max}^{O_{3}}'});

% plot(dataNO2_original','linewidth',1);
% hold on;
% plot(dataO3_original','linewidth',1)
% set(gca,'xtick',1:1:n1)
% set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
