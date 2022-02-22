function opt = preprocOptions()
    %
    % (C) Copyright 2021 Remi Gau, Marco Barilari

    opt = commonOptions();

    opt.subjects = {'con07'};

    %% DO NOT TOUCH
    opt = checkOptions(opt);
    saveOptions(opt);

end
