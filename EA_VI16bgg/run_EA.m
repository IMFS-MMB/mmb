% Financial frictions in the Euro Area and the United States: a Bayesian assessment
% Macroeconomic Dynamics, 20 (05), p. 1313-1340, 2016
% Stefania Villa

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SMETS-WOUTERS & BGG MODEL   [EA]   CHARTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Run and plot IRFs of replication file
clc 
clear all
close all

% Adjust path to folder where replication file is stored
cd([cd '/EA_VI16bgg_rep']);

%% Executing dynare file
dynare EA_VI16bgg_rep

% Saving impulse response function results
load('EA_VI16bgg_rep_results.mat', 'oo_')
irf_saved_ea=oo_.irfs;
save irf_ea

%% Charts for all the shocks

% All IRFs are formated in line with those in Villa's paper

% Capital Quality Shock (e_k)
figure;
ky=subplot(1,5,1);
plot(0:20,irf_saved_ea.y_e_k,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-7 -2];
ax.YTickMode = 'manual';
ax.YTick = [-6 -2];
ax.XTick = [0 5 10 15 20];
title(ky,'GDP');

ki=subplot(1,5,2);
plot(0:20,irf_saved_ea.i_e_k,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-15 0];
ax.XLim = [0 20];
ax.YTickMode = 'manual';
ax.YTick = [-14 -9];
ax.XTick = [0 5 10 15 20];
title(ki,'investment');

kpi=subplot(1,5,3);
plot(0:20,irf_saved_ea.pi_e_k,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-0.6 0.2];
ax.YTickMode = 'manual';
ax.YTick = [-0.4 0.2];
ax.XTick = [0 5 10 15 20];
title(kpi,'inflation');

kn=subplot(1,5,4);
plot(0:20,irf_saved_ea.n_e_k,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-19 -11];
ax.YTickMode = 'manual';
ax.YTick = [-17 -12];
ax.XTick = [0 5 10 15 20];
title(kn,'net worth');

kext_pr=subplot(1,5,5);
plot(0:20,irf_saved_ea.ext_pr_e_k,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-0.05 0.3];
ax.YTickMode = 'manual';
ax.YTick = [0 0.2];
ax.XTick = [0 5 10 15 20];
title(kext_pr,'spread');

sgtitle({'Capital Quality Shock (k)';''}, 'FontSize', 18)
set(gcf,'position',[440,632,1001,166],'PaperSize',[30 6])
print('ea_k','-dpdf','-fillpage')
print('ea_k','-djpeg')
print('ea_k','-depsc')


%% Monetary Policy Shock (e_r)
figure;
ry=subplot(1,5,1);
plot(0:20,irf_saved_ea.y_e_r,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-5 0];
ax.YTickMode = 'manual';
ax.YTick = [-4 -2];
ax.XTick = [0 5 10 15 20];
title(ry,'GDP');

ri=subplot(1,5,2);
plot(0:20,irf_saved_ea.i_e_r,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-12 -2];
ax.YTickMode = 'manual';
ax.YTick = [-12 -6];
ax.XTick = [0 5 10 15 20];
title(ri,'investment');

rpi=subplot(1,5,3);
plot(0:20,irf_saved_ea.pi_e_r,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-0.6 0.1];
ax.YTickMode = 'manual';
ax.YTick = [-0.6 0];
ax.XTick = [0 5 10 15 20];
title(rpi,'inflation');

rn=subplot(1,5,4);
plot(0:20,irf_saved_ea.n_e_r,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-15 -4];
ax.YTickMode = 'manual';
ax.YTick = [-14 -4];
ax.XTick = [0 5 10 15 20];
title(rn,'net worth');

