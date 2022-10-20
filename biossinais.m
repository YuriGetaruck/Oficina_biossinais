% Yuri Csontantino Getaruck Podmowski 2103303
% Oficina Biossinais


clc
clear 
close all



%%



data = edfread('cristian_MCV.edf');
% converte o timetable para celula
data_cell = data.EMGBITREV;
% converte a celula para vetor
x_cvm = cell2mat(data_cell);

%plot(x)

figure


fs = 1000;
n_cvm = length(x_cvm);
t_cvm = 0:1/fs:(n_cvm-1)/fs;

plot(t_cvm,x_cvm, 'K')

xlabel("Tempo(s)")
ylabel('Amplitude(mV)')
title('MCV - Biceps')
grid on

%%


data = edfread('cristian_3reps.edf');
% converte o timetable para celula
data_cell = data.EMGBITREV;
% converte a celula para vetor
x_3rep = cell2mat(data_cell);

%plot(x)
    

fs = 1000;
n_3rep = length(x_3rep);
t_3rep = 0:1/fs:(n_3rep-1)/fs;

figure

plot(t_3rep,x_3rep, 'K')

xlabel("Tempo(s)")
ylabel('Amplitude(mV)')
title('3rep - Biceps')
grid on

%%retificação

x_ret = abs(x_3rep);
figure

plot(t_3rep, x_ret, 'k')

xlabel("Tempo(s)")
ylabel('Amplitude(mV)')
title('3rep - Biceps - retificado')
grid on

%% suavização

w = 600; %numero de amostras

x_smooth = movmean(x_ret, w);

figure

plot(t_3rep, x_smooth, 'k')

xlabel("Tempo(s)")
ylabel('Amplitude(mV)')
title('3rep - Biceps - smooth')
grid on

%% normalização

CVM = max(movmean(abs(x_cvm), w));

x_normalizado = 100*x_smooth/CVM;

figure

plot(t_3rep, x_normalizado)

data = edfread('cristian_pesoleve.edf');
% converte o timetable para celula
data_cell = data.EMGBITREV;
% converte a celula para vetor
x_pesoleve = cell2mat(data_cell);

%plot(x)
    

fs = 1000;
n_pesoleve = length(x_pesoleve);
t_pesoleve = 0:1/fs:(n_pesoleve-1)/fs;

figure

plot(t_pesoleve,x_pesoleve, 'K')

xlabel("Tempo(s)")
ylabel('Amplitude(mV)')
title('3rep - Biceps')
grid on

%%retificação

x_ret_pesoleve = abs(x_pesoleve);
figure

plot(t_pesoleve, x_ret_pesoleve, 'k')

xlabel("Tempo(s)")
ylabel('Amplitude(mV)')
title('3rep - Biceps - retificado')
grid on

%% suavização

w = 600; %numero de amostras

x_smooth_pesoleve = movmean(x_ret_pesoleve, w);

figure

plot(t_pesoleve, x_smooth_pesoleve, 'k')

xlabel("Tempo(s)")
ylabel('Amplitude(mV)')
title('3rep - Biceps - smooth')
grid on

%% normalização

CVM = max(movmean(abs(x_cvm), w));

x_normalizado_pesoleve = 100*x_smooth_pesoleve/CVM;

figure

plot(t_pesoleve, x_normalizado_pesoleve)
