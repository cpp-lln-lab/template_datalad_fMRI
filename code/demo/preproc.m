% (C) Copyright 2021 Remi Gau

clear;
clc;

% Sets up the environment for the analysis and add libraries to the path
initEnv();

opt = preprocOptions();

reportBIDS(opt);

bidsCopyRawFolder(opt, 1);

bidsSTC(opt);

bidsSpatialPrepro(opt);

anatomicalQA(opt);
bidsResliceTpmToFunc(opt);
functionalQA(opt);
