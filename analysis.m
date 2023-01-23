%% ARO Poster Figures
% 2023 DPOAEs vs Audiometry
clear all; close all; 

load('ARO2023_data.mat'); 

%% Plotting

% create params struct
params.sym_ctrl_M = 'd'; 
params.sym_ctrl_F = 'o'; 
params.sym_nexp_M = 'd'; 
params.sym_nexp_F = 'o'; 
params.sym_ma_M = 'd'; 
params.sym_ma_F = 'o'; 
params.color_ctrl_M = rgb('Black'); 
params.color_ctrl_F = rgb('Green'); 
params.color_nexp_M = rgb('Black'); 
params.color_nexp_F = rgb('Black'); 
params.color_ma_M = rgb('Black'); 
params.color_ma_F = rgb('Black'); 
params.MarkerSize = 40; 
params.TickLength = [0.04 0.01]; 
params.LabelFontSize = 20; 
params.ABCFontSize = 20; 
params.TitleFontSize = 24; 
params.Font = 'Ariel'; 
params.ABC.Xcorr = 0.03; 
params.ABC.Ycorr = 0.95; 

%% Make the figures

% Make figure 1; 
[fig1] = MakeFig1(data, params); 

% Make Figure 2
% MakeFig2(data, params); 
%% 
% 
% figure; 
% plot(EHFA_ctrl_M, DPehfa_ctrl_M, 'xk', EHFA_ctrl_F, DPehfa_ctrl_F, 'ok', ...
%     EHFA_nexp_M, DPehfa_nexp_M, 'xr', EHFA_nexp_F, DPehfa_nexp_F, 'or', ...
%     EHFA_ma_M, DPehfa_ma_M, 'xb', EHFA_ma_F, DPehfa_ma_F, 'ob'); 
% legend('ctrl M', 'ctrl F', 'nexp M', 'nexp F', 'ma M', 'ma F'); 
% title('Extended High Frequency'); 
% xlabel('Extended HF PTA'); 
% ylabel('Avg EHF DPOAE Amplitude'); 
% 
% % age correlated with EHFA, but not HFA in this group 
% figure; 
% plot(Age, HFA, 'x', Age, EHFA, 'o') 
% title('Age vs Threshold')
% legend('HF', 'EHF')
% xlabel('Age (Years)'); 
% ylabel('Threshold dBHL'); 
% 
% % basically everyones EHF dpoaes are worse than their HF, but age not
% % correlated
% figure; 


% plot(Age, DPhfa, 'x', Age, DPehfa, 'o')
% title('Age vs DPOAE')
% legend('HF', 'EHF')
% xlabel('Age (Years)'); 
% ylabel('DPOAE average'); 
% 
% figure; 
% plot(DPhfa_nexp_F, EHFA_nexp_F, 'x', DPhfa_nexp_M, EHFA_nexp_M, 'o')
% title('HF DP vs EHF aud')
% xlabel('HF DPOAE Avg Amplitude')
% ylabel('Extended DPOAE Avg Amplitude')
% 
% figure; 
% plot(DPhfa, EHFA, 'x')
% title('HF DP vs EHF aud')
% xlabel('HF DPOAE Avg Amplitude')
% ylabel('Extended DPOAE Avg Amplitude')
% 
% 
% 
% matrix = [Age, DPehfa, DPhfa, EHFA, HFA, Gender10, Group10]; 
% [rho, pval] = corr(matrix)
% 
% % %% 
% % lineapp = 'k:';
% % nfloor = mean(DPsweptDATAuse.DPvFreq_dB{LevelIND}.chinAVG.dp_noise_dB, 1);
% % semilogx(DPsweptDATAuse.F2freq_Hz, nfloor,...
% %     lineapp, 'linew', 2);
% % %Format figure
% % hold off;
% % xlim(XLIMITS_Hz); ylim(YLIMITS_dBSPL) % use same for all plots
% % xlabel('F2 Frequency (Hz)', 'FontSize', fsize);
% % ylabel('DPOAE Level (dB SPL)', 'FontSize', fsize);
% % set(gca, 'FontSize', fsize);
% % set(gca,'xscale','log','XTick',[1000 10000],'XTickLabel',{' '},'linew',2);  % Need to hack to get Xaxis labels right
% % text(2000,1.05*YLIMITS_dBSPL(1),'2000','HorizontalAlignment','center','VerticalAlignment','top','FontSize',fsize)
% % text(4000,1.05*YLIMITS_dBSPL(1),'4000','HorizontalAlignment','center','VerticalAlignment','top','FontSize',fsize)
% % text(8000,1.05*YLIMITS_dBSPL(1),'8000','HorizontalAlignment','center','VerticalAlignment','top','FontSize',fsize)
% % text(16000,1.05*YLIMITS_dBSPL(1),'16000','HorizontalAlignment','center','VerticalAlignment','top','FontSize',fsize)
% % grid on;
% % text(2100, 3, 'Noise Floor', 'FontSize', fsize);
% % h=legend(plotnum(:),legendstr{:},'Location','southeast');
% % set(h,'FontSize',16);
% % set(gcf, 'units', 'normalized', 'position', [.1 .1 .6 .6]);