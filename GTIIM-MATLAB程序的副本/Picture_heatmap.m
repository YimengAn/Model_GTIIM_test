clc;clear all;

%% 导入数据
sheetNames = sheetnames("heatmap.xls") 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  城市为横坐标   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = 1; % sheet number
subplot(2,2,1)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{a},"Range","B3:AC26"); 
data = data{:,:} % table 转 matrix

% 绘制热力图
h = heatmap(data);  
h.Colormap = flipud(pink);  % 色块颜色（%bone %jet %parula %flipud(pink) 倒转pink颜色）

% 设置坐标
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% 数据标签的文本颜色
h.CellLabelColor = 'w'; % none无 auto默认 w白色
% 网格线
h.GridVisible = 'off'; % on/off
% 标题
h.Title = '\bf{(a) SO_{2}}';
h.FontSize = 16; 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  城市为横坐标   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = 2; % sheet number
subplot(2,2,2)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{b},"Range","B3:AC26"); 
data = data{:,:} % table 转 matrix

% 绘制热力图
h = heatmap(data);  
h.Colormap = flipud(pink);  % 色块颜色（%bone %jet %parula %flipud(pink) 倒转pink颜色）

% 设置坐标
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% 数据标签的文本颜色
h.CellLabelColor = 'w'; % none无 auto默认 w白色
% 网格线
h.GridVisible = 'off'; % on/off
% 标题
h.Title = '\bf{(b) NO_{2}}';
h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  城市为横坐标   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c = 3; % sheet number
subplot(2,2,3)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{c},"Range","B3:AC26"); 
data = data{:,:} % table 转 matrix

% 绘制热力图
h = heatmap(data);  
h.Colormap = flipud(pink);  % 色块颜色（%bone %jet %parula %flipud(pink) 倒转pink颜色）

% 设置坐标
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% 数据标签的文本颜色
h.CellLabelColor = 'w'; % none无 auto默认 w白色
% 网格线
h.GridVisible = 'off'; % on/off
% 标题
h.Title = '\bf{(c) O_{3}}';
h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  城市为横坐标   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d = 4; % sheet number
subplot(2,2,4)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{d},"Range","B3:AC26"); 
data = data{:,:} % table 转 matrix

% 绘制热力图
h = heatmap(data);  
h.Colormap = flipud(pink);  % 色块颜色（%bone %jet %parula %flipud(pink) 倒转pink颜色）

% 设置坐标
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% 数据标签的文本颜色
h.CellLabelColor = 'w'; % none无 auto默认 w白色
% 网格线
h.GridVisible = 'off'; % on/off
% 标题
h.Title = '\bf{(d) CO}';
h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 调整图窗大小
set (gcf,'Position',[100,100,1280,900]); 
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  城市为横坐标   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
e = 5; % sheet number
subplot(3,2,5)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{e},"Range","B3:AC26"); 
data = data{:,:} % table 转 matrix

% 绘制热力图
h = heatmap(data);  
h.Colormap = flipud(pink);  % 色块颜色（%bone %jet %parula %flipud(pink) 倒转pink颜色）

% 设置坐标
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% 数据标签的文本颜色
h.CellLabelColor = 'w'; % none无 auto默认 w白色
% 网格线
h.GridVisible = 'off'; % on/off
% 标题
h.Title = '\bf{(e) PM2.5}';
h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  城市为横坐标   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = 6; % sheet number
subplot(3,2,6)
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{f},"Range","B3:AC26"); 
data = data{:,:} % table 转 matrix

% 绘制热力图
h = heatmap(data);  
h.Colormap = flipud(pink);  % 色块颜色（%bone %jet %parula %flipud(pink) 倒转pink颜色）

% 设置坐标
% h.XLabel = 'Cities';
h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% 数据标签的文本颜色
h.CellLabelColor = 'w'; % none无 auto默认 w白色
% 网格线
h.GridVisible = 'off'; % on/off
% 标题
h.Title = '\bf{(f) PM10}';
h.FontSize = 16; 

% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  城市为横坐标   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g = 7; % sheet number
% subplot(2,2,4)
% data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{g},"Range","B3:AC26"); 
% data = data{:,:} % table 转 matrix
% 
% % 绘制热力图
% h = heatmap(data);  
% h.Colormap = flipud(pink);  % 色块颜色（%bone %jet %parula %flipud(pink) 倒转pink颜色）
% 
% % 设置坐标
% % h.XLabel = 'Cities';
% h.XDisplayLabels = {'\bf{MAX}','SH','NJ','WX','CZ','SZ','NT','YC','YZ','ZJ','TiZ','HaZ','NB','WZ','JX','HuZ','SX','JH','ZS','TZ','HF','WH','MS','TL','AQ','CuZ','CiZ','XC'};
% h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','',' ',' ',' ',' '};
% % 数据标签的文本颜色
% h.CellLabelColor = 'w'; % none无 auto默认 w白色
% % 网格线
% h.GridVisible = 'off'; % on/off
% % 标题
% h.Title = '\bf{The heatmap of AQI pollutant}';
% h.FontSize = 16; 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 调整图窗大小
set (gcf,'Position',[100,100,1280,900]); 






