table = readtable('syndata.csv'); 

Age = table{:,2};
Gender = table{:,3};
Group = table{:,4};
LFA = table{:, 5}; 
HFA = table{:, 6}; 
EHFA = table{:, 7}; 
w1 = table{:, 8}; 
w5 = table{:, 9}; 
DPhfa = table{:, 10}; 
DPehfa = table{:, 11}; 
MEMRBB = table{:, 12}; % at highest level
MEMRHP = table{:, 13}; 

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
    HFA_ma_M, DPhfa_ma_M, 'xb', HFA_ma_F, DPhfa_ma_F, 'ob'); 
legend('ctrl M', 'ctrl F', 'nexp M', 'nexp F', 'ma M', 'ma F'); 
title('High Frequency'); 
xlabel('Audiometry'); 
ylabel('DPOAE'); 

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

matrix = [Age, DPehfa, DPhfa, EHFA, HFA, Gender10, Group10, MEMRHP, MEMRBB, w1, w5]; 
[rho, pval] = corr(matrix)