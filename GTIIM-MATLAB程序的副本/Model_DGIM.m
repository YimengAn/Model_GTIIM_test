%  程序名称:邓氏关联模型（Deng's Grey Incidence Model），DGIM(t)模型
%  程序功能:分析两组序列间的关联程度
%  数据输入：各数组序列
%  结果输出：邓氏灰色关联度
clc,clear all;
format short g;
fprintf(2,'邓氏灰色关联模型DGIM：\n')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 内容一：DGIM关联度矩阵计算 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.数据输入及标准化处理
data_degree=[];
ob=27; % 研究对象个数
for z = 28%1:ob  % z=28 topsis
%1.1 数据输入
    sheetNames = sheetnames("AQI.xls") 
    % 读入table, z=sheet number;
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table 转 matrix
    [m1,n]=size(data); % m1=m+1，n=n1
    m=m1-1;
    
% % 1.2 数据预处理

%     %若不需要数据预处理
%     data_standard=data; 


        %初值化处理
        data_standard=zeros(m,n);
        data_first=data(1:m1,1);  %data矩阵各行的第一个数
        for i=1:m1
            for j=1:n
                data_standard(i,j)=data(i,j)/data_first(i);
            end
        end


%       %归一化处理 [0,1]
%         data_standard = [];
%         for i = 1:m1
%             max_i = max(data(i,:));                              
%             min_i = min(data(i,:));
%             for j = 1:n
%                 data_standard(i,j) = (max_i-data(i,j))/(max_i-min_i);
%                 %data_standard(i,j) = (data(i,j)-min_i)/(max_i-min_i);
%             end
%         end


%       %正态标准化
%       data_standard=zeros(m1,n);
%       data_mean=mean(data,2);  %data矩阵各行的均值
%       data_std=std(data,0,2);  %data矩阵各行的无偏估计标准差
%       for i=1:m1
%           for j=1:n
%               data_standard(i,j)=(data(i,j)-data_mean(i))/data_std(i);
%           end
%       end


    
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

end

%% 7. 寻找最大最小关联度值
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


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  内容四：关联度分辨度研究 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zeta_degree=sort(data_degree(:))
%plot(zeta_degree(1:(26*26-25)))