%  ��������:��ɫ�����ڱ����ƹ���ģ�ͣ�GDTEP(t)ģ��
%  ������:�����������м�Ĺ����̶�
%  �������룺����������
%  ����������ɫ�����ڱ����ƹ�����
clc,clear all;
format short g;
fprintf(2,'��ɫ�����ڱ����ƹ���ģ��GDTEP��\n')

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����һ��GDTEP�����Ⱦ������ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.�������뼰��׼������
data_degree=[];
sheetNames = sheetnames("PM2.5.xls");
object = 27    % object = �о��������
for z=28 %z = 1:object
    %1.1 �������루��һ��Ϊ�������У�
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); % ����table
    data = data{:,:}; % table ת matrix
    [m,n] = size(data); % m=m1+1��n=n1
 
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
end

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
Z=[1:z];
Data_degree=[Z;data_degree];

%%  2. ����������order
data_order=[]; % ����/ָ����������
data_order1=[]; % �����Ĺ����Ⱦ���
for z = 1:object
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
T = cluster(CL,'maxclust',5) %������
H = dendrogram(CL,'Orientation','left','ColorThreshold',0.35) 
set(H,'LineWidth',2)
% dendrogram(CL,'ColorThreshold','default') % ͼ����ɫ Ĭ����ֵ'default'=0.7*max(tree(:,3))
% cutoff = median([CL(end-2,3) CL(end-1,3)]);
% dendrogram(CL,'ColorThreshold',cutoff)

% ��������������
xlabel('Cities');
ylabel('1-\Gamma');
% xtickangle(90); ytickangle(90);
box('on');
% set(gca,'YTickLabel',...
%     {'CZ','YZ','ZJ','TiZ','NJ','WX','YC','HF','CuZ','WH','MS','SH','NT','SZ','JX','HaZ','HuZ','NB','TL','CiZ','AQ','XC','WZ','JH','TZ','SX','ZS'});



