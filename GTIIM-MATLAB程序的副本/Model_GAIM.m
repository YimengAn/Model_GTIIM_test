%  ��������:��ɫ���Թ���ģ�ͣ�Grey Absolute Incidence Model����GRIM(t)ģ��
%  ������:�����������м�Ĺ����̶�
%  �������룺����������
%  ����������ɫ���Թ�����
clc,clear all;
format short g;
fprintf(2,'��ɫ���Թ���ģ��GAIM��\n')

%% 1.��������
data_degree = [];
ob = 27;
for z = 28
%1.1 ��������
    sheetNames = sheetnames("AQI.xls")  
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table ת matrix
    [m,n] = size(data);
    
% %1.2 ��̬��׼��
%     data_standard=zeros(m,n);
%     data_mean=mean(data,2);  %data������еľ�ֵ
%     data_std=std(data,0,2);  %data������е���ƫ���Ʊ�׼��
%     for i=1:m
%         for j=1:n
%             data_standard(i,j)=(data(i,j)-data_mean(i))/data_std(i);
%         end
%     end
   
data_standard = data;

%1.3 ʼ������
    data_standard1 = zeros(m,n);
    for i = 1:m
        for j = 1:n
            data_standard1(i,j) = data_standard(i,j)-data_standard(i,1);
        end
    end
    
%% 2.|s0|��|si|��|si-s0|����
%2.1 |s0|����
    data_s0 = abs(sum(data_standard1(1,2:end-1))+0.5*data_standard1(1,end));
    
%2.1 |s0|����
    for i = 1:m       
        data_si(i) = abs(sum(data_standard1(i,2:end-1))+0.5*data_standard1(i,end));
    end

%2.3 ���������
    data_subtract = zeros(m-1,n);
    data_nearness = zeros(m-1,1);
    for i = 1:m-1                                            
        for j = 1:n
            data_subtract(i,j) = data_standard1(i+1,j)-data_standard1(1,j);
        end
    end
    
%2.4 ����|si-s0|
    for i = 1:m-1
        data_nearness(i) = abs(sum(data_subtract(i,2:end-1))+0.5*data_subtract(i,n));
    end        
    
%% 3.��ɫ���Թ����ȼ��� 
data_incidence = zeros(m-1,1);
for i = 1:m-1
    data_incidence(i) = (1+data_s0+data_si(i))/(1+data_s0+data_si(i)+data_nearness(i));
end
    data_degree = [data_degree,data_incidence];
 
end

%% 4.������

% 4.1 ��������
Z = [1:ob];
Data_degree = [Z;data_degree];

% 4.2 ����������order
data_order = []; % ����/ָ����������
data_order1 = []; % �����Ĺ����Ⱦ���
for z = 1:ob
    degree_z = [Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z = sortrows((degree_z)',-2); % ���ÿ��ָ��/�����������
    order = (order_z(:,1))'; % ��ȡ������
    data_order = [data_order;order];
    order1 = (order_z(:,2))'; 
    data_order1 = [data_order1;order1]; % �����Ĺ����Ⱦ���
end


%4.3 ������
disp('��������Ⱦ������Ѫ�ܼ�������ڲ�ͬʱ��εĹ�����Ϊ:');
disp(vpa(data_degree,4));           %��4λС����ʽ��ʾ
disp('��������Ⱦ������Ѫ�ܼ�������ڲ�ͬʱ��εĹ�����Ϊ:');
disp(data_order);
