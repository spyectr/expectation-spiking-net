% Demo script for running spiking network simulations and reproducing Fig. 3a of the model introduced in 
% 
% L. Mazzucato, G. La Camera and A. Fontanini,
% Expectation-induced modulation of metastable activity underlies faster coding of sensory stimuli,
% Nat Neurosci, XX-XX, 2019%
% 
% written by Luca Mazzucato 2019
%
% This demo runs the unexpected (UT) and expected (ET) conditions, depending on the following settings:
% 1) with condition='UT' you simulate an unexpected trial, with a taste
% stimulus delivered at t=0s and not anticipatory cue (Fig. 3a right panel in the paper)
% 2) with condition='ET' you simulate an expected trial, with a taste stimulus
% delivered at t=0, preceded by an anticipatory cue at t=-0.5s (Fig. 3a left panel in the paper).

%-----------------
% CHOOSE CONDITION: EITHER ET OR UT
condition='ET';
% condition='UT';
%-----------------

%------------------------
% load network parameters
%------------------------
aux.create_params(condition);

%------------------------
% run simulation
%------------------------
aux.fun_LIF_run;

%%
%------------------------
% PLOT EVENTS
%------------------------
aux.fun_PlotTrial
% figure 1 - rasterplot of all neurons in trial
% figure 2 - time course of membrane potential and PSC traces for E and I representative
% neurons
% figure 3 - time course of firing rate in clusters
% figure 4 - time course of stimuli (in the ET condition, the cue profile
% should be multiplied by a factor drawn from figure 5, one for each
% neuron
% figure 5 (ET only) - across-neurons distribution of cue peak values
