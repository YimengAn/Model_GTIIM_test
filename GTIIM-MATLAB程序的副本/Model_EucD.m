%  程序名称:Euclidean distance
%  程序功能:分析两组序列间的距离
%  数据输入：各数组序列
%  结果输出：1-Euclidean distance
clc,clear all;
format short g;
fprintf(2,'1-Euclidean distance：\n')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 内容一：TCGR关联度矩阵计算 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.数据输入及标准化处理
data_degree=[];
ob=27; % 研究对象个数
for z =  28 %1:ob  z=28 topsis
% 1.1 数据输入
    sheetNames = sheetnames("AQI.xls") 
    % 读入table, z=sheet number;
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table 转 matrix
    [m1,n]=size(data); % m1=m+1，n=n1
    m=m1-1;
    
% 1.2 数据预处理
% 归一化处理 [0,1]
      data_standard = [];
      for i = 1:m1
          max_i = max(data(i,:));                              
          min_i = min(data(i,:));
          for j = 1:n
              data_standard(i,j) = (max_i-data(i,j))/(max_i-min_i);
              %data_standard(i,j) = (data(i,j)-min_i)/(max_i-min_i);
          end
      end

 
% % 正态标准化
%       data_standard=zeros(m1,n);
%       data_mean=mean(data,2);  %data矩阵各行的均值
%       data_std=std(data,0,2);  %data矩阵各行的无偏估计标准差
%       for i=1:m1
%           for j=1:n
%               data_standard(i,j)=(data(i,j)-data_mean(i))/data_std(i);
%           end
%       end


%     %若不需要数据预处理
%     data_standard=data; 

    
%% 2.分量之差平方矩阵构造
data_subtract=zeros(m,n);
    for i=1:m                                            
        for j=1:n
            data_subtract(i,j)=(1/n)*(data_standard(i+1,j)-data_standard(1,j));
%             data_subtract(i,j)=(data_standard(i+1,j)-data_standard(1,j));
        end
    end
                            
   
%% 3.Euclidean distance计算
Garma0i=zeros(m,n);
for i=1:m
    for j=1:n
        Garma0i(i,j)=(data_subtract(i,j))^2;
    end
end

%% 4.Euclidean distance关联度计算 
data_incidence=1-sqrt(sum(Garma0i,2));
data_degree=[data_degree,data_incidence];

end

%% 5. 寻找最大最小关联度值
MAX=max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN=min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2]=find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2]=find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));


%% 6.结果输出
disp('各大气污染物与该类疾病间的在不同时间段的关联度为:');
disp(data_degree);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  内容二：序关系矩阵输出 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. 数据输入
Z=[1:z];
Data_degree=[Z;data_degree];

%%  2. 构建关联序order
data_order=[]; % 对象/指标关联序矩阵
data_order1=[]; % 排序后的关联度矩阵
for z=1:ob
    degree_z=[Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z=sortrows((degree_z)',-2); % 针对每个指标/对象进行排序
    order=(order_z(:,1))'; % 提取关联序
    data_order=[data_order;order];
    order1=(order_z(:,2))'; 
    data_order1=[data_order1;order1]; % 排序后的关联度矩阵
end

%% 3. 寻找最大最小关联度值
MAX=max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN=min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2]=find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2]=find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));

%% 4. 结果输出
disp('长三角地区各市AQI指数关联序为:');
disp(data_order);
disp(vpa(data_degree,4));   

