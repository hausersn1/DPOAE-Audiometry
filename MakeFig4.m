%% Figure 4 plot
% plots plots both EHF and HF aud vs dp on same graph
function [fig4] = MakeFig4(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 params.fig.width params.fig.height]}; % xcor, ycor, xwid, yheight


fig4 = figure(4); clf
set(gcf,figure_prop_name,figure_prop_val);

% EHF
scatter(data.EHFA, data.DPehfa, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_5, 'MarkerEdgeColor', params.color_5)
hold on; 
% HF
scatter(data.HFA, data.DPhfa, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_4, 'MarkerEdgeColor', params.color_4)


% Lines to mark "normal"
hold on; 
plot([-20, 80], [-25, -25], '--', 'LineWidth', params.LineWidth, 'Color', params.LineColor) % OAE noise floor
plot([25, 25], [-40, 30], '--', 'LineWidth', params.LineWidth, 'Color', params.LineColor) % normal hearing cut-off
hold off; 

% text(params.ABC.Xcorr, params.ABC.Ycorr,'B','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('Extended High-Frequency', 'FontSize', params.TitleFontSize); 
subtitle('9-16 kHz', 'FontSize', params.TitleFontSize - 2); 
xlabel('Audiometric Threshold (dB HL)'); 
ylabel('DPOAE Amplitude (dB EPL)'); 
xlim([-10 80]); 
ylim(params.DP_axis); 

set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

end
