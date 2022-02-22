% (C) Copyright 2019 Remi Gau

clear;
clc;

% Sets up the environment for the analysis and add libraries to the path
initEnv();

%% Set options
opt = getOption();

checkDependencies();

bidsFFX('specifyAndEstimate', opt, FWHM);
bidsFFX('contrasts', opt, FWHM);
bidsResults(opt, FWHM);

bidsRFX('smoothContrasts', opt, FWHM, conFWHM);
bidsRFX('RFX', opt, FWHM, conFWHM);
bidsResults(opt, FWHM);
