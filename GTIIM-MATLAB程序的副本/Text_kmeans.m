clc,clear all;
data=xlsread('C:\Users\dade\Desktop\���������ģ��\ʵ����ֵ����MATLAB����\AQI������19-20(ԭʼ������Ķ�).xls',1,'C3:Z28'); 
k=5;     %�������
idx = kmeans(data,k);
%By default, kmeans uses the squared Euclidean distance metric and the k-means++ algorithm for cluster center initialization.
cities=xlsread('C:\Users\dade\Desktop\���������ģ��\ʵ����ֵ����MATLAB����\AQI������19-20(ԭʼ������Ķ�).xls',1,'A3:A28'); 
result=[cities,idx]



%%%%%%%%%%%%%%%%%%%%%%% ��ά��һ�»�ͼ  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %�����Զ��庯�� FunK_meanPolyD
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
%         hold on%ע�⣺hold on Ҫд��plot3֮��������άͼ�βŻ���������
%     end
%     hold off
% else
%     disp(['���ά�ȴ���3ά�����ܽ��л���'])
% end
