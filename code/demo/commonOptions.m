function opt = commonOptions()
    %
    % returns a structure that contains the options chosen by the user to run
    % slice timing correction, pre-processing, subject and group level analysis.
    %
    % for more info see:
    % <https://cpp-spm.readthedocs.io/en/latest/set_up.html#configuration-of-the-pipeline>
    % <https://cpp-spm.readthedocs.io/en/latest/defaults.html#checkoptions>
    %
    % (C) Copyright 2022 Remi Gau, Marco Barilari

    if nargin < 1
        opt = [];
    end

    rootDir = fullfile(fileparts(mfilename('fullpath')), '..', '..');

    opt.dataDir = fullfile(rootDir, 'inputs', 'raw');

    % The directory where the data are located
    % You can specify where you want the data to be saved if the default location
    % does not suit you.
    opt.derivativesDir = fullfile(fileparts(rootDir, 'ouputs', 'derivatives'));

    % task to analyze
    opt.taskName = 'visMotion';

    % If you use 'individual', then we stay in native space (that of the anat image)
    % set to 'MNI' to normalize data
    opt.space = 'MNI';

end
