% (C) Copyright 2019 Remi Gau

clear;
clc;

FWHM = 6;

% Sets up the environment for the analysis and add libraries to the path
initEnv();

%% Set options
opt = getOption();

%% Run batches
reportBIDS(opt);
bidsCopyRawFolder(opt, 1);

bidsSTC(opt);

bidsSpatialPrepro(opt);

anatomicalQA(opt);
bidsResliceTpmToFunc(opt);
functionalQA(opt);

% Smoothing to apply
bidsSmoothing(FWHM, opt);
