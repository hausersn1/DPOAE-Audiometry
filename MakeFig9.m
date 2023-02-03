%% Figure 9 plot
% Plot FPL std smoothed 

function [fig9] = MakeFig9(params)

load('STD_FPL_for_plotting.mat', 'f', 'FPL_std_smoothed'); 

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 10 7]}; % xcor, ycor, xwid, yheight

fig9 = figure(9); clf
set(gcf,figure_prop_name,figure_prop_val);

plot(f/1000, FPL_std_smoothed, 'linew', params.LineWidth, 'Color', params.color_3);

text(0.9, 13,'n = 166','FontSize',params.ABCFontSize,'Color','k', 'FontName', params.Font)
% title('Variability in Level with Constant Voltage Stimulation', 'FontSize', params.TitleFontSize);
xlabel('Frequency (kHz)');
ylabel({'STD of Forward'; 'Pressure Level (dB)'});
xlim([0.5 24]); 
ylim([0 16]); 

set(gca, 'FontName', params.Font, 'XTick',[0.5, 1, 2, 4, 8, 16], ...
    'YTick', [0 4 8 12 16], 'FontSize', params.LabelFontSize, 'TickLength', ...
    params.TickLength, 'xscale', 'log')

end
