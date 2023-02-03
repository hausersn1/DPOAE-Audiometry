%% Figure 7 plot
% Plot calibration variation

function [fig7] = MakeFig7(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 10 7]}; % xcor, ycor, xwid, yheight

fig7 = figure(7); clf
set(gcf,figure_prop_name,figure_prop_val);

set(gca, 'FontName', params.Font, 'XTick',[0.25, 0.5, 1, 2, 4, 8, 16], ...
    'FontSize', params.LabelFontSize, 'TickLength', params.TickLength, ...
    'xscale', 'log')

colors = [params.color_1, params.color_2, params.color_5, params.color_4, params.color_3, params.color_1, params.color_2, params.color_5, params.color_4, params.color_3,]; 

for i = [1, 2, 3]
    % Load calib file before running
    load(data{i});
    % Plot transfer function
    hold on;
    plot(calib.freq * 1e-3, db(abs(calib.Pfor)), 'linew', params.LineWidth, 'Color', colors(i));
    hold off; 
end

% text(params.ABC.Xcorr, params.ABC.Ycorr,'B','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('In-Ear Calibration', 'FontSize', params.TitleFontSize);
% subtitle('9-16 kHz', 'FontSize', params.TitleFontSize - 2);
xlabel('Frequency (kHz)');
ylabel('Transfer Function (dB FPL/V)');
xlim([0.2, 24]);
legend('Subject A', 'Subject B', 'Subject C', 'Units', 'normalized', 'Position', [.25 .3 .1 .2]); 


end
