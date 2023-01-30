%% ARO Poster Figures
% 2023 DPOAEs vs Audiometry
clear; close all; 

load('ARO2023_data.mat'); 

addpath('/earCalibs/'); 
calibFiles = {'Calib_Ph1ER-10X_S252REar_10-Aug-2021_08_25_16.mat'; ...
    'Calib_Ph1ER-10X_s34REar_10-Dec-2021_15_42_24.mat'; ...
    'Calib_Ph1ER-10X_S308REar_04-Dec-2021_18_41_07.mat'};
%% Plotting

% create params struct
params.sym_M = 'x'; 
params.sym_F = 'o'; 
params.sym_ctrl_M = 'd'; 
params.sym_ctrl_F = 'o'; 
params.sym_nexp_M = 'd'; 
params.sym_nexp_F = 'o'; 
params.sym_ma_M = 'd'; 
params.sym_ma_F = 'o'; 
params.color_1 = "#ffffcc"; % yellowy (1)
params.color_2 = "#a1dab4";  % green (2)
params.color_3 = "#253494"; % dark blue (5)
params.color_4 = "#2c7fb8";  % lighter blue (4)
params.color_5 = "#41b6c4"; % teal (3)
params.color_ctrl_M = rgb('Black'); 
params.color_ctrl_F = rgb('Green'); 
params.color_nexp_M = rgb('Black'); 
params.color_nexp_F = rgb('Black'); 
params.color_ma_M = rgb('Black'); 
params.color_ma_F = rgb('Black'); 
params.MarkerSize = 10;
params.SizeData = 100; 
params.LineWidth = 4; 
params.LineColor = rgb('Black'); 
params.TickLength = [0.04 0.02]; 
params.LabelFontSize = 28; 
params.ABCFontSize = 20; 
params.TitleFontSize = 32; 
params.Font = 'Franklin Gothic'; 
params.ABC.Xcorr = 0.93; 
params.ABC.Ycorr = 0.93; 
params.DP_axis = [-40 20]; 
params.Audio_axis = [-10 80]; 
params.fig.height = 8; % inches
params.fig.width = 8.5; % inches
%% Make the figures

% Make figure 1 - HF Audio vs DP 
[fig1] = MakeFig1(data, params); 
print -dpng -r600 fig1

% Make Figure 3 - Ext HF Audio vs DP
[fig2] = MakeFig2(data, params); 
print -dpng -r600 fig2

% Make Figure 3 - Ext HF Audio vs DP
[fig3] = MakeFig3(data, params); 
print -dpng -r600 fig3

% Make Figure 4 - Audio vs DP - Both 
[fig4] = MakeFig4(data, params); 
print -dpng -r600 fig4

% Make Figure 4 - Audio vs DP - Both 
[fig5] = MakeFig5(data, params); 
print -dpng -r600 fig5

% Make Figure 6 - nothing useful rn, just for trying things out
% tested EHF audio vs dpHF and nothing really good. 
[fig6] = MakeFig6(data, params); 
print -dpng -r600 fig6

% Make Figure 7 - Calibration variation 
[fig7] = MakeFig7(calibFiles, params); 
print -dpng -r600 fig7


%% 




% matrix = [Age, DPehfa, DPhfa, EHFA, HFA, Gender10, Group10]; 
% [rho, pval] = corr(matrix)
%