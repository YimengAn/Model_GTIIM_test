%  ��������:��ɫ�ӽ�����ģ�ͣ�Grey Closeness Incidence Model����GCIM(t)ģ��
%  ������:�����������м�Ĺ����̶�
%  �������룺����������
%  ����������ɫ�ӽ�������
clc,clear all;
format short g;
fprintf(2,'��ɫ�ӽ�����ģ��GCIM��\n')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����һ��TCGR�����Ⱦ������ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.��������
data_degree=[];
for z = 28
%1.1 ��������
    sheetNames = sheetnames("AQI.xls") 
    % ����table, z=sheet number;
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table ת matrix
    [m,n]=size(data); % m=m1+1��n=n1
    
% 1.2 ����Ԥ����
% % �� ��̬��׼��
    %     data_standard=zeros(m,n);
    %     data_mean=mean(data,2);  %data������еľ�ֵ
    %     data_std=std(data,0,2);  %data������е���ƫ���Ʊ�׼��
    %     for i=1:m
    %         for j=1:n
    %             data_standard(i,j)=(data(i,j)-data_mean(i))/data_std(i);
    %         end
    %     end
    %������Ҫ��̬��׼��
    data_standard=data;     
    
%% 2.|Si-S0|����
data_subtract=zeros(m-1,n);
data_nearness=zeros(m-1,1);
%2.1 ���������
    for i=1:m-1                                            
        for j=1:n
            data_subtract(i,j)=data_standard(i+1,j)-data_standard(1,j);
        end
    end
    
%2.2 ����|Si-S0|
    for i=1:m-1
        data_nearness(i)=abs(0.5*data_subtract(i,1)+sum(data_subtract(i,2:end-1))+0.5*data_subtract(i,n));
    end        
    
%% 3.��ɫ�ӽ������ȼ��� 
data_incidence = zeros(m-1,1);
for i = 1:m-1
    data_incidence(i) = 1/(1+data_nearness(i));
end
data_degree = [data_degree,data_incidence];

end

%% 4. Ѱ�������С������ֵ
MAX = max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN = min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2] = find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2] = find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));

%% 5.������
disp('��������Ⱦ������༲������ڲ�ͬʱ��εĹ�����Ϊ:');
disp(data_degree);



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ���ݶ������ϵ������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. ��������
Z = [1:z];
Data_degree = [Z;data_degree];

%%  2. ����������order
data_order=[]; % ����/ָ����������
data_order1=[]; % �����Ĺ����Ⱦ���
for z=1:26
    degree_z=[Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z=sortrows((degree_z)',-2); % ���ÿ��ָ��/�����������
    order=(order_z(:,1))'; % ��ȡ������
    data_order=[data_order;order];
    order1=(order_z(:,2))'; 
    data_order1=[data_order1;order1]; % �����Ĺ����Ⱦ���
end

%%  3. ������
disp('�����ǵ�������AQIָ��������Ϊ:');
disp(data_order);



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ������������ͼ����� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SF=squareform(1-data_degree); %�������ȷ���ת��Ϊ�������
CL=linkage(SF,'average'); 
    % ˵����SF�Ǿ��뺯����Z�Ƿ���ϵͳ��������method�ǲ��õ��㷨ѡ��
    % single��ʾ��̾���(ȱʡֵ)��
    % complete��ʾ����룻
    % median��ʾ�м���뷨��
    % centroid��ʾ���ķ���
    % average��ʾ��ƽ������
    % ward ��ʾ���ƽ���ͷ���Ward������
T=cluster(CL,'maxclust',3)
dendrogram(CL,'ColorThreshold',3)
% cutoff = median([CL(end-2,3) CL(end-1,3)]);
% dendrogram(CL,'ColorThreshold',cutoff)