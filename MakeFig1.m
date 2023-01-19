%% Plot 
function MakeFig1(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 5 5]}; % xcor, ycor, xwid, yheight


fig1 = figure(1); 
plot(data.HFA_ctrl_M, data.DPhfa_ctrl_M, 'Marker', params) 
plot(HFA_ctrl_F, DPhfa_ctrl_F, 'ok') 
hold on; 
plot(HFA_nexp_M, DPhfa_nexp_M, 'xr', HFA_nexp_F, DPhfa_nexp_F, 'or') 
hold on; 
plot(HFA_ma_M, DPhfa_ma_M, 'xb', HFA_ma_F, DPhfa_ma_F); 
legend('ctrl M', 'ctrl F', 'nexp M', 'nexp F', 'ma M', 'ma F'); 
title('High Frequency'); 
xlabel('Audiometry'); 
ylabel('DPOAE'); 



end; 
