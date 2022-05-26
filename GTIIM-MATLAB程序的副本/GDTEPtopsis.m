%  程序名称:灰色等周期变趋势关联模型+topsis
%  程序功能:分析两组序列间的关联程度
%  数据输入：各数组序列
%  结果输出：灰色等周期变趋势关联度
clc,clear all;
format short g;
fprintf(2,'灰色等周期变趋势关联模型GDTEP：\n')

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 内容一：TCGR关联度矩阵计算 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.数据输入及标准化处理
data_degree=[];
ob=27    % object = 研究对象个数

%1.1 数据输入
    sheetNames = sheetnames("AQI.xls") 
    % 读入table, z=sheet number;
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{28},"Range","C2:Z29"); 
    data = data{:,:} % table 转 matrix
    [m,n]=size(data); % m=m1+1，n=n1
    
%1.2 正态标准化
    data_standard=zeros(m,n);
    data_mean=mean(data,2);  %data矩阵各行的均值
    data_std=std(data,0,2);  %data矩阵各行的无偏估计标准差
    for i=1:m
        for j=1:n
            data_standard(i,j)=(data(i,j)-data_mean(i))/data_std(i);
        end
    end
    
%% 2.计算趋势变化角度矩阵
    data_angle=zeros(m,n-1);                                      
    for i=1:m                                            
        for j=1:n-1
            data_angle(i,j)=atan(data_standard(i,j+1)-data_standard(i,j));
        end
    end
    
%% 3.计算趋势线夹角矩阵
    data_inclination=zeros(m-1,n-1);                              
    for i=2:m
        for j=1:n-1
            data_inclination(i-1,j)=abs(data_angle(i,j)-data_angle(1,j));
        end
    end

%% 4.计算变趋势点关联系数
   data_coefficient=zeros(m-1,n-1);
   for i=1:m-1
       for j=1:n-1
           if  data_angle(i+1,j)* data_angle(1,j)==0
               sgn=1;
           else
               sgn=data_angle(i+1,j)* data_angle(1,j)/abs(data_angle(i+1,j)* data_angle(1,j));
           end
           data_coefficient(i,j)=sgn*(1-sin(data_inclination(i,j)));
       end
   end
   
%% 6.计算灰色变趋势关联度
    data_incidence=mean(data_coefficient,2);               
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
title('(a) \Gamma_{max}=0.8195')

subplot(1,2,2)
plot(group2')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order27.T2Z');
title('(b) \Gamma_{min}=0.3651');


