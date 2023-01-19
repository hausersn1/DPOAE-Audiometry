table = readtable('Mai_et_al_ABR_DPOAE_PTA.csv'); 

Age = table{:,2};
Gender = table{:,3};
Group = table{:,4};
LFA = table{:, 5}; 
HFA = table{:, 6}; 
DPhfa = table{:, 10}; 
EHFA = table{:, 7}; 
DPehfa = table{:, 11}; 

data.LFA_ctrl_M = []; 
data.HFA_ctrl_M = [];
data.EHFA_ctrl_M = [];
data.DPhfa_ctrl_M = [];
data.DPehfa_ctrl_M = [];
data.LFA_ctrl_F = []; 
data.HFA_ctrl_F = [];
data.EHFA_ctrl_F = [];
data.DPhfa_ctrl_F = [];
data.DPehfa_ctrl_F = [];
data.LFA_nexp_M = []; 
data.HFA_nexp_M = [];
data.EHFA_nexp_M = [];
data.DPhfa_nexp_M = [];
data.DPehfa_nexp_M = [];
data.LFA_nexp_F = []; 
data.HFA_nexp_F = [];
data.EHFA_nexp_F = [];
data.DPhfa_nexp_F = [];
data.DPehfa_nexp_F = [];
data.LFA_ma_M = []; 
data.HFA_ma_M = [];
data.EHFA_ma_M = [];
data.DPhfa_ma_M = [];
data.DPehfa_ma_M = [];
data.LFA_ma_F = []; 
data.HFA_ma_F = [];
data.EHFA_ma_F = [];
data.DPhfa_ma_F = [];
data.DPehfa_ma_F = [];


for i = 1:length(LFA)
    if strcmp(Group(i,1), 'ctrl') && strcmp(Gender(i,1), 'M')
    data.LFA_ctrl_M = vertcat(LFA_ctrl_M, LFA(i,1));
    data.HFA_ctrl_M = vertcat(HFA_ctrl_M, HFA(i,1));
    data.EHFA_ctrl_M = vertcat(EHFA_ctrl_M, EHFA(i,1));
    data.DPhfa_ctrl_M = vertcat(DPhfa_ctrl_M, DPhfa(i,1));
    data.DPehfa_ctrl_M = vertcat(DPehfa_ctrl_M, DPehfa(i,1));
    
    elseif strcmp(Group(i,1), 'ctrl') && strcmp(Gender(i,1), 'F')
    data.LFA_ctrl_F = vertcat(LFA_ctrl_F, LFA(i,1));
    data.HFA_ctrl_F = vertcat(HFA_ctrl_F, HFA(i,1));
    data.EHFA_ctrl_F = vertcat(EHFA_ctrl_F, EHFA(i,1));
    data.DPhfa_ctrl_F = vertcat(DPhfa_ctrl_F, DPhfa(i,1));
    data.DPehfa_ctrl_F = vertcat(DPehfa_ctrl_F, DPehfa(i,1));
    
    elseif strcmp(Group(i,1), 'nexp') && strcmp(Gender(i,1), 'M')
    data.LFA_nexp_M = vertcat(LFA_nexp_M, LFA(i,1));
    data.HFA_nexp_M = vertcat(HFA_nexp_M, HFA(i,1));
    data.EHFA_nexp_M = vertcat(EHFA_nexp_M, EHFA(i,1));
    data.DPhfa_nexp_M = vertcat(DPhfa_nexp_M, DPhfa(i,1));
    data.DPehfa_nexp_M = vertcat(DPehfa_nexp_M, DPehfa(i,1));
    
    elseif strcmp(Group(i,1), 'nexp') && strcmp(Gender(i,1), 'F')
    data.LFA_nexp_F = vertcat(LFA_nexp_F, LFA(i,1));
    data.HFA_nexp_F = vertcat(HFA_nexp_F, HFA(i,1));
    data.EHFA_nexp_F = vertcat(EHFA_nexp_F, EHFA(i,1));
    data.DPhfa_nexp_F = vertcat(DPhfa_nexp_F, DPhfa(i,1));
    data.DPehfa_nexp_F = vertcat(DPehfa_nexp_F, DPehfa(i,1));
        
    elseif strcmp(Group(i,1), 'ma') && strcmp(Gender(i,1), 'M')
    data.LFA_ma_M = vertcat(LFA_ma_M, LFA(i,1));
    data.HFA_ma_M = vertcat(HFA_ma_M, HFA(i,1));
    data.EHFA_ma_M = vertcat(EHFA_ma_M, EHFA(i,1));
    data.DPhfa_ma_M = vertcat(DPhfa_ma_M, DPhfa(i,1));
    data.DPehfa_ma_M = vertcat(DPehfa_ma_M, DPehfa(i,1));
    
    else 
    data.LFA_ma_F = vertcat(LFA_ma_F, LFA(i,1));
    data.HFA_ma_F = vertcat(HFA_ma_F, HFA(i,1));
    data.EHFA_ma_F = vertcat(EHFA_ma_F, EHFA(i,1));
    data.DPhfa_ma_F = vertcat(DPhfa_ma_F, DPhfa(i,1));
    data.DPehfa_ma_F = vertcat(DPehfa_ma_F, DPehfa(i,1));
    
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
data.Gender10=Gender10'; 

