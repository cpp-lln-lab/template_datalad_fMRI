% (C) Copyright 2021 Remi Gau

clear;
clc;

% Sets up the environment for the analysis and add libraries to the path
initEnv();

%% Set options
opt = demoGetOption();

checkDependencies();

%% Run batches
reportBIDS(opt);
bidsCopyRawFolder(opt, 1);

bidsSTC(opt);

bidsSpatialPrepro(opt);

% The following do not run on octave for now (because of spmup)
anatomicalQA(opt);
bidsResliceTpmToFunc(opt);
functionalQA(opt);
