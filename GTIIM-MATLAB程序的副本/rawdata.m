%  ������: ��ԭʼ����EXCEL������ȡ��ģ����
clc,clear all;
format short g;


%% R2020b_MATLAB ��������

%% %%%%%%%%%%%%%%%%%%%%%%%% ��.xls�����ļ���ӵ�·�� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir('/Users/anyimeng/����/ʵ����ֵ����MATLAB����/Table') ;  
addpath('/Users/anyimeng/����/ʵ����ֵ����MATLAB����/Table') ; 
savepath /Users/anyimeng/����/ʵ����ֵ����MATLAB����/Table/pathdef.m ;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Time series �������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sheetNames = sheetnames("AQI.xls") 
% ����table, z=sheet number;
z = 1;
data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
data = data{:,:} % table ת matrix


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Topsis �������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sheetNames = sheetnames("AQI.xls") 
% ����table, z=sheet number;
z = 28; % sheet=topsis����һ��Ϊ MAX���У�
data = readtable('AQI.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{z},"Range","C2:Z29"); 
data = data{:,:} % table ת matrix

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Heatmap �������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sheetNames = sheetnames("heatmap.xls") 
% ����table, z=sheet number;
z = 4; % z=4 ����Ϊ������
data = readtable('heatmap.xls',"ReadRowNames",false,"ReadVariableNames",false,"Sheet",sheetNames{4},"Range","B3:AC26"); 
data = data{:,:} % table ת matrix


