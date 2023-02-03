%% Figure 5 plot
% Age vs DPOaE for both EHF and HF
function [fig5] = MakeFig5(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 params.fig.width params.fig.height]}; % xcor, ycor, xwid, yheight


fig5 = figure(5); clf
set(gcf,figure_prop_name,figure_prop_val);

% HF
scatter(data.Age, data.DPhfa, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_4, 'MarkerEdgeColor', params.color_4)
hold on; 
% EHF
scatter(data.Age, data.DPehfa, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_5, 'MarkerEdgeColor', params.color_5)

mb = polyfit(data.Age, data.DPhfa, 1); 
xfit = (min(data.Age)-3: max(data.Age)+3); 
yfit = polyval(mb, xfit); 
plot(xfit, yfit, 'LineWidth', 2, 'Color', params.color_4)
hold on; 
mb = polyfit(data.Age, data.DPehfa, 1); 
xfit = (min(data.Age)-3: max(data.Age)+3); 
yfit = polyval(mb, xfit); 
plot(xfit, yfit, 'LineWidth', 2, 'Color', params.color_5)

% text(params.ABC.Xcorr, params.ABC.Ycorr,'B','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('DPOAE', 'FontSize', params.TitleFontSize); 
% subtitle('9-16 kHz', 'FontSize', params.TitleFontSize - 2); 
xlabel('Age (Years)'); 
ylabel('DPOAE Amplitude (dB EPL)'); 
xlim([15 65]); 
ylim(params.DP_axis); 
legend('3-8 kHz', '9-16 kHz'); 

set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

end