rext_pr=subplot(1,5,5);
plot(0:20,irf_saved_ea.ext_pr_e_r,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [0.0 0.3];
ax.YTickMode = 'manual';
ax.YTick = [0.05 0.2];
ax.XTick = [0 5 10 15 20];
title(rext_pr,'spread');

sgtitle({'Monetary Policy Shock (r)';''}, 'FontSize', 18)
set(gcf,'position',[440,632,1001,166],'PaperSize',[30 6])
print('ea_r','-dpdf','-fillpage')
print('ea_r','-djpeg')
print('ea_r','-depsc')

%% Government Shock (e_g)
figure;
gy=subplot(1,5,1);
plot(0:20,irf_saved_ea.y_e_g,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-0.2 0];
ax.YTickMode = 'manual';
ax.YTick = [-0.2 0];
ax.XTick = [0 5 10 15 20];
ax.YRuler.Exponent = 0;
title(gy,'GDP');

gi=subplot(1,5,2);
plot(0:20,irf_saved_ea.i_e_g,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-0.05 0.1];
ax.YTickMode = 'manual';
ax.YTick = [0 0.1];
ax.XTick = [0 5 10 15 20];
ax.YRuler.Exponent = 0;
title(gi,'investment');

gpi=subplot(1,5,3);
plot(0:20,irf_saved_ea.pi_e_g,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-0.015 0.005];
ax.YTickMode = 'manual';
ax.YTick = [-0.01 0];
ax.XTick = [0 5 10 15 20];
ax.YRuler.Exponent = 0;
title(gpi,'inflation');

gn=subplot(1,5,4);
plot(0:20,irf_saved_ea.n_e_g,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YLim = [-0.065 0.005];
ax.YTickMode = 'manual';
ax.YTick = [-0.06 0];
ax.XTick = [0 5 10 15 20];
ax.YRuler.Exponent = 0;
title(gn,'net worth');

gext_pr=subplot(1,5,5);
plot(0:20,irf_saved_ea.ext_pr_e_g,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [0.0000 0.0025];
ax.YTickMode = 'manual';
ax.YTick = [0.0005 0.0025];
ax.XTick = [0 5 10 15 20];
title(gext_pr,'spread');

sgtitle({'Fiscal Policy Shock (g)';''}, 'FontSize', 18)
set(gcf,'position',[440,632,1001,166],'PaperSize',[30 6])
print('ea_g','-dpdf','-fillpage')
print('ea_g','-djpeg')
print('ea_g','-depsc')

%% Investment-Specific Technology Shock (e_x)
figure;
xy=subplot(1,5,1);
plot(0:20,irf_saved_ea.y_e_x,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-0.1 0.2];
ax.YTickMode = 'manual';
ax.YTick = [-0.1 0.1];
ax.XTick = [0 5 10 15 20];
title(xy,'GDP');

xi=subplot(1,5,2);
plot(0:20,irf_saved_ea.i_e_x,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12;
ax.YRuler.Exponent = 0;
ax.YLim = [0.3 2.7];
ax.YTickMode = 'manual';
ax.YTick = [0.5 2.0];
ax.XTick = [0 5 10 15 20];
title(xi,'investment');

xpi=subplot(1,5,3);
plot(0:20,irf_saved_ea.pi_e_x,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12;
ax.YRuler.Exponent = 0;
ax.YLim = [0.0 0.04];
ax.YTickMode = 'manual';
ax.YTick = [0.0 0.03];
ax.XTick = [0 5 10 15 20];
title(xpi,'inflation');

xn=subplot(1,5,4);
plot(0:20,irf_saved_ea.n_e_x,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [0.0 2.7];
ax.YTickMode = 'manual';
ax.YTick = [1.0 2.5];
ax.XTick = [0 5 10 15 20];
title(xn,'net worth');

xext_pr=subplot(1,5,5);
plot(0:20,irf_saved_ea.ext_pr_e_x,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-0.06 -0.02];
ax.YTickMode = 'manual';
ax.YTick = [-0.04 -0.02];
ax.XTick = [0 5 10 15 20];
ax.YRuler.Exponent = 0;
title(xext_pr,'spread');

sgtitle({'Investment Shock (x)';''}, 'FontSize', 18)
set(gcf,'position',[440,632,1001,166],'PaperSize',[30 6])
print('ea_x','-dpdf','-fillpage')
print('ea_x','-djpeg')
print('ea_x','-depsc')

%% Technology Shock (e_a)
figure;
ay=subplot(1,5,1);
plot(0:20,irf_saved_ea.y_e_a,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-1.0 0.0];
ax.YTickMode = 'manual';
ax.YTick = [-0.8 -0.3];
ax.XTick = [0 5 10 15 20];
title(ay,'GDP');

ai=subplot(1,5,2);
plot(0:20,irf_saved_ea.i_e_a,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-2 0.0];
ax.YTickMode = 'manual';
ax.YTick = [-2 -1 0];
ax.XTick = [0 5 10 15 20];
title(ai,'investment');

api=subplot(1,5,3);
plot(0:20,irf_saved_ea.pi_e_a,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12;
ax.YRuler.Exponent = 0;
ax.YLim = [-0.05 0.15];
ax.YTickMode = 'manual';
ax.YTick = [0.05 0.15];
ax.XTick = [0 5 10 15 20];
title(api,'inflation');

an=subplot(1,5,4);
plot(0:20,irf_saved_ea.n_e_a,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-1.0 0.0];
ax.YTickMode = 'manual';
ax.YTick = [-0.6 -0.4 -0.2 0.0];
ax.XTick = [0 5 10 15 20];
title(an,'net worth');

aext_pr=subplot(1,5,5);
plot(0:20,irf_saved_ea.ext_pr_e_a,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-0.01 0.015];
ax.YTickMode = 'manual';
ax.YTick = [-0.01 -0.005 0 0.005];
ax.XTick = [0 5 10 15 20];
ax.YRuler.Exponent = 0;
title(aext_pr,'spread');

sgtitle({'Technology Shock (a)';''}, 'FontSize', 18)
set(gcf,'position',[440,632,1001,166],'PaperSize',[30 6])
print('ea_a','-dpdf','-fillpage')
print('ea_a','-djpeg')
print('ea_a','-depsc')

%% Price Mark-up Shock (e_p)
figure;
py=subplot(1,5,1);
plot(0:20,irf_saved_ea.y_e_p,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-9 0.0];
ax.YTickMode = 'manual';
ax.YTick = [-8 -6 -4 -2 0];
ax.XTick = [0 5 10 15 20];
title(py,'GDP');

pi=subplot(1,5,2);
plot(0:20,irf_saved_ea.i_e_p,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-20.0 2.0];
ax.YTickMode = 'manual';
ax.YTick = [-20.0 -10 0.];
ax.XTick = [0 5 10 15 20];
title(pi,'investment');

ppi=subplot(1,5,3);
plot(0:20,irf_saved_ea.pi_e_p,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-0.5 3.0];
ax.YTickMode = 'manual';
ax.YTick = [0.0 1 2 3 ];
ax.XTick = [0 5 10 15 20];
title(ppi,'inflation');

pn=subplot(1,5,4);
plot(0:20,irf_saved_ea.n_e_p,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-9.0 1.0];
ax.YTickMode = 'manual';
ax.YTick = [-6.0 -4 -2 0];
ax.XTick = [0 5 10 15 20];
title(pn,'net worth');

pext_pr=subplot(1,5,5);
plot(0:20,irf_saved_ea.ext_pr_e_p,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12;
ax.YRuler.Exponent = 0;
ax.YLim = [-0.1 0.15];
ax.YTickMode = 'manual';
ax.YTick = [-0.1 -0.05 0.0];
ax.XTick = [0 5 10 15 20];
title(pext_pr,'spread');

sgtitle({'Price Mark-up Shock (p)';''}, 'FontSize', 18)
set(gcf,'position',[440,632,1001,166],'PaperSize',[30 6])
print('ea_p','-dpdf','-fillpage')
print('ea_p','-djpeg')
print('ea_p','-depsc')

%% Wage Mark-up Shock (e_w)
figure;
wy=subplot(1,5,1);
plot(0:20,irf_saved_ea.y_e_w,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [-4 0.0];
ax.YTickMode = 'manual';
ax.YTick = [-4 -2  0];
ax.XTick = [0 5 10 15 20];
title(wy,'GDP');

wi=subplot(1,5,2);
plot(0:20,irf_saved_ea.i_e_w,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12; 
ax.YRuler.Exponent = 0;
ax.YLim = [-6 2];
ax.YTickMode = 'manual';
ax.YTick = [-6 -4 -2 0.0 2];
ax.XTick = [0 5 10 15 20];
title(wi,'investment');

wpi=subplot(1,5,3);
plot(0:20,irf_saved_ea.pi_e_w,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [0.0 1.2];
ax.YTickMode = 'manual';
ax.YTick = [0.0 0.5 1];
ax.XTick = [0 5 10 15 20];
title(wpi,'inflation');

wn=subplot(1,5,4);
plot(0:20,irf_saved_ea.n_e_w,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12 ;
ax.YRuler.Exponent = 0;
ax.YLim = [0.0 6.0];
ax.YTickMode = 'manual';
ax.YTick = [2 4 6];
ax.XTick = [0 5 10 15 20];
title(wn,'net worth');

wext_pr=subplot(1,5,5);
plot(0:20,irf_saved_ea.ext_pr_e_w,'LineWidth', 1.5, 'Color','r');
line(xlim(), [0,0], 'LineWidth', 1,'LineStyle','-', 'Color', 'k');
ax = gca;
ax.FontSize = 12;
ax.YRuler.Exponent = 0;
ax.YLim = [-0.14 -0.04];
ax.YTickMode = 'manual';
ax.YTick = [-0.14 -0.09 -0.04];
ax.XTick = [0 5 10 15 20];
title(wext_pr,'spread');

sgtitle({'Wage Mark-up Shock (w)';''}, 'FontSize', 18)
set(gcf,'position',[440,632,1001,166],'PaperSize',[30 6])
print('ea_w','-dpdf','-fillpage')
print('ea_w','-djpeg')
print('ea_w','-depsc')
