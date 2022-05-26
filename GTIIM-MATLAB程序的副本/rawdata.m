%  程序功能: 从原始数据EXCEL表中提取建模数据
clc,clear all;
format short g;


%% R2020b_MATLAB 读入数据

%% %%%%%%%%%%%%%%%%%%%%%%%% 将.xls数据文件添加到路径 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir('/Users/anyimeng/科研/实例数值计算MATLAB程序/Table') ;  
addpath('/Users/anyimeng/科研/实例数值计算MATLAB程序/Table') ; 
savepath /Users/anyimeng/科研/实例数值计算MATLAB程序/Table/pathdef.m ;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Time series 数据输入 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sheetNames = sheetnames("AQI.xls") 
% 读入table, z=sheet number;
z = 1;
data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
data = data{:,:} % table 转 matrix


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Topsis 数据输入 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sheetNames = sheetnames("AQI.xls") 
% 读入table, z=sheet number;
z = 28; % sheet=topsis（第一行为 MAX序列）
data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
data = data{:,:} % table 转 matrix

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Heatmap 数据输入 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sheetNames = sheetnames("heatmap.xls") 
% 读入table, z=sheet number;
z = 4; % z=4 城市为横坐标
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{4},"Range","B3:AC26"); 
data = data{:,:} % table 转 matrix


