%  ��������: ��ɫ�����Ⱦ������
%  �������룺ָ��/����������
%  ������������ͼ��
% clc,clear all;
% format short g;

%% �������� [m,n]=size(data_original) m=���������n=ʱ�䳤��
% ����ճ��
% data_original=[];
% ��һ�׶�
% data_original=xlsread('C:\Users\dade\Desktop\���������ģ��\ʵ����ֵ����MATLAB����\���������׶�(ԭʼ������Ķ�).xls',1,'C3:N28');  
% �ڶ��׶�
% data_original=xlsread('C:\Users\dade\Desktop\���������ģ��\ʵ����ֵ����MATLAB����\���������׶�(ԭʼ������Ķ�).xls',1,'O3:Z28'); 

%% �������ݼ�ÿ��Ԫ��֮��ľ���,��Ӧ����Ϊpdistw.
    % ���ø�ʽ��Y=pdist(X),Y=pdist(X,'metric'), Y=pdist(X,'distfun')
    % ˵����X��m*n�ľ���metric�Ǽ������ķ���ѡ�
    % metric=euclidean��ʾŷʽ���루ȱʡֵ����
    % metric=seuclidean��ʾ��׼��ŷʽ���룻
    % metric=mahalanobis��ʾ���Ͼ��롣
    % distfun���Զ���ľ��뺯��
%%
% Y=pdist(data_original,'euclidean');
SF=squareform(1-data_degree); %�������ȷ���ת��Ϊ����


%% ��Ԫ�ؽ��з��࣬����һ��ϵͳ����������Ӧ����Ϊlinkage
% ���ø�ʽ��Z=linkage(Y), Z=linkage(Y,��method��)
% ˵����Y�Ǿ��뺯����Z�Ƿ���ϵͳ��������method�ǲ��õ��㷨ѡ��
% single��ʾ��̾���(ȱʡֵ)��
% complete��ʾ����룻
% median��ʾ�м���뷨��
% centroid��ʾ���ķ���
% average��ʾ��ƽ������
% ward ��ʾ���ƽ���ͷ���Ward������
CL=linkage(SF,'average');
dendrogram(CL);

%% ȷ����������ϵͳ���������õ���ͬ���࣬��Ӧ�ĺ���Ϊcluster
% ���ø�ʽ��T=cluster(Z,'cutoff',c),T=cluster(Z,'maxclust',n)
% ˵����Z��ϵͳ��������Ϊ(m-1)*3�ľ���c����ֵ��n����������Ŀ��
% maxclust�Ǿ����ѡ�cutoff���ٽ�ֵ������cluster�����������ࡣ
T=cluster(CL,'maxclust',3)
% dendrogram(CL,'ColorThreshold',3)
