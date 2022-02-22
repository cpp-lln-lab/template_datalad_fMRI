#!/usr/bin/env bash

# Mention here where your remote datasets are

# raw dataset url (either GIN or openneuro)
# for DEMO use: git@gin.g-node.org:/cpp-lln-lab/CPP_visMotion-raw.git
URL_RAW=''

# derivatives sibling url
# for DEMO use: git@gin.g-node.org:/cpp_brewery/CPP_visMotion-derivatives.git
URL_DER=''

# derivatives/preproc sibling url
# for DEMO use: git@gin.g-node.org:/cpp_brewery/CPP_visMotion-cpp_spm-preproc.git
URL_DER_PREPROC=''

# derivatives/stats sibling url
# for DEMO use: git@gin.g-node.org:/cpp_brewery/CPP_visMotion-cpp_spm-stats.git
URL_DER_STATS=''

# set to "true" instead of "false" if you want to use the bleeding edge version of CPP SPM
USE_CPP_SPM_DEV=false


if [ -z "${URL_RAW}" ]; then
    echo "Error: the URL for the raw cannot be empty"
    exit 1
fi
