%  程序名称:灰色等周期变趋势关联模型，GDTEP(t)模型
%  程序功能:分析两组序列间的关联程度
%  数据输入：各数组序列
%  结果输出：灰色等周期变趋势关联度
clc,clear all;
format short g;
fprintf(2,'灰色等周期变趋势关联模型GDTEP：\n')

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 内容一：GDTEP关联度矩阵计算 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.数据输入及标准化处理
data_degree=[];
sheetNames = sheetnames("PM2.5.xls");
object = 27    % object = 研究对象个数
for z=28 %z = 1:object
    %1.1 数据输入（第一行为参照序列）
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); % 读入table
    data = data{:,:}; % table 转 matrix
    [m,n] = size(data); % m=m1+1，n=n1
 
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
end

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
Z=[1:z];
Data_degree=[Z;data_degree];

%%  2. 构建关联序order
data_order=[]; % 对象/指标关联序矩阵
data_order1=[]; % 排序后的关联度矩阵
for z = 1:object
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
T = cluster(CL,'maxclust',5) %聚类结果
H = dendrogram(CL,'Orientation','left','ColorThreshold',0.35) 
set(H,'LineWidth',2)
% dendrogram(CL,'ColorThreshold','default') % 图谱着色 默认阈值'default'=0.7*max(tree(:,3))
% cutoff = median([CL(end-2,3) CL(end-1,3)]);
% dendrogram(CL,'ColorThreshold',cutoff)

% 设置坐标区属性
xlabel('Cities');
ylabel('1-\Gamma');
% xtickangle(90); ytickangle(90);
box('on');
% set(gca,'YTickLabel',...
%     {'CZ','YZ','ZJ','TiZ','NJ','WX','YC','HF','CuZ','WH','MS','SH','NT','SZ','JX','HaZ','HuZ','NB','TL','CiZ','AQ','XC','WZ','JH','TZ','SX','ZS'});



