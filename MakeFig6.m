%% Figure 6 plot
% high frequency DPOAE vs extend HF audiometry
% Does running OAEs help you predict damage at audiometric range you're not
% testing? 

function [fig6] = MakeFig6(data, params)

figure_prop_name = {'PaperPositionMode', 'units', 'Position'};
figure_prop_val = {'auto', 'inches', [1 1 params.fig.width params.fig.height]}; % xcor, ycor, xwid, yheight


fig6 = figure(6); clf
set(gcf,figure_prop_name,figure_prop_val);

% EHF
scatter(data.DPhfa, data.EHFA, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
    'MarkerFaceColor', params.color_5, 'MarkerEdgeColor', params.color_5)
hold on; 
% HF
% scatter(data.Age, data.DPhfa, 'Marker', params.sym_F, 'SizeData', params.SizeData, ...
%     'MarkerFaceColor', params.color_4, 'MarkerEdgeColor', params.color_4)

% text(params.ABC.Xcorr, params.ABC.Ycorr,'B','FontSize',params.ABCFontSize,'Color','k','Units','norm')
title('Age vs DPOAE', 'FontSize', params.TitleFontSize); 
% subtitle('9-16 kHz', 'FontSize', params.TitleFontSize - 2); 
xlabel('DPOAE Amplitude (dB EPL)'); 
ylabel('EHF average thresh (dB HL)'); 
ylim([-15 65]); 
xlim(params.DP_axis); 

set(gca, 'FontName', params.Font, 'FontSize', params.LabelFontSize, 'TickLength', params.TickLength)

end
