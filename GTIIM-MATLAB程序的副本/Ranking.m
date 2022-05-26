%  程序名称：各模型关联序比较
%  程序功能：分析各模型关联序计算结果的异同
%  数据输入：各模型关联序（列向量）
%  结果输出：关联序

clc,clear all;
format short g;
fprintf(2,'各模型关联序比较：\n')

%%  1. 输入数据
data = readtable('/Users/anyimeng/Desktop/GTIIM/Table/Ranking_topsis.xlsx', ...
    'VariableNamingRule','preserve',"Sheet",'degree',"Range","B3:O29");
data = data{:,:};
[m,n]=size(data); 

Z = [1:m]';
Data = [Z,data];

%%  2. order
data_order = []; % 关联序矩阵
data_degree = []; % 排序后的关联度矩阵
for z = 1:n
    degree_z = [Data(:,1),Data(:,1+z)];
    % 针对每个指标/对象进行排序
    order_z = sortrows(degree_z,-2);  % '-2': 对第二列从大到小排序
    order = order_z(:,1); % 提取关联序
    data_order = [data_order,order];
    degree = order_z(:,2); 
    data_degree = [data_degree,degree]; % 排序后的关联度矩阵
end

%%  3. 结果输出
disp('长三角地区各市AQI指数关联序为:');
disp(vpa(data_degree,4));   %以4位小数形式显示
disp(data_order);

