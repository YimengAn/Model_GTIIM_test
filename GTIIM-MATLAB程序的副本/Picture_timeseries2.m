%%  1. 数据输入
data_degree = [];
ob = 27    % object = 研究对象个数
%1.1 数据输入参考 rawdata.m 文件
  % 读入table, z=sheet number;
    sheetNames = sheetnames("AQI.xls") 
    z = 28; % sheet=topsis（第一行为 MAX序列）
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table 转 matrix
    [m,n]=size(data); % m=m1+1，n=n1
    
%% 2. 提取序列
group = data([1,3,5,23,26],:); 

%% 3. 绘图
plot(group')
axis([1,n,min(min(data))-5,max(max(data))+5])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
