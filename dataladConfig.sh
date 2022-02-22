#!/usr/bin/env bash

# Mention here where your remote datasets are

# raw dataset url (either GIN or openneuro)
# for demo git@gin.g-node.org:/cpp-lln-lab/CPP_visMotion-raw.git
URL_RAW=''

# derivatives sibling url
URL_DER=''

# derivatives/preproc sibling url
URL_DER_PREPROC=''

# derivatives/stats sibling url
URL_DER_STATS=''

if [ -z "${URL_RAW}" ]; then
    echo "Error: the URL for the raw cannot be empty"
    exit 1
fi
