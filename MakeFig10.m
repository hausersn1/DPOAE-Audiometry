%% Figure 10 
% Swept DPOAE example
function [fig10] = MakeFig10(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 params.fig.width params.fig.height]}; % xcor, ycor, xwid, yheight

fig10 = figure(10); clf
set(gcf,figure_prop_name,figure_prop_val);

plot(data.freq, stim.dp, 'linew', params.LineWidth, 'Color', params.color_5)
hold on; 
plot(data.freq, stim.noisefloor, 'linew', params.LineWidth, 'Color', params.color_5, ...
    'LineStyle', '--')

% text(params.ABC.Xcorr, params.ABC.Ycorr,'B','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('Age vs DPOAE', 'FontSize', params.TitleFontSize); 
% subtitle('9-16 kHz', 'FontSize', params.TitleFontSize - 2); 
legend('DPOAE', 'Noise Floor', 'FontSize', params.LableFontSize); 
xlabel('Frequency (kHz)'); 
ylabel('Amplitude dB');  
xlim(params.DP_axis); 

set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

end
