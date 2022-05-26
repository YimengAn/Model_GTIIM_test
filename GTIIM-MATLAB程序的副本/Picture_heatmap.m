clc;clear all;

%% ��������
sheetNames = sheetnames("heatmap.xls") 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ����Ϊ������   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = 1; % sheet number
subplot(2,2,1)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{a},"Range","B3:AC26"); 
data = data{:,:} % table ת matrix

% ��������ͼ
h = heatmap(data);  
h.Colormap = flipud(pink);  % ɫ����ɫ��%bone %jet %parula %flipud(pink) ��תpink��ɫ��

% ��������
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% ���ݱ�ǩ���ı���ɫ
h.CellLabelColor = 'w'; % none�� autoĬ�� w��ɫ
% ������
h.GridVisible = 'off'; % on/off
% ����
h.Title = '\bf{(a) SO_{2}}';
h.FontSize = 16; 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ����Ϊ������   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = 2; % sheet number
subplot(2,2,2)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{b},"Range","B3:AC26"); 
data = data{:,:} % table ת matrix

% ��������ͼ
h = heatmap(data);  
h.Colormap = flipud(pink);  % ɫ����ɫ��%bone %jet %parula %flipud(pink) ��תpink��ɫ��

% ��������
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% ���ݱ�ǩ���ı���ɫ
h.CellLabelColor = 'w'; % none�� autoĬ�� w��ɫ
% ������
h.GridVisible = 'off'; % on/off
% ����
h.Title = '\bf{(b) NO_{2}}';
h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ����Ϊ������   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c = 3; % sheet number
subplot(2,2,3)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{c},"Range","B3:AC26"); 
data = data{:,:} % table ת matrix

% ��������ͼ
h = heatmap(data);  
h.Colormap = flipud(pink);  % ɫ����ɫ��%bone %jet %parula %flipud(pink) ��תpink��ɫ��

% ��������
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% ���ݱ�ǩ���ı���ɫ
h.CellLabelColor = 'w'; % none�� autoĬ�� w��ɫ
% ������
h.GridVisible = 'off'; % on/off
% ����
h.Title = '\bf{(c) O_{3}}';
h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ����Ϊ������   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d = 4; % sheet number
subplot(2,2,4)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{d},"Range","B3:AC26"); 
data = data{:,:} % table ת matrix

% ��������ͼ
h = heatmap(data);  
h.Colormap = flipud(pink);  % ɫ����ɫ��%bone %jet %parula %flipud(pink) ��תpink��ɫ��

% ��������
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% ���ݱ�ǩ���ı���ɫ
h.CellLabelColor = 'w'; % none�� autoĬ�� w��ɫ
% ������
h.GridVisible = 'off'; % on/off
% ����
h.Title = '\bf{(d) CO}';
h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����ͼ����С
set (gcf,'Position',[100,100,1280,900]); 
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ����Ϊ������   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
e = 5; % sheet number
subplot(3,2,5)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{e},"Range","B3:AC26"); 
data = data{:,:} % table ת matrix

% ��������ͼ
h = heatmap(data);  
h.Colormap = flipud(pink);  % ɫ����ɫ��%bone %jet %parula %flipud(pink) ��תpink��ɫ��

% ��������
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% ���ݱ�ǩ���ı���ɫ
h.CellLabelColor = 'w'; % none�� autoĬ�� w��ɫ
% ������
h.GridVisible = 'off'; % on/off
% ����
h.Title = '\bf{(e) PM2.5}';
h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ����Ϊ������   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = 6; % sheet number
subplot(3,2,6)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{f},"Range","B3:AC26"); 
data = data{:,:} % table ת matrix

% ��������ͼ
h = heatmap(data);  
h.Colormap = flipud(pink);  % ɫ����ɫ��%bone %jet %parula %flipud(pink) ��תpink��ɫ��

% ��������
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% ���ݱ�ǩ���ı���ɫ
h.CellLabelColor = 'w'; % none�� autoĬ�� w��ɫ
% ������
h.GridVisible = 'off'; % on/off
% ����
h.Title = '\bf{(f) PM10}';
h.FontSize = 16; 

% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  ����Ϊ������   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g = 7; % sheet number
% subplot(2,2,4)
% data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{g},"Range","B3:AC26"); 
% data = data{:,:} % table ת matrix
% 
% % ��������ͼ
% h = heatmap(data);  
% h.Colormap = flipud(pink);  % ɫ����ɫ��%bone %jet %parula %flipud(pink) ��תpink��ɫ��
% 
% % ��������
% % h.XLabel = 'Cities';
% h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
% h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% % ���ݱ�ǩ���ı���ɫ
% h.CellLabelColor = 'w'; % none�� autoĬ�� w��ɫ
% % ������
% h.GridVisible = 'off'; % on/off
% % ����
% h.Title = '\bf{The heatmap of AQI pollutant}';
% h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����ͼ����С
set (gcf,'Position',[100,100,1280,900]); 