Group10= []; 
for k=1:length(Group)
    if Group{k} == "ctrl"
        Group10(k)=0; 
    elseif Group{k} == "nexp"
        Group10(k)=1; 
    else
        Group10(k)=2; % middle aged (ma) 
    end
end
data.Group10=Group10'; 

%% Plotting

% Symbols and colors
params.sym_ctrl_M = 'x'; 
params.sym_ctrl_F = 'o'; 
params.sym_nexp_M = 'x'; 
params.sym_nexp_F = 'o'; 
params.sym_ma_M = 'x'; 
params.sym_ma_F = 'o'; 
params.color_ctrl_M = 'k'; 
params.color_ctrl_F = 'k'; 
params.color_nexp_M = 'r'; 
params.color_nexp_F = 'r'; 
params.color_ma_M = 'b'; 
params.color_ma_F = 'b'; 
params.TickLength = 0.025; 
params.LabelFontSize = 16; 
params.ABCFontSize = 20; 
params.TitleFontSize = 24; 
params.Font = 'Ariel'; 

% Make figure 1; 
MakeFig1(data, params); 



figure; 
plot(EHFA_ctrl_M, DPehfa_ctrl_M, 'xk', EHFA_ctrl_F, DPehfa_ctrl_F, 'ok', ...
    EHFA_nexp_M, DPehfa_nexp_M, 'xr', EHFA_nexp_F, DPehfa_nexp_F, 'or', ...
    EHFA_ma_M, DPehfa_ma_M, 'xb', EHFA_ma_F, DPehfa_ma_F, 'ob'); 
legend('ctrl M', 'ctrl F', 'nexp M', 'nexp F', 'ma M', 'ma F'); 
title('Extended High Frequency'); 
xlabel('Audiometry'); 
ylabel('DPOAE'); 

% age correlated with EHFA, but not HFA in this group 
figure; 
plot(Age, HFA, 'x', Age, EHFA, 'o') 
title('Age vs Threshold')
legend('HF', 'EHF')

% basically everyones EHF dpoaes are worse than their HF, but age not
% correlated
figure; 
plot(Age, DPhfa, 'x', Age, DPehfa, 'o')
title('Age vs DPOAE')
legend('HF', 'EHF')

figure; 
plot(DPhfa_nexp_F, EHFA_nexp_F, 'x', DPhfa_nexp_M, EHFA_nexp_M, 'o')
title('HF DP vs EHF aud')
xlabel('hf')
ylabel('ehfa')

matrix = [Age, DPehfa, DPhfa, EHFA, HFA, Gender10, Group10]; 
[rho, pval] = corr(matrix)