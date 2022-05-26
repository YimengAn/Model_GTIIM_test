%  �������ƣ�TOPSIS & GTIImodel����ɫͶ���������ۺϹ���ģ�ͣ�
%  �����ܣ�1.�����������м�Ĺ����̶�  
%          2.�������������к���С��������ͼ
%  �������룺���������� & MAX����
%  ��������GTII������ 2.���ϵ���� 
clc,clear all;
format short g;
fprintf(2,'TOPSIS & TCGRmodel��\n')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����һ��TCGR�����Ⱦ������ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. ��������
data_degree = [];
ob = 27    % object = �о��������
%1.1 ��������ο� rawdata.m �ļ�
  % ����table, z=sheet number;
    sheetNames = sheetnames("AQI.xls") 
    z = 28; % sheet=topsis����һ��Ϊ MAX���У�
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table ת matrix
    [m,n]=size(data); % m=m1+1��n=n1
    
%1.2 ������ڲ���\zeta
    zeta = 0.1; 
    
%%  2. ���������Բ��   
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

%%  3. �����ۺϹ���ϵ��garma
garma=zeros(m-1,n-1);
    for i=1:m-1
        for j=1:n-1
            garma(i,j)=1/(1+zeta*V_ij(i,j));
%             garma(i,j)=max(max(V_ij))/(max(max(V_ij))+zeta*V_ij(i,j));
%             garma(i,j)=zeta*max(max(V_ij))/(zeta*max(max(V_ij))+V_ij(i,j));
        end
    end   
    
%%  4. �����ۺϹ�����Garma
Garma=mean(garma,2);
data_degree=Garma;


%%  5. �������ڲ���\zeta
MAX = max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN = min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2] = find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2] = find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));
 
%%  6. ������
disp('�����ǵ�������AQIָ��������Ϊ:');
disp(data_degree);
disp(data_degree);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ���ݶ������ϵ������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. ��������
Z=[1:ob];
Data_degree=[Z',data_degree]';

%%  2. ����������order
data_order=[]; % ����/ָ����������
data_RangDegree=[]; % �����Ĺ����Ⱦ���

% for z=1:ob
z=1;
    degree_z=[Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z=sortrows((degree_z)',-2); % ���ÿ��ָ��/�����������
    order=(order_z(:,1))'; % ��ȡ������
    data_order=[data_order;order];
    order1=(order_z(:,2))'; 
    data_RangDegree=[data_RangDegree;order1]; % �����Ĺ����Ⱦ���
% end 
A1 = data_order';
A2 = data_RangDegree';

%%  3. ������
disp('�����ǵ�������AQIָ��������Ϊ:');
disp(data_order');
disp(data_RangDegree');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ʱ������ͼ  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �������������������е�ʱ���������� (��һ��Ϊ���ֵ ������������Ҫ+1) 
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


