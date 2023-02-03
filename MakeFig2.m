%% Figure 2 plot
% Age vs DPOaE 
% HF and EHF on the same plot
function [fig2] = MakeFig2(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 params.fig.width params.fig.height]}; % xcor, ycor, xwid, yheight


fig2 = figure(2); clf
set(gcf,figure_prop_name,figure_prop_val);


% HF
scatter(data.Age, data.HFA, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
     'MarkerEdgeColor', params.color_4, 'MarkerFaceColor', params.color_4)
hold on; 

% EHF
scatter(data.Age, data.EHFA, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
     'MarkerEdgeColor', params.color_5, 'MarkerFaceColor', params.color_5)

 
mb = polyfit(data.Age, data.HFA, 1); 
xfit = (min(data.Age)-3: max(data.Age)+3); 
yfit = polyval(mb, xfit); 
plot(xfit, yfit, 'LineWidth', 2, 'Color', params.color_4)
mb = polyfit(data.Age, data.EHFA, 1); 
xfit = (min(data.Age)-3: max(data.Age)+3); 
yfit = polyval(mb, xfit); 
plot(xfit, yfit, 'LineWidth', 2, 'Color', params.color_5)
 
% text(params.ABC.Xcorr, params.ABC.Ycorr,'B','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('Audiometry', 'FontSize', params.TitleFontSize); 
% subtitle('9-16 kHz', 'FontSize', params.TitleFontSize - 2); 
xlabel('Age (Years)'); 
ylabel('Threshold (dB HL)'); 
xlim([15 65]); 
ylim(params.Audio_axis); 

set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

end
