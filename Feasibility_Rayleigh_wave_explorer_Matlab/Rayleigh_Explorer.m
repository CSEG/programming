%% Program 'Rayleigh_Model'

% OUTPUT
% t = Time vector
% S_1 = Harmonic Signal 1 
% S_2 = Harmonic Signal 2

% INPUT
% t_0,t_1;dt = Min and max time of time vector; dt is sample interval
% A_1,f_1,Phase_1 = Amplitude, frequency (Hz), Phase of Harmonic Signal 1
% A_2,f_2,Phase_2 = Amplitude, frequency (Hz), Phase of Harmonic Signal 2

%% Input

prompt = {'t_0','t_1','dt','A_1','f_1 (Hz)','Phase_1','A_2', ...
         'f_2 (Hz)','Phase_2'};
prompt_title ='Rayleigh Modeling...';
numlines=1;
defaultanswer={'0','8.5','0.01','2','7','0','3','7','60'};
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
answer=inputdlg(prompt,prompt_title,numlines,defaultanswer,options);

%% Output

[t,S_1,S_2] = Harmonics(answer);

%% Visualize the Rayleigh

figure
%
% Limits for the plot
M1 = max(S_1); m1 = min(S_1); 
M2 = max(S_2); m2 = min(S_2);
M = max(M1,M2); m = min(m1,m2);
%
% Set the Harmonics and the Rayleigh 
% with a line colored according to the time vector
x = 1:1:length(S_1);
xi = linspace(1,length(S_1),128);
t_new = interp1(x,t,xi);
S_1new = interp1(x,S_1,xi,'cubic');
S_2new = interp1(x,S_2,xi,'cubic');
%
% Harmonic 1
subplot(3,5,[1,2])
h1 = colormapline(t_new,S_1new,t_new,pmkmp(128,'linearl'));
set(h1,'Linewidth',2.5);
axis([min(t_new) max(t_new) m-0.5 M+0.5]);
xlabel('t','FontSize',14)
ylabel('S_1(t)','Rotation',0,'FontSize',14)
set(gca,'FontSize',13)
title('Harmonic 1','Color','k','FontSize',14);
%
% Harmonic 2
subplot(3,5,[4,5])
h2 = colormapline(t_new,S_2new,t_new,pmkmp(128,'linearl'));
set(h2,'Linewidth',2.5);
axis([min(t_new) max(t_new) m-0.5 M+0.5]);
xlabel('t','FontSize',14)
ylabel('S_2(t)','Rotation',0,'FontSize',14)
set(gca,'FontSize',13)
title('Harmonic 2','Color','b','FontSize',14);
%
% Rayleigh wave
subplot(3,5,[7:9,12:14])
h = colormapline(S_1new,S_2new,t_new,pmkmp(128,'linearl'));
set(h,'Linewidth',0.5,'linestyle','o');
axis equal;
axis([m1-0.2 M1+0.2 m2-0.2 M2+0.2]);
xlabel('S_1(t)','FontSize',14)
ylabel('S_2(t)','Rotation',0,'FontSize',14)
set(gca,'FontSize',13)
title('Rayleigh','Color','r','FontSize',14);
colormap(pmkmp(128,'linearl'));
cbr = colorbar;
set(cbr,'YTick',[1,128]);
set(cbr,'YTickLabel',{'t = 0','t = max'},'FontSize',12);
%
%% Print the image
%
print -depsc2 ~/Figure1.eps
%

%%% END %%%