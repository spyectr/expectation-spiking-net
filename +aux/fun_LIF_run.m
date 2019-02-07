% Run LIF simulation loading parameters from paramsfile

% function fun_LIF_run

% load network parameters
params=load('params.mat');
tic
%-----------------
% SYNAPTIC WEIGHTS
%-----------------
[J, params]=aux.fun_SynWeights(params);
% spike thresholds for each population
theta=[params.theta_e, params.theta_i];
Theta=zeros(1,numel(params.popsize)+2);
Theta(1:numel(params.popsize)+1)=theta(1);
Theta(end) = theta(2);
params.Theta=Theta;
%----------
% STIMULUS
%----------
[stimulus_save, params]=aux.fun_stim(params);
%------------
% SIMULATION
%------------
ParamsRun=params;
ParamsRun.Ext=stimulus_save.Ext;
ParamsRun.Stimulus=stimulus_save.Stimulus;
ParamsRun.J=J;
fprintf('--- Start SIM ...\n');
firings=struct('spk',[]);
[firings.spks, PlotData]=aux.fun_LIF_SIM(ParamsRun);
% SAVE results
file_name='results.mat';
save(file_name,'params','firings','PlotData','stimulus_save');
fprintf('\nDone. Simulation saved in %s\n',file_name);
toc

