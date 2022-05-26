%  程序名称:灰色接近关联模型（Grey Closeness Incidence Model），GCIM(t)模型
%  程序功能:分析两组序列间的关联程度
%  数据输入：各数组序列
%  结果输出：灰色接近关联度
clc,clear all;
format short g;
fprintf(2,'灰色接近关联模型GCIM：\n')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 内容一：TCGR关联度矩阵计算 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.数据输入
data_degree=[];
for z = 28
%1.1 数据输入
    sheetNames = sheetnames("AQI.xls") 
    % 读入table, z=sheet number;
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table 转 matrix
    [m,n]=size(data); % m=m1+1，n=n1
    
% 1.2 数据预处理
% % ① 正态标准化
    %     data_standard=zeros(m,n);
    %     data_mean=mean(data,2);  %data矩阵各行的均值
    %     data_std=std(data,0,2);  %data矩阵各行的无偏估计标准差
    %     for i=1:m
    %         for j=1:n
    %             data_standard(i,j)=(data(i,j)-data_mean(i))/data_std(i);
    %         end
    %     end
    %若不需要正态标准化
    data_standard=data;     
    
%% 2.|Si-S0|计算
data_subtract=zeros(m-1,n);
data_nearness=zeros(m-1,1);
%2.1 各分量相减
    for i=1:m-1                                            
        for j=1:n
            data_subtract(i,j)=data_standard(i+1,j)-data_standard(1,j);
        end
    end
    
%2.2 计算|Si-S0|
    for i=1:m-1
        data_nearness(i)=abs(0.5*data_subtract(i,1)+sum(data_subtract(i,2:end-1))+0.5*data_subtract(i,n));
    end        
    
%% 3.灰色接近关联度计算 
data_incidence = zeros(m-1,1);
for i = 1:m-1
    data_incidence(i) = 1/(1+data_nearness(i));
end
data_degree = [data_degree,data_incidence];

end

%% 4. 寻找最大最小关联度值
MAX = max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN = min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2] = find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2] = find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));

%% 5.结果输出
disp('各大气污染物与该类疾病间的在不同时间段的关联度为:');
disp(data_degree);



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  内容二：序关系矩阵输出 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. 数据输入
Z = [1:z];
Data_degree = [Z;data_degree];

%%  2. 构建关联序order
data_order=[]; % 对象/指标关联序矩阵
data_order1=[]; % 排序后的关联度矩阵
for z=1:26
    degree_z=[Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z=sortrows((degree_z)',-2); % 针对每个指标/对象进行排序
    order=(order_z(:,1))'; % 提取关联序
    data_order=[data_order;order];
    order1=(order_z(:,2))'; 
    data_order1=[data_order1;order1]; % 排序后的关联度矩阵
end

%%  3. 结果输出
disp('长三角地区各市AQI指数关联序为:');
disp(data_order);



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  内容三：聚类图谱输出 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SF=squareform(1-data_degree); %将关联度方阵转化为距离概念
CL=linkage(SF,'average'); 
    % 说明：SF是距离函数，Z是返回系统聚类树，method是采用的算法选项
    % single表示最短距离(缺省值)；
    % complete表示最长距离；
    % median表示中间距离法；
    % centroid表示重心法；
    % average表示类平均法；
    % ward 表示离差平方和法（Ward法）。
T=cluster(CL,'maxclust',3)
dendrogram(CL,'ColorThreshold',3)
% cutoff = median([CL(end-2,3) CL(end-1,3)]);
% dendrogram(CL,'ColorThreshold',cutoff)