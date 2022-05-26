%  ��������:��ɫ�����ڱ����ƹ���ģ��+topsis
%  ������:�����������м�Ĺ����̶�
%  �������룺����������
%  ����������ɫ�����ڱ����ƹ�����
clc,clear all;
format short g;
fprintf(2,'��ɫ�����ڱ����ƹ���ģ��GDTEP��\n')

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����һ��TCGR�����Ⱦ������ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.�������뼰��׼������
data_degree=[];
ob=27    % object = �о��������

%1.1 ��������
    sheetNames = sheetnames("AQI.xls") 
    % ����table, z=sheet number;
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{28},"Range","C2:Z29"); 
    data = data{:,:} % table ת matrix
    [m,n]=size(data); % m=m1+1��n=n1
    
%1.2 ��̬��׼��
    data_standard=zeros(m,n);
    data_mean=mean(data,2);  %data������еľ�ֵ
    data_std=std(data,0,2);  %data������е���ƫ���Ʊ�׼��
    for i=1:m
        for j=1:n
            data_standard(i,j)=(data(i,j)-data_mean(i))/data_std(i);
        end
    end
    
%% 2.�������Ʊ仯�ǶȾ���
    data_angle=zeros(m,n-1);                                      
    for i=1:m                                            
        for j=1:n-1
            data_angle(i,j)=atan(data_standard(i,j+1)-data_standard(i,j));
        end
    end
    
%% 3.���������߼нǾ���
    data_inclination=zeros(m-1,n-1);                              
    for i=2:m
        for j=1:n-1
            data_inclination(i-1,j)=abs(data_angle(i,j)-data_angle(1,j));
        end
    end

%% 4.��������Ƶ����ϵ��
   data_coefficient=zeros(m-1,n-1);
   for i=1:m-1
       for j=1:n-1
           if  data_angle(i+1,j)* data_angle(1,j)==0
               sgn=1;
           else
               sgn=data_angle(i+1,j)* data_angle(1,j)/abs(data_angle(i+1,j)* data_angle(1,j));
           end
           data_coefficient(i,j)=sgn*(1-sin(data_inclination(i,j)));
       end
   end
   
%% 6.�����ɫ�����ƹ�����
    data_incidence=mean(data_coefficient,2);               
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
title('(a) \Gamma_{max}=0.8195')

subplot(1,2,2)
plot(group2')
set(gca,'xtick',1:1:n)
set(gca,'xticklabel',{'Jan,19','Feb,19','Mar,19','Apr,19','May,19','Jun,19','Jul,19','Aug,19','Sep,19','Oct,19','Nov,19','Dec,19','Jan,20','Feb,20','Mar,20','Apr,20','May,20','Jun,20','Jul.20','Aug,20','Sep,20','Oct,20','Nov,20','Dec,20'});
xtickangle(45);
legend('MAX','Order27.T2Z');
title('(b) \Gamma_{min}=0.3651');


