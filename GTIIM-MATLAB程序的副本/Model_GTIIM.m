%  程序名称: TCGRmodel（灰色投射四面体综合关联模型）
%  程序功能: 分析两组序列间的关联程度
%  数据输入：各数组序列
%  结果输出：1.TCGR关联度 2.序关系矩阵 3.聚类图谱
clc,clear all;
format short g;
fprintf(2,'灰色投射四面体综合关联模型TCGRmodel：\n')


%% %%%%%%%%%%%%%%%%%%%%%%%% 将.xls数据文件添加到路径 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mkdir('/Users/anyimeng/Documents/四面体关联模型/实例数值计算MATLAB程序/Table') ;  
% addpath('/Users/anyimeng/Documents/四面体关联模型/实例数值计算MATLAB程序/Table') ; 
% savepath /Users/anyimeng/Documents/四面体关联模型/实例数值计算MATLAB程序/Table/pathdef.m ;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 内容一：TCGR关联度矩阵计算 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. 数据输入
data_degree=[];
sheetNames = sheetnames("AQI.xls");
object = 27    % object = 研究对象个数

for z = 1:object
    %1.1 数据输入（第一行为参照序列）
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); % 读入table
    data = data{:,:}; % table 转 matrix
    [m,n] = size(data); % m=m1+1，n=n1
 
    %1.2 输入调节参数\zeta
    zeta = 0.1; 
    
%%  2. 构建差异性测度
    Delta_d = zeros(m-1,n-1);
        for i = 1:m-1                                           
            for j = 1:n-1
                Delta_d(i,j) = abs(data(i+1,j+1)-data(1,j+1));
            end
        end  
    
    Delta_t = zeros(m-1,n-1);
        for i = 1:m-1                                           
            for j = 1:n-1
                Delta_t(i,j) = abs(data(i+1,j+1)-data(i+1,j)-data(1,j+1)+data(1,j));
            end
        end  
        
    V_ij = (1/6)*((Delta_d).*(Delta_t));

%%  3. 构建综合关联系数garma
    garma = zeros(m-1,n-1);
        for i = 1:m-1
            for j = 1:n-1
                garma(i,j) = 1/(1+zeta*V_ij(i,j));
%                 garma(i,j)=max(max(V_ij))/(max(max(V_ij))+zeta*V_ij(i,j));
%                 garma(i,j)=zeta*max(max(V_ij))/(zeta*max(max(V_ij))+V_ij(i,j));
            end
        end   
    
%%  4. 构建综合关联度Garma
    Garma = mean(garma,2);
    data_degree = [data_degree,Garma];

end


%%  5. 调整调节参数\zeta
MAX = max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN = min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2] = find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2] = find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));

%%  6. 结果输出
disp('长三角地区各市AQI指数关联度为:');
disp(data_degree);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  内容二：序关系矩阵输出 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. 数据输入
Z = [1:z];
Data_degree = [Z;data_degree];

%%  2. 构建关联序order
data_order = []; % 对象/指标关联序矩阵
data_order1 = []; % 排序后的关联度矩阵
for z = 1:object
    degree_z = [Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z = sortrows((degree_z)',-2); % 针对每个指标/对象进行排序
    order = (order_z(:,1))'; % 提取关联序
    data_order = [data_order;order];
    order1 = (order_z(:,2))'; 
    data_order1 = [data_order1;order1]; % 排序后的关联度矩阵
end

%%  3. 结果输出
disp('长三角地区各市AQI指数关联序为:');
disp(data_order);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  内容三：聚类图谱输出 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SF = squareform(1-data_degree); %将关联度方阵转化为距离概念
CL = linkage(SF,'average'); 
    % 说明：SF是距离函数，Z是返回系统聚类树，method是采用的算法选项
    % single表示最短距离(缺省值)；
    % complete表示最长距离；
    % median表示中间距离法；
    % centroid表示重心法；
    % average表示类平均法；
    % ward 表示离差平方和法（Ward法）。
T = cluster(CL,'maxclust',5) %聚类结果
H = dendrogram(CL,'ColorThreshold',0.35) % PM2.5=0.22 O3=0.3
% H = dendrogram(CL,'Orientation','left','ColorThreshold',0.22) % 竖向放置
set(H,'LineWidth',2)
% dendrogram(CL,'ColorThreshold','default') % 图谱着色 默认阈值'default'=0.7*max(tree(:,3))
% cutoff = median([CL(end-2,3) CL(end-1,3)]);
% dendrogram(CL,'ColorThreshold',cutoff)

% 设置坐标区属性
xlabel('Cities');
ylabel('1-\Gamma');
% xtickangle(90); ytickangle(90);
box('on');
% %PM2.5
% set(gca,'XTickLabel',...
%     {'WH','MS','HF','TL','XC','AQ','CiZ','CZ','ZJ','TiZ','CuZ','YZ','SH',...
%     'NJ','WX','SZ','NT','YC','HaZ','SX','JX','HuZ','NB','TZ','WZ','JH','ZS'});
%O3
% set(gca,'XTickLabel',...
%     {'WX','CZ','NJ','YZ','ZJ','TiZ','CuZ','SZ','JX','HuZ','SH','NT','YC',...
%     'HaZ','HF','WH','MS','CiZ','NB','SX','JH','TL','XC','AQ','WZ','TZ','ZS'});
% xtickangle(45);

% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  内容四：关联度分辨度研究 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% zeta_degree=sort(data_degree(:))
% plot(zeta_degree(1:(26*26-25)))


