%% Figure 1 plot
% plots Audiometry vs DP for HF data
function [fig1] = MakeFig1(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 params.fig.width params.fig.height]}; % xcor, ycor, xwid, yheight


fig1 = figure(1); clf
set(gcf,figure_prop_name,figure_prop_val);

% HF
scatter(data.HFA, data.DPhfa, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_4, 'MarkerEdgeColor', params.color_4)

% Lines to mark "normal"
hold on; 
plot([-20, 80], [-25, -25], '--', 'LineWidth', params.LineWidth, 'Color', params.LineColor) % OAE noise floor
plot([25, 25], [-40, 30], '--', 'LineWidth', params.LineWidth, 'Color', params.LineColor) % normal hearing cut-off
hold off; 

% Title, labels, legend
% text(params.ABC.Xcorr, params.ABC.Ycorr,'A','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('High-Frequency', 'FontSize', params.TitleFontSize); 
subtitle('3-8 kHz', 'FontSize', params.TitleFontSize - 2); 
xlabel('Audiometric Threshold (dB HL)'); 
ylabel('DPOAE Amplitude (dB EPL)'); 
xlim([-10 30]); 
ylim(params.DP_axis); 

set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

end
