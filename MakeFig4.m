%% Figure 4 plot
% plots plots both EHF and HF aud vs dp on same graph
function [fig4] = MakeFig4(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 16 7]}; % xcor, ycor, xwid, yheight


fig4 = figure(4); clf
set(gcf,figure_prop_name,figure_prop_val);

% EHF
h1 = subplot(1,2,2); 
scatter(data.EHFA_ctrl_M, data.DPehfa_ctrl_M, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_2, 'MarkerEdgeColor', params.color_2)
hold on; 
scatter(data.EHFA_nexp_M, data.DPehfa_nexp_M, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_4, 'MarkerEdgeColor', params.color_4)
scatter(data.EHFA_ctrl_F, data.DPehfa_ctrl_F, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_2, 'MarkerEdgeColor', params.color_2)
scatter(data.EHFA_nexp_F, data.DPehfa_nexp_F, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_4, 'MarkerEdgeColor', params.color_4)

% Lines to mark "normal"
hold on; 
plot([-20, 80], [-25, -25], '--', 'LineWidth', params.LineWidth, 'Color', params.LineColor) % OAE noise floor
plot([25, 25], [-40, 30], '--', 'LineWidth', params.LineWidth, 'Color', params.LineColor) % normal hearing cut-off
hold off; 

% text(params.ABC.Xcorr, params.ABC.Ycorr,'B','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('Extended High-Frequency', 'FontSize', params.TitleFontSize); 
subtitle('9-16 kHz', 'FontSize', params.TitleFontSize - 2); 
%xlabel('Audiometric Threshold (dB HL)'); 
%ylabel('DPOAE Amplitude (dB EPL)'); 
xlim([-10 50]); 
ylim(params.DP_axis); 


set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

% HF
h2 = subplot(1,2,1); 
scatter(data.HFA_ctrl_M, data.DPhfa_ctrl_M, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_2, 'MarkerEdgeColor', params.color_2)
hold on; 
scatter(data.HFA_nexp_M, data.DPhfa_nexp_M, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_4, 'MarkerEdgeColor', params.color_4)
scatter(data.HFA_ctrl_F, data.DPhfa_ctrl_F, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_2, 'MarkerEdgeColor', params.color_2)
scatter(data.HFA_nexp_F, data.DPhfa_nexp_F, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_4, 'MarkerEdgeColor', params.color_4)

% Lines to mark "normal"
hold on; 
plot([-20, 80], [-25, -25], '--', 'LineWidth', params.LineWidth, 'Color', params.LineColor) % OAE noise floor
plot([25, 25], [-40, 30], '--', 'LineWidth', params.LineWidth, 'Color', params.LineColor) % normal hearing cut-off
hold off; 

% text(params.ABC.Xcorr, params.ABC.Ycorr,'B','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('High-Frequency', 'FontSize', params.TitleFontSize); 
subtitle('3-8 kHz', 'FontSize', params.TitleFontSize - 2); 
%xlabel('Audiometric Threshold (dB HL)', 'Units', 'Inches', 'Position', [6.75, -0.5, 0] ); 
ylabel('DPOAE Amplitude (dB EPL)'); 
xlim([-10 30]); 
ylim(params.DP_axis); 


set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

end
