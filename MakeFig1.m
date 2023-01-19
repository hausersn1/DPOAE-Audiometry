%% Figure 1 plot
% plots HFA vs DP HF
function [fig1] = MakeFig1(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 5 6]}; % xcor, ycor, xwid, yheight


fig1 = figure(1); clf
set(gcf,figure_prop_name,figure_prop_val);

scatter(data.HFA_ctrl_M, data.DPhfa_ctrl_M, 'Marker', params.sym_ctrl_M, 'SizeData', params.MarkerSize, 'MarkerFaceColor', params.color_ctrl_M, 'MarkerEdgeColor', params.color_ctrl_M) 
hold on; 
scatter(data.HFA_ctrl_F, data.DPhfa_ctrl_F, 'Marker', params.sym_ctrl_F, 'SizeData', params.MarkerSize, 'MarkerFaceColor', params.color_ctrl_F, 'MarkerEdgeColor', params.color_ctrl_F) 
scatter(data.HFA_nexp_M, data.DPhfa_nexp_M, 'Marker', params.sym_nexp_M, 'SizeData', params.MarkerSize, 'MarkerFaceColor', params.color_nexp_M, 'MarkerEdgeColor', params.color_nexp_M) 
scatter(data.HFA_nexp_F, data.DPhfa_nexp_F, 'Marker', params.sym_nexp_F, 'SizeData', params.MarkerSize, 'MarkerFaceColor', params.color_nexp_F, 'MarkerEdgeColor', params.color_nexp_F) 
scatter(data.HFA_ma_M, data.DPhfa_ma_M, 'Marker', params.sym_ma_M, 'SizeData', params.MarkerSize, 'MarkerFaceColor', params.color_ma_M, 'MarkerEdgeColor', params.color_ma_M) 
scatter(data.HFA_ma_F, data.DPhfa_ma_F, 'Marker', params.sym_ma_F, 'SizeData', params.MarkerSize, 'MarkerFaceColor', params.color_ma_F, 'MarkerEdgeColor', params.color_ma_F) 
hold off; 

text(params.ABC.Xcorr, params.ABC.Ycorr,'A','FontSize',params.ABCFontSize,'Color','k','Units','norm')
legend('ctrl M', 'ctrl F', 'nexp M', 'nexp F', 'ma M', 'ma F'); 
title('High-Frequency', 'FontSize', params.TitleFontSize); 
xlabel('Audiometry'); 
ylabel('DPOAE'); 

set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

end
