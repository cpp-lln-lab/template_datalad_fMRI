% (C) Copyright 2019 Remi Gau

clear;
clc;

% Sets up the environment for the analysis and add libraries to the path
initEnv();

%% Set options
opt = getOption();

checkDependencies();

%% Run batches
reportBIDS(opt);
bidsCopyRawFolder(opt, 1);

% In case you just want to run segmentation and skull stripping
% Skull stripping is also included in 'bidsSpatialPrepro'
% bidsSegmentSkullStrip(opt);

bidsSTC(opt);

bidsSpatialPrepro(opt);

% The following do not run on octave for now (because of spmup)
anatomicalQA(opt);
bidsResliceTpmToFunc(opt);
functionalQA(opt);

% Smoothing to apply
FWHM = 6;
bidsSmoothing(FWHM, opt);

bidsFFX('specifyAndEstimate', opt, FWHM);
bidsFFX('contrasts', opt, FWHM);
bidsResults(opt, FWHM);

bidsRFX('smoothContrasts', opt, FWHM, conFWHM);
bidsRFX('RFX', opt, FWHM, conFWHM);

% WIP: group level results
% bidsResults(opt, FWHM);
