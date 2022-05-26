%  ��������:���Ϲ�����+topsis
%  ������:�����������м�Ĺ����̶�
%  �������룺����������
%  ��������
clc,clear all;
format short g;
fprintf(2,'���Ϲ����ȣ�\n')

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����һ��TCGR�����Ⱦ������ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.�������뼰��׼������
data_degree=[];
ob=27    % object = �о��������

%1.1 ��������
    z = 28;
    sheetNames = sheetnames("AQI.xls")  
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table ת matrix
    [m1,n]=size(data); % m1=m+1��n=n1
    m=m1-1;
    
% % 1.2 ����Ԥ����
%     data_standard=zeros(m,n);
%     data_first=data(1:m1,1);  %data������еĵ�һ����
%     for i=1:m1
%         for j=1:n
%             data_standard(i,j)=data(i,j)/data_first(i);
%         end
%     end
 
    %������Ҫ����Ԥ����
    data_standard=data; 
    
%% 2.����֮�����ֵ������
data_subtract=zeros(m,n);
    for i=1:m                                            
        for j=1:n
            data_subtract(i,j)=abs(data_standard(i+1,j)-data_standard(1,j));
        end
    end
    
%% 3.���������ֵ�����е����ֵ����Сֵ���
data_max=max(max(data_subtract));                              
data_min=min(min(data_subtract));                             
   
%% 4.���Ϲ���ϵ������
Garma0i=zeros(m,n);
for i=1:m
    for j=1:n
        Garma0i(i,j)=(data_min+0.5*data_max)/(data_subtract(i,j)+0.5*data_max);
    end
end

%% 5.���ϻ�ɫ�����ȼ��� 
data_incidence=mean(Garma0i,2);
data_degree=[data_degree,data_incidence];


%% 7. Ѱ�������С������ֵ
MAX=max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN=min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2]=find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2]=find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));

%% 8.������
disp('��������Ⱦ������༲������ڲ�ͬʱ��εĹ�����Ϊ:');
disp(data_degree);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ���ݶ������ϵ������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. ��������
Z=[1:ob];
Data_degree=[Z',data_degree]';

%%  2. ����������order
data_order=[]; % ����/ָ����������
data_order1=[]; % �����Ĺ����Ⱦ���
z=1
    degree_z=[Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z=sortrows((degree_z)',-2); % ���ÿ��ָ��/�����������
    order=(order_z(:,1))'; % ��ȡ������
    data_order=[data_order;order];
    order1=(order_z(:,2))'; 
    data_order1=[data_order1;order1]; % �����Ĺ����Ⱦ���


%%  3. ������
disp('�����ǵ�������AQIָ��������Ϊ:');
disp(data_order);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ʱ������ͼ  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �������������������е�ʱ���������� (��һ��Ϊ���ֵ ������������Ҫ+1) 
group1=[data(1,:);data(x1+1,:)]; % MAX and \Gamma_{max}
group2=[data(1,:);data(y1+1,:)]; % MAX and \Gamma_{min}

subplot(1,2,1)
plot(group1')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order1.HF')
title('(a) \Gamma_{max}=0.8880')

subplot(1,2,2)
plot(group2')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order27.T2Z');
title('(b) \Gamma_{min}=0.5142');


