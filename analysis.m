%% ARO Poster Figures
% 2023 DPOAEs vs Audiometry
clear; close all; 

load('ARO2023_data.mat'); 

addpath('earCalibs/'); 
calibFiles=dir('earCalibs/'); 
%calibFiles = {'Calib_Ph1ER-10X_DHLEar_10-Oct-2022_16_54_51'; 
%     'Calib_Ph1ER-10X_S252REar_10-Aug-2021_08_25_16.mat'; 
%     'Calib_Ph1ER-10X_SHLEar_02-Aug-2022_15_51_18';
%     'Calib_Ph1ER-10X_SHREar_03-Oct-2022_15_18_55';
%     'Calib_Ph1ER-10X_SHREar_25-Aug-2021_14_34_39'; 
%     'Calib_Ph1ER-10X_SamTestREar_29-Sep-2021_12_56_03'; 
%     'Calib_Ph1ER-10X_Sam_TestREar_03-Nov-2021_15_38_53';
%     'Calib_Ph1ER-10X_Sam_testREar_11-Oct-2021_14_45_59'};

matrix = [ data.HFA, data.EHFA, data.DPhfa, data.DPehfa, data.Age]; 
[rho, pval] = corr(matrix);
data.matrix = matrix; 
data.rho=rho; 
data.pval = pval; 
data.corrlabel = ['HFA', 'EHFA', 'DPhfa', 'DPehfa', 'Age']; 

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
params.ABCFontSize = 24; 
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

% Make Figure 2 - Age vs DPOAE (ehf and hf) 
[fig2] = MakeFig2(data, params); 
print -dpng -r600 fig2

% Make Figure 3 - Audiometry vs DP for EHF
[fig3] = MakeFig3(data, params); 
print -dpng -r600 fig3

normal = 0; FP=0; CR=0; FA=0; 
for i = 1:166
    if data.DPehfa(i) > -25 && data.EHFA(i) <=25
        normal = normal + 1; 
    elseif data.DPehfa(i) > -25 && data.EHFA(i) >25
        FP = FP + 1; 
    elseif data.DPehfa(i) < -25 && data.EHFA(i) > 25
        CR = CR + 1; 
    else 
        FA = FA + 1; 
    end
end
normal = normal / 166 * 100; 
FP = FP / 166 * 100; 
CR = CR / 166 * 100; 
FA = FA / 166 * 100; 

% Make Figure 4 - control and noise exposed groups for OAEs
[fig4] = MakeFig4(data, params); 
print -dpng -r600 fig4

% Make Figure 5 - Age vs DPOaE for both EHF and HF
[fig5] = MakeFig5(data, params); 
print -dpng -r600 fig5

% Make Figure 6 
% tested EHF audio vs dpHF and nothing really good. 
[fig6] = MakeFig6(data, params); 
print -dpng -r600 fig6

% Make Figure 7 - Calibration variation 
[fig7] = MakeFig7(calibFiles, params); 
print -dpng -r600 fig7

% Make Figure 8 - test retest variation
[fig8] = MakeFig8(calibFiles, params); 
print -dpng -r600 fig8

% Make Figure 9 - Calibration std from Hari
[fig9] = MakeFig9(params); 
print -dpng -r600 fig9

% Make Figure 10 - Plot raw DPOAE vs frequency plots
% [fig10] = MakeFig10(data, params); 
% print -dpng -r600 fig10
%% 

heatmap(rho)

% Plot results
h = heatmap(rho);


