table = readtable('Mai_et_al_ABR_DPOAE_PTA.csv'); 

Age = table{:,2};
Gender = table{:,3};
Group = table{:,4};
LFA = table{:, 5}; 
HFA = table{:, 6}; 
DPhfa = table{:, 10}; 
EHFA = table{:, 7}; 
DPehfa = table{:, 11}; 

LFA_ctrl_M = []; 
HFA_ctrl_M = [];
EHFA_ctrl_M = [];
DPhfa_ctrl_M = [];
DPehfa_ctrl_M = [];
LFA_ctrl_F = []; 
HFA_ctrl_F = [];
EHFA_ctrl_F = [];
DPhfa_ctrl_F = [];
DPehfa_ctrl_F = [];
LFA_nexp_M = []; 
HFA_nexp_M = [];
EHFA_nexp_M = [];
DPhfa_nexp_M = [];
DPehfa_nexp_M = [];
LFA_nexp_F = []; 
HFA_nexp_F = [];
EHFA_nexp_F = [];
DPhfa_nexp_F = [];
DPehfa_nexp_F = [];
LFA_ma_M = []; 
HFA_ma_M = [];
EHFA_ma_M = [];
DPhfa_ma_M = [];
DPehfa_ma_M = [];
LFA_ma_F = []; 
HFA_ma_F = [];
EHFA_ma_F = [];
DPhfa_ma_F = [];
DPehfa_ma_F = [];


for i = 1:length(LFA)
    if strcmp(Group(i,1), 'ctrl') && strcmp(Gender(i,1), 'M')
    LFA_ctrl_M = vertcat(LFA_ctrl_M, LFA(i,1));
    HFA_ctrl_M = vertcat(HFA_ctrl_M, HFA(i,1));
    EHFA_ctrl_M = vertcat(EHFA_ctrl_M, EHFA(i,1));
    DPhfa_ctrl_M = vertcat(DPhfa_ctrl_M, DPhfa(i,1));
    DPehfa_ctrl_M = vertcat(DPehfa_ctrl_M, DPehfa(i,1));
    
    elseif strcmp(Group(i,1), 'ctrl') && strcmp(Gender(i,1), 'F')
    LFA_ctrl_F = vertcat(LFA_ctrl_F, LFA(i,1));
    HFA_ctrl_F = vertcat(HFA_ctrl_F, HFA(i,1));
    EHFA_ctrl_F = vertcat(EHFA_ctrl_F, EHFA(i,1));
    DPhfa_ctrl_F = vertcat(DPhfa_ctrl_F, DPhfa(i,1));
    DPehfa_ctrl_F = vertcat(DPehfa_ctrl_F, DPehfa(i,1));
    
    elseif strcmp(Group(i,1), 'nexp') && strcmp(Gender(i,1), 'M')
    LFA_nexp_M = vertcat(LFA_nexp_M, LFA(i,1));
    HFA_nexp_M = vertcat(HFA_nexp_M, HFA(i,1));
    EHFA_nexp_M = vertcat(EHFA_nexp_M, EHFA(i,1));
    DPhfa_nexp_M = vertcat(DPhfa_nexp_M, DPhfa(i,1));
    DPehfa_nexp_M = vertcat(DPehfa_nexp_M, DPehfa(i,1));
    
    elseif strcmp(Group(i,1), 'nexp') && strcmp(Gender(i,1), 'F')
    LFA_nexp_F = vertcat(LFA_nexp_F, LFA(i,1));
    HFA_nexp_F = vertcat(HFA_nexp_F, HFA(i,1));
    EHFA_nexp_F = vertcat(EHFA_nexp_F, EHFA(i,1));
    DPhfa_nexp_F = vertcat(DPhfa_nexp_F, DPhfa(i,1));
    DPehfa_nexp_F = vertcat(DPehfa_nexp_F, DPehfa(i,1));
        
    elseif strcmp(Group(i,1), 'ma') && strcmp(Gender(i,1), 'M')
    LFA_ma_M = vertcat(LFA_ma_M, LFA(i,1));
    HFA_ma_M = vertcat(HFA_ma_M, HFA(i,1));
    EHFA_ma_M = vertcat(EHFA_ma_M, EHFA(i,1));
    DPhfa_ma_M = vertcat(DPhfa_ma_M, DPhfa(i,1));
    DPehfa_ma_M = vertcat(DPehfa_ma_M, DPehfa(i,1));
    
    else 
    LFA_ma_F = vertcat(LFA_ma_F, LFA(i,1));
    HFA_ma_F = vertcat(HFA_ma_F, HFA(i,1));
    EHFA_ma_F = vertcat(EHFA_ma_F, EHFA(i,1));
    DPhfa_ma_F = vertcat(DPhfa_ma_F, DPhfa(i,1));
    DPehfa_ma_F = vertcat(DPehfa_ma_F, DPehfa(i,1));
    
    end
end

Gender10= []; 
for k=1:length(Gender)
    if Gender{k} == "M"
        Gender10(k)=1; 
    else 
        Gender10(k)=0; 
    end
end
Gender10=Gender10'; 
Group10= []; 
for k=1:length(Group)
    if Group{k} == "ctrl"
        Group10(k)=0; 
    elseif Group{k} == "nexp"
        Group10(k)=1; 
    else
        Group10(k)=2; 
    end
