#!/usr/bin/env bash

# get url of the gin repos
source dataladConfig.sh

# install raw dataset
datalad install -d . \
    -s "${URL_RAW}" \
    inputs/raw

# create the derivatives universe of classic sub-subdatasets ()
# . outputs
# └── derivatives
#     ├── cpp_spm-preproc
#     └── cpp_spm-stats

if [ -z "${URL_DER}" ]; then
    datalad create -d . \
        outputs/derivatives
else
    datalad install -d . \
        -s "${URL_DER}" \
        outputs/derivatives
fi

if [ -z "${URL_DER_PREPROC}" ]; then
    datalad create -d . \
        outputs/derivatives/cpp_spm-preproc
else
    datalad install -d . \
        -s "${URL_DER_PREPROC}" \
        outputs/derivatives/cpp_spm-preproc
fi

if [ -z "${URL_DER_STATS}" ]; then
    datalad create -d . \
        outputs/derivatives/cpp_spm-stats
else
    datalad install -d . \
        -s "${URL_DER_STATS}" \
        outputs/derivatives/cpp_spm-preproc
fi

datalad push --to origin -r

echo ############################
echo # DATALAD IS READY TO WORK #
echo ############################
