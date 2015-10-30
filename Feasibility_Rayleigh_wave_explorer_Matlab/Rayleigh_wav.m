%% Program 'Rayleigh_wav'

% OUTPUT
% t_k = Time vector
% S_1 = Harmonic Signal 1 
% S_2 = Harmonic Signal 2

% INPUT
% t_0,t_1;dt = Min and max time of time vector; dt is sample interval
% A_1,f_1,Phase_1 = Amplitude, frequency (Hz), Phase of Harmonic Signal 1
% A_2,f_2,Phase_2 = Amplitude, frequency (Hz), Phase of Harmonic Signal 2
% Rate = Propagation time rate of waves

%% Input

prompt = {'t_0','t_1','dt','A_1','f_1 (Hz)','Phase_1','A_2','f_2 (Hz)', ...
         'Phase_2','Interv'};
prompt_title ='Rayleigh Modeling...';
numlines=1;

options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';

% For Figure 2
%defaultans_2={'0','60','0.01','1','2.5','0','2','2.5','90','5'};
%answer_2=inputdlg(prompt,prompt_title,numlines,defaultans_2,options);

% For Figure 3
%defaultans_3 = {'0','60','0.1','1','2.0','0','2','2.0','50','1.5'};
%answer_3=inputdlg(prompt,prompt_title,numlines,defaultans_3,options);

% For Figure 4
defaultans_4 = {'0','60','0.1','1','2.0','0','2','2.0','-50','1.5'};
answer_4=inputdlg(prompt,prompt_title,numlines,defaultans_4,options);


%% Output

% For Figure 2
%[t_k,S_1,S_2,Dt,A] = Harmonics_t(answer_2);
% For Figure 3
%[t_k,S_1,S_2,Dt,A] = Harmonics_t(answer_3);
% For Figure 4
[t_k,S_1,S_2,Dt,A] = Harmonics_t(answer_4);

%% Visualize the Rayleigh

figure
%
% Limits for the plot
M1 = max(max(S_1)); m1 = min(min(S_1)); 
M2 = max(max(S_2)); m2 = min(min(S_2));
M = max(M1,M2); m = min(m1,m2);
%
% Harmonic 1
subplot(4,5,[1,2])
for ik = 1:size(t_k,2)
    plot(t_k(:,ik),S_1(:,ik),'k','LineWidth',1);
    axis([min(min(t_k))-0.2 max(max(t_k))+0.2 m-0.5 M+0.5]);
    xlabel('t','FontSize',14)
    ylabel('S_1(t)','Rotation',0,'FontSize',14)
    set(gca,'FontSize',13)
    title('Harmonic 1','Color','k','FontSize',14);
    hold on
% Start time propagation of the wave at a specific rate
    plot(t_k(1,ik),S_1(1,ik),'ko','MarkerSize',4);
    hold on
% End time propagation of the wave at a specific rate
    plot(t_k(end,ik),S_1(end,ik),'ko','MarkerSize',4, ...
        'MarkerFaceColor','k');
    hold on
end
%
% Harmonic 2
subplot(4,5,[4,5])
for ik = 1:size(t_k,2)
    plot(t_k(:,ik),S_2(:,ik),'b','LineWidth',1);
    axis([min(min(t_k))-0.2 max(max(t_k))+0.2 m-0.5 M+0.5]);
    xlabel('t','FontSize',14)
    ylabel('S_2(t)','Rotation',0,'FontSize',14)
    set(gca,'FontSize',13)
    title('Harmonic 2','Color','b','FontSize',14);
    hold on
% Start time propagation of the wave at a specific rate
    plot(t_k(1,ik),S_2(1,ik),'bo','MarkerSize',4);
    hold on
% End time propagation of the wave at a specific rate
    plot(t_k(end,ik),S_2(end,ik),'bo','MarkerSize',4, ...
        'MarkerFaceColor','b');
    hold on
end
%
% Rayleigh wave
subplot(4,5,(6:20))
for ik = 0:size(t_k,2)-1
    plot(S_1(:,ik+1)+Dt(ik+1),S_2(:,ik+1),'r','LineWidth',1);
    axis equal;
    axis([m1-0.2 M1+0.2+Dt(ik+1) m2-1 M2+1]);
    xlabel('S_1(t)','FontSize',14)
    ylabel('S_2(t)','Rotation',0,'FontSize',14)
    set(gca,'FontSize',13)
    title('Rayleigh','Color','r','FontSize',14);
    hold on
end
% Start time propagation of the ellipse at a specific rate
for ik = 0:size(t_k,2)-1
    plot(S_1(1,ik+1)+Dt(ik+1),S_2(1,ik+1),'go','MarkerSize',4, ...
         'MarkerFaceColor','g','MarkerEdgeColor','k','LineWidth',1);
    hold on
end
%
%% Print the image
%
% For Figure 2
%print -depsc2 ~/Figure2.eps

% For Figure 3
%print -depsc2 ~/Figure3.eps

% For Figure 4
print -depsc2 ~/Figure4.eps


%%% END %%%
