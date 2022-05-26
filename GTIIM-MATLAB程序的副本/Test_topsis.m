%  程序名称：TOPSIS & GTIImodel（灰色投射四面体综合关联模型）
%  程序功能：1.分析两组序列间的关联程度  
%          2.绘制最大关联序列和最小关联序列图
%  数据输入：各数组序列 & MAX序列
%  结果输出：GTII关联度 2.序关系矩阵 
clc,clear all;
format short g;
fprintf(2,'TOPSIS & TCGRmodel：\n')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 内容一：TCGR关联度矩阵计算 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    
%1.2 输入调节参数\zeta
    zeta = 0.1; 
    
%%  2. 构建差异性测度   
Delta_d = zeros(m-1,n-1);
    for i=1:m-1                                           
        for j=1:n-1
            Delta_d(i,j)=abs(data(i+1,j+1)-data(1,j+1));
        end
    end  
    
Delta_t=zeros(m-1,n-1);
    for i=1:m-1                                           
        for j=1:n-1
            Delta_t(i,j)=abs(data(i+1,j+1)-data(i+1,j)-data(1,j+1)+data(1,j));
        end
    end  
    
V_ij=(1/6)*((Delta_d).*(Delta_t));

%%  3. 构建综合关联系数garma
garma=zeros(m-1,n-1);
    for i=1:m-1
        for j=1:n-1
            garma(i,j)=1/(1+zeta*V_ij(i,j));
%             garma(i,j)=max(max(V_ij))/(max(max(V_ij))+zeta*V_ij(i,j));
%             garma(i,j)=zeta*max(max(V_ij))/(zeta*max(max(V_ij))+V_ij(i,j));
        end
    end   
    
%%  4. 构建综合关联度Garma
Garma=mean(garma,2);
data_degree=Garma;


%%  5. 调整调节参数\zeta
MAX = max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN = min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2] = find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2] = find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));
 
%%  6. 结果输出
disp('长三角地区各市AQI指数关联度为:');
disp(data_degree);
disp(data_degree);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  内容二：序关系矩阵输出 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. 数据输入
Z=[1:ob];
Data_degree=[Z',data_degree]';

%%  2. 构建关联序order
data_order=[]; % 对象/指标关联序矩阵
data_RangDegree=[]; % 排序后的关联度矩阵

% for z=1:ob
z=1;
    degree_z=[Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z=sortrows((degree_z)',-2); % 针对每个指标/对象进行排序
    order=(order_z(:,1))'; % 提取关联序
    data_order=[data_order;order];
    order1=(order_z(:,2))'; 
    data_RangDegree=[data_RangDegree;order1]; % 排序后的关联度矩阵
% end 
A1 = data_order';
A2 = data_RangDegree';

%%  3. 结果输出
disp('长三角地区各市AQI指数关联序为:');
disp(data_order');
disp(data_RangDegree');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 时间序列图  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 考察地区序列与最大序列的时间序列趋势 (第一列为最大值 后面城市序号需要+1) 
group1=[data(1,:);data(x1+1,:)]; % MAX and \Gamma_{max}
group2=[data(1,:);data(y1+1,:)]; % MAX and \Gamma_{min}

subplot(1,2,1)
plot(group1')
axis([1,n,min(min(data))-2,max(max(data))+2])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order1.')
title('(a) \Gamma_{max}=0.8131')

subplot(1,2,2)
plot(group2')
axis([1,n,min(min(data))-2,max(max(data))+2])
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order27.');
title('(b) \Gamma_{min}=0.2185');


