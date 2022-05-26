%  ��������:���Ϲ���ģ�ͣ�Deng's Grey Incidence Model����DGIM(t)ģ��
%  ������:�����������м�Ĺ����̶�
%  �������룺����������
%  �����������ϻ�ɫ������
clc,clear all;
format short g;
fprintf(2,'���ϻ�ɫ����ģ��DGIM��\n')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����һ��DGIM�����Ⱦ������ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.�������뼰��׼������
data_degree=[];
ob=27; % �о��������
for z = 28%1:ob  % z=28 topsis
%1.1 ��������
    sheetNames = sheetnames("AQI.xls") 
    % ����table, z=sheet number;
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
    data = data{:,:} % table ת matrix
    [m1,n]=size(data); % m1=m+1��n=n1
    m=m1-1;
    
% % 1.2 ����Ԥ����

%     %������Ҫ����Ԥ����
%     data_standard=data; 


        %��ֵ������
        data_standard=zeros(m,n);
        data_first=data(1:m1,1);  %data������еĵ�һ����
        for i=1:m1
            for j=1:n
                data_standard(i,j)=data(i,j)/data_first(i);
            end
        end


%       %��һ������ [0,1]
%         data_standard = [];
%         for i = 1:m1
%             max_i = max(data(i,:));                              
%             min_i = min(data(i,:));
%             for j = 1:n
%                 data_standard(i,j) = (max_i-data(i,j))/(max_i-min_i);
%                 %data_standard(i,j) = (data(i,j)-min_i)/(max_i-min_i);
%             end
%         end


%       %��̬��׼��
%       data_standard=zeros(m1,n);
%       data_mean=mean(data,2);  %data������еľ�ֵ
%       data_std=std(data,0,2);  %data������е���ƫ���Ʊ�׼��
%       for i=1:m1
%           for j=1:n
%               data_standard(i,j)=(data(i,j)-data_mean(i))/data_std(i);
%           end
%       end


    
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

end

%% 7. Ѱ�������С������ֵ
MAX=max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN=min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2]=find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2]=find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));


%% 6.������
disp('��������Ⱦ������༲������ڲ�ͬʱ��εĹ�����Ϊ:');
disp(data_degree);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ���ݶ������ϵ������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. ��������
Z=[1:z];
Data_degree=[Z;data_degree];

%%  2. ����������order
data_order=[]; % ����/ָ����������
data_order1=[]; % �����Ĺ����Ⱦ���
for z=1:ob
    degree_z=[Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z=sortrows((degree_z)',-2); % ���ÿ��ָ��/�����������
    order=(order_z(:,1))'; % ��ȡ������
    data_order=[data_order;order];
    order1=(order_z(:,2))'; 
    data_order1=[data_order1;order1]; % �����Ĺ����Ⱦ���
end

%% 3. Ѱ�������С������ֵ
MAX=max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN=min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2]=find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2]=find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));

%% 4. ������
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


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  �����ģ������ȷֱ���о� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zeta_degree=sort(data_degree(:))
%plot(zeta_degree(1:(26*26-25)))