%  程序名称: 灰色关联度聚类分析
%  数据输入：指标/对象间关联度
%  结果输出：聚类图谱
% clc,clear all;
% format short g;

%% 输入数据 [m,n]=size(data_original) m=对象个数，n=时间长度
% 复制粘贴
% data_original=[];
% 第一阶段
% data_original=xlsread('C:\Users\dade\Desktop\四面体关联模型\实例数值计算MATLAB程序\长三角两阶段(原始数据勿改动).xls',1,'C3:N28');  
% 第二阶段
% data_original=xlsread('C:\Users\dade\Desktop\四面体关联模型\实例数值计算MATLAB程序\长三角两阶段(原始数据勿改动).xls',1,'O3:Z28'); 

%% 计算数据集每对元素之间的距离,对应函数为pdistw.
    % 调用格式：Y=pdist(X),Y=pdist(X,'metric'), Y=pdist(X,'distfun')
    % 说明：X是m*n的矩阵，metric是计算距离的方法选项：
    % metric=euclidean表示欧式距离（缺省值）；
    % metric=seuclidean表示标准的欧式距离；
    % metric=mahalanobis表示马氏距离。
    % distfun是自定义的距离函数
%%
% Y=pdist(data_original,'euclidean');
SF=squareform(1-data_degree); %将关联度方阵转化为距离


%% 对元素进行分类，构成一个系统聚类树，对应函数为linkage
% 调用格式：Z=linkage(Y), Z=linkage(Y,’method’)
% 说明：Y是距离函数，Z是返回系统聚类树，method是采用的算法选项
% single表示最短距离(缺省值)；
% complete表示最长距离；
% median表示中间距离法；
% centroid表示重心法；
% average表示类平均法；
% ward 表示离差平方和法（Ward法）。
CL=linkage(SF,'average');
dendrogram(CL);

%% 确定怎样划分系统聚类树，得到不同的类，对应的函数为cluster
% 调用格式：T=cluster(Z,'cutoff',c),T=cluster(Z,'maxclust',n)
% 说明：Z是系统聚类树，为(m-1)*3的矩阵，c是阈值，n是类的最大数目，
% maxclust是聚类的选项，cutoff是临界值，决定cluster函数怎样聚类。
T=cluster(CL,'maxclust',3)
% dendrogram(CL,'ColorThreshold',3)
