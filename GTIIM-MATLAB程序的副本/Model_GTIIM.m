%  ��������: TCGRmodel����ɫͶ���������ۺϹ���ģ�ͣ�
%  ������: �����������м�Ĺ����̶�
%  �������룺����������
%  ��������1.TCGR������ 2.���ϵ���� 3.����ͼ��
clc,clear all;
format short g;
fprintf(2,'��ɫͶ���������ۺϹ���ģ��TCGRmodel��\n')


%% %%%%%%%%%%%%%%%%%%%%%%%% ��.xls�����ļ���ӵ�·�� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mkdir('/Users/anyimeng/Documents/���������ģ��/ʵ����ֵ����MATLAB����/Table') ;  
% addpath('/Users/anyimeng/Documents/���������ģ��/ʵ����ֵ����MATLAB����/Table') ; 
% savepath /Users/anyimeng/Documents/���������ģ��/ʵ����ֵ����MATLAB����/Table/pathdef.m ;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����һ��TCGR�����Ⱦ������ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. ��������
data_degree=[];
sheetNames = sheetnames("AQI.xls");
object = 27    % object = �о��������

for z = 1:object
    %1.1 �������루��һ��Ϊ�������У�
    data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); % ����table
    data = data{:,:}; % table ת matrix
    [m,n] = size(data); % m=m1+1��n=n1
 
    %1.2 ������ڲ���\zeta
    zeta = 0.1; 
    
%%  2. ���������Բ��
    Delta_d = zeros(m-1,n-1);
        for i = 1:m-1                                           
            for j = 1:n-1
                Delta_d(i,j) = abs(data(i+1,j+1)-data(1,j+1));
            end
        end  
    
    Delta_t = zeros(m-1,n-1);
        for i = 1:m-1                                           
            for j = 1:n-1
                Delta_t(i,j) = abs(data(i+1,j+1)-data(i+1,j)-data(1,j+1)+data(1,j));
            end
        end  
        
    V_ij = (1/6)*((Delta_d).*(Delta_t));

%%  3. �����ۺϹ���ϵ��garma
    garma = zeros(m-1,n-1);
        for i = 1:m-1
            for j = 1:n-1
                garma(i,j) = 1/(1+zeta*V_ij(i,j));
%                 garma(i,j)=max(max(V_ij))/(max(max(V_ij))+zeta*V_ij(i,j));
%                 garma(i,j)=zeta*max(max(V_ij))/(zeta*max(max(V_ij))+V_ij(i,j));
            end
        end   
    
%%  4. �����ۺϹ�����Garma
    Garma = mean(garma,2);
    data_degree = [data_degree,Garma];

end


%%  5. �������ڲ���\zeta
MAX = max(max(data_degree(find(data_degree>0&data_degree<1))));
MIN = min(min(data_degree(find(data_degree>0&data_degree<1))));
[x1 x2] = find(data_degree==max(max(data_degree(find(data_degree>0&data_degree<1)))));
[y1 y2] = find(data_degree==min(min(data_degree(find(data_degree>0&data_degree<1)))));

%%  6. ������
disp('�����ǵ�������AQIָ��������Ϊ:');
disp(data_degree);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ���ݶ������ϵ������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  1. ��������
Z = [1:z];
Data_degree = [Z;data_degree];

%%  2. ����������order
data_order = []; % ����/ָ����������
data_order1 = []; % �����Ĺ����Ⱦ���
for z = 1:object
    degree_z = [Data_degree(1,:);Data_degree(1+z,:)]; 
    order_z = sortrows((degree_z)',-2); % ���ÿ��ָ��/�����������
    order = (order_z(:,1))'; % ��ȡ������
    data_order = [data_order;order];
    order1 = (order_z(:,2))'; 
    data_order1 = [data_order1;order1]; % �����Ĺ����Ⱦ���
end

%%  3. ������
disp('�����ǵ�������AQIָ��������Ϊ:');
disp(data_order);


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ������������ͼ����� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SF = squareform(1-data_degree); %�������ȷ���ת��Ϊ�������
CL = linkage(SF,'average'); 
    % ˵����SF�Ǿ��뺯����Z�Ƿ���ϵͳ��������method�ǲ��õ��㷨ѡ��
    % single��ʾ��̾���(ȱʡֵ)��
    % complete��ʾ����룻
    % median��ʾ�м���뷨��
    % centroid��ʾ���ķ���
    % average��ʾ��ƽ������
    % ward ��ʾ���ƽ���ͷ���Ward������
T = cluster(CL,'maxclust',5) %������
H = dendrogram(CL,'ColorThreshold',0.35) % PM2.5=0.22 O3=0.3
% H = dendrogram(CL,'Orientation','left','ColorThreshold',0.22) % �������
set(H,'LineWidth',2)
% dendrogram(CL,'ColorThreshold','default') % ͼ����ɫ Ĭ����ֵ'default'=0.7*max(tree(:,3))
% cutoff = median([CL(end-2,3) CL(end-1,3)]);
% dendrogram(CL,'ColorThreshold',cutoff)

% ��������������
xlabel('Cities');
ylabel('1-\Gamma');
% xtickangle(90); ytickangle(90);
box('on');
% %PM2.5
% set(gca,'XTickLabel',...
%     {'WH','MS','HF','TL','XC','AQ','CiZ','CZ','ZJ','TiZ','CuZ','YZ','SH',...
%     'NJ','WX','SZ','NT','YC','HaZ','SX','JX','HuZ','NB','TZ','WZ','JH','ZS'});
%O3
% set(gca,'XTickLabel',...
%     {'WX','CZ','NJ','YZ','ZJ','TiZ','CuZ','SZ','JX','HuZ','SH','NT','YC',...
%     'HaZ','HF','WH','MS','CiZ','NB','SX','JH','TL','XC','AQ','WZ','TZ','ZS'});
% xtickangle(45);

% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  �����ģ������ȷֱ���о� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% zeta_degree=sort(data_degree(:))
% plot(zeta_degree(1:(26*26-25)))


