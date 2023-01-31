#!/usr/bin/env bash

# Mention here where your remote datasets are

# raw dataset url (either GIN or openneuro)
# for DEMO use: git@gin.g-node.org:/cpp-lln-lab/CPP_visMotion-raw.git
URL_RAW=''

# derivatives sibling url
# for DEMO use: git@gin.g-node.org:/cpp_brewery/CPP_visMotion-derivatives.git
URL_DER=''

# derivatives/preproc sibling url
# for DEMO use: git@gin.g-node.org:/cpp_brewery/CPP_visMotion-bidspm-preproc.git
URL_DER_PREPROC=''

# derivatives/stats sibling url
# for DEMO use: git@gin.g-node.org:/cpp_brewery/CPP_visMotion-bidspm-stats.git
URL_DER_STATS=''

# GIN base name
# to create siblings automatically for each new repo (i.e.  analysis_visualMotionLoc)
GIN_BASENAME=''

if [ -z "${URL_RAW}" ]; then
    echo "Error: the URL for the raw cannot be empty"
    exit 1
fi
