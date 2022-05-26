%  程序名称:邓氏关联度+topsis
%  程序功能:分析两组序列间的关联程度
%  数据输入：各数组序列
%  结果输出：
clc,clear all;
format short g;
fprintf(2,'邓氏关联度：\n')

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 内容一：TCGR关联度矩阵计算 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.数据输入及标准化处理
data_degree=[];
ob=27    % object = 研究对象个数

%1.1 数据输入
    z = 28;
    sheetNames = sheetnames("AQI.xls")  
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table 转 matrix
    [m1,n]=size(data); % m1=m+1，n=n1
    m=m1-1;
    
% % 1.2 数据预处理
%     data_standard=zeros(m,n);
%     data_first=data(1:m1,1);  %data矩阵各行的第一个数
%     for i=1:m1
%         for j=1:n
%             data_standard(i,j)=data(i,j)/data_first(i);
%         end
%     end
 
    %若不需要数据预处理
    data_standard=data; 
    
%% 2.分量之差绝对值矩阵构造
data_subtract=zeros(m,n);
    for i=1:m                                            
        for j=1:n
            data_subtract(i,j)=abs(data_standard(i+1,j)-data_standard(1,j));
        end
    end
    
%% 3.分量差绝对值矩阵中的最大值和最小值求解
data_max=max(max(data_subtract));                              
data_min=min(min(data_subtract));                             
   
%% 4.邓氏关联系数计算
Garma0i=zeros(m,n);
for i=1:m
    for j=1:n
        Garma0i(i,j)=(data_min+0.5*data_max)/(data_subtract(i,j)+0.5*data_max);
    end
end

%% 5.邓氏灰色关联度计算 
data_incidence=mean(Garma0i,2);
data_degree=[data_degree,data_incidence];


%% 7. 寻找最大最小关联度值
MAX=max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN=min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2]=find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2]=find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));

%% 8.结果输出
disp('各大气污染物与该类疾病间的在不同时间段的关联度为:');
disp(data_degree);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  内容二：序关系矩阵输出 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. 数据输入
Z=[1:ob];
Data_degree=[Z',data_degree]';

%%  2. 构建关联序order
data_order=[]; % 对象/指标关联序矩阵
data_order1=[]; % 排序后的关联度矩阵
z=1
    degree_z=[Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z=sortrows((degree_z)',-2); % 针对每个指标/对象进行排序
    order=(order_z(:,1))'; % 提取关联序
    data_order=[data_order;order];
    order1=(order_z(:,2))'; 
    data_order1=[data_order1;order1]; % 排序后的关联度矩阵


%%  3. 结果输出
disp('长三角地区各市AQI指数关联序为:');
disp(data_order);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 时间序列图  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 考察地区序列与最大序列的时间序列趋势 (第一列为最大值 后面城市序号需要+1) 
group1=[data(1,:);data(x1+1,:)]; % MAX and \Gamma_{max}
group2=[data(1,:);data(y1+1,:)]; % MAX and \Gamma_{min}

subplot(1,2,1)
plot(group1')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order1.HF')
title('(a) \Gamma_{max}=0.8880')

subplot(1,2,2)
plot(group2')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order27.T2Z');
title('(b) \Gamma_{min}=0.5142');