end
Group10=Group10'; 

%% Plotting
figure; 
plot(HFA_ctrl_M, DPhfa_ctrl_M, 'xk', HFA_ctrl_F, DPhfa_ctrl_F, 'ok', ...
    HFA_nexp_M, DPhfa_nexp_M, 'xr', HFA_nexp_F, DPhfa_nexp_F, 'or', ...
    HFA_ma_M, DPhfa_ma_M, 'xb', HFA_ma_F, DPhfa_ma_F, 'ob', 'MarkerSize', 7, 'MarkerFaceColor', 'auto'); 
legend('ctrl M', 'ctrl F', 'nexp M', 'nexp F', 'ma M', 'ma F'); 
title('High Frequency'); 
xlabel('HF PTA'); 
ylabel('Avg HF DPOAE Amplitude'); 

figure; 
plot(EHFA_ctrl_M, DPehfa_ctrl_M, 'xk', EHFA_ctrl_F, DPehfa_ctrl_F, 'ok', ...
    EHFA_nexp_M, DPehfa_nexp_M, 'xr', EHFA_nexp_F, DPehfa_nexp_F, 'or', ...
    EHFA_ma_M, DPehfa_ma_M, 'xb', EHFA_ma_F, DPehfa_ma_F, 'ob'); 
legend('ctrl M', 'ctrl F', 'nexp M', 'nexp F', 'ma M', 'ma F'); 
title('Extended High Frequency'); 
xlabel('Extended HF PTA'); 
ylabel('Avg EHF DPOAE Amplitude'); 

% age correlated with EHFA, but not HFA in this group 
figure; 
plot(Age, HFA, 'x', Age, EHFA, 'o') 
title('Age vs Threshold')
legend('HF', 'EHF')
xlabel('Age (Years)'); 
ylabel('Threshold dBHL'); 

% basically everyones EHF dpoaes are worse than their HF, but age not
% correlated
figure; 
plot(Age, DPhfa, 'x', Age, DPehfa, 'o')
title('Age vs DPOAE')
legend('HF', 'EHF')
xlabel('Age (Years)'); 
ylabel('DPOAE average'); 

figure; 
plot(DPhfa_nexp_F, EHFA_nexp_F, 'x', DPhfa_nexp_M, EHFA_nexp_M, 'o')
title('HF DP vs EHF aud')
xlabel('HF DPOAE Avg Amplitude')
ylabel('Extended DPOAE Avg Amplitude')

figure; 
plot((HFA-EHFA), (DPhfa-DPehfa), 'x')
title('HF DP vs EHF aud')
ylabel('HF DPOAE Avg Amplitude')
xlabel('Extended HF Audio')


plot(HFA_ctrl_M, DPhfa_ctrl_M, 'xk', HFA_ctrl_F, DPhfa_ctrl_F, 'ok', ...
    HFA_nexp_M, DPhfa_nexp_M, 'xr', HFA_nexp_F, DPhfa_nexp_F, 'or', ...
    HFA_ma_M, DPhfa_ma_M, 'xb', HFA_ma_F, DPhfa_ma_F, 'ob', 'MarkerSize', 7, 'MarkerFaceColor', 'auto'); 
legend('ctrl M', 'ctrl F', 'nexp M', 'nexp F', 'ma M', 'ma F'); 
title('High Frequency'); 
xlabel('HF PTA'); 
ylabel('Avg HF DPOAE Amplitude'); 



matrix = [Age, DPehfa, DPhfa, EHFA, HFA, Gender10, Group10]; 
[rho, pval] = corr(matrix)

% %% 
% lineapp = 'k:';
% nfloor = mean(DPsweptDATAuse.DPvFreq_dB{LevelIND}.chinAVG.dp_noise_dB, 1);
% semilogx(DPsweptDATAuse.F2freq_Hz, nfloor,...
%     lineapp, 'linew', 2);
% %Format figure
% hold off;
% xlim(XLIMITS_Hz); ylim(YLIMITS_dBSPL) % use same for all plots
% xlabel('F2 Frequency (Hz)', 'FontSize', fsize);
% ylabel('DPOAE Level (dB SPL)', 'FontSize', fsize);
% set(gca, 'FontSize', fsize);
% set(gca,'xscale','log','XTick',[1000 10000],'XTickLabel',{' '},'linew',2);  % Need to hack to get Xaxis labels right
% text(2000,1.05*YLIMITS_dBSPL(1),'2000','HorizontalAlignment','center','VerticalAlignment','top','FontSize',fsize)
% text(4000,1.05*YLIMITS_dBSPL(1),'4000','HorizontalAlignment','center','VerticalAlignment','top','FontSize',fsize)
% text(8000,1.05*YLIMITS_dBSPL(1),'8000','HorizontalAlignment','center','VerticalAlignment','top','FontSize',fsize)
% text(16000,1.05*YLIMITS_dBSPL(1),'16000','HorizontalAlignment','center','VerticalAlignment','top','FontSize',fsize)
% grid on;
% text(2100, 3, 'Noise Floor', 'FontSize', fsize);
% h=legend(plotnum(:),legendstr{:},'Location','southeast');
% set(h,'FontSize',16);
% set(gcf, 'units', 'normalized', 'position', [.1 .1 .6 .6]);