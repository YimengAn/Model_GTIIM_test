clc,clear all;
data=xlsread('C:\Users\dade\Desktop\四面体关联模型\实例数值计算MATLAB程序\AQI长三角19-20(原始数据勿改动).xls',1,'C3:Z28'); 
k=5;     %聚类个数
idx = kmeans(data,k);
%By default, kmeans uses the squared Euclidean distance metric and the k-means++ algorithm for cluster center initialization.
cities=xlsread('C:\Users\dade\Desktop\四面体关联模型\实例数值计算MATLAB程序\AQI长三角19-20(原始数据勿改动).xls',1,'A3:A28'); 
result=[cities,idx]



%%%%%%%%%%%%%%%%%%%%%%% 三维及一下绘图  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %调用自定义函数 FunK_meanPolyD
% [res, record] = FunK_meanPolyD(data',k);
% [h, w] = size(res);
% if h/k == 2
%     hold on
%     for i = 1:k
%         plot(res(i*2-1,1:record(i)),res(i*2,1:record(i)),'*')
%         plot(mean(res(i*2-1,1:record(i)),2),mean(res(i*2,1:record(i)),2),'Marker','square','Color','k','MarkerFaceColor','k','LineStyle','none')
%     end
%     hold off
% elseif h/k == 3
%     for i = 1:k
%         plot3(res(i*3-2,1:record(i)),res(i*3-1,1:record(i)),res(i*3,1:record(i)),'*')
%         plot3(mean(res(i*3-2,1:record(i)),2),mean(res(i*3-1,1:record(i)),2),mean(res(i*3,1:record(i)),2),'Marker','square','Color','k','MarkerFaceColor','k','LineStyle','none')
%         hold on%注意：hold on 要写在plot3之后，这样三维图形才会正常绘制
%     end
%     hold off
% else
%     disp(['结果维度大于3维，不能进行绘制'])
% end
