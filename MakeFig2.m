%% Figure 2 plot
% Age vs DPOaE 
function [fig2] = MakeFig2(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 params.fig.width params.fig.height]}; % xcor, ycor, xwid, yheight


fig2 = figure(2); clf
set(gcf,figure_prop_name,figure_prop_val);

% EHF
scatter(data.Age, data.EHFA, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_5, 'MarkerEdgeColor', params.color_5)
hold on; 
% HF
scatter(data.Age, data.HFA, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_4, 'MarkerEdgeColor', params.color_4)

% text(params.ABC.Xcorr, params.ABC.Ycorr,'B','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('Age vs Audiometry', 'FontSize', params.TitleFontSize); 
% subtitle('9-16 kHz', 'FontSize', params.TitleFontSize - 2); 
xlabel('Age (Years)'); 
ylabel('Threshold (dB HL)'); 
xlim([15 65]); 
ylim(params.Audio_axis); 

set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

end
