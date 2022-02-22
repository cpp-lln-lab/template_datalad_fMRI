#!/usr/bin/env bash

start_dir=${PWD}

# get url of the gin repos
source dataladConfig.sh

# install raw dataset
datalad install -d . \
    -s "${URL_RAW}" \
    inputs/raw

# create the derivatives universe of classic sub-subdatasets ()
# if we install them from somewhere we make sure they are turned in datalad
# dataets, in case they were set up on GIN as pure git repos.
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
    cd outputs/derivatives
    datalad create --force .
    cd "${start_dir}"
fi

if [ -z "${URL_DER_PREPROC}" ]; then
    datalad create -d . \
        outputs/derivatives/cpp_spm-preproc
else
    datalad install -d . \
        -s "${URL_DER_PREPROC}" \
        outputs/derivatives/cpp_spm-preproc
    cd outputs/derivatives/cpp_spm-preproc
    datalad create --force .
    cd "${start_dir}"
fi

if [ -z "${URL_DER_STATS}" ]; then
    datalad create -d . \
        outputs/derivatives/cpp_spm-stats
else
    datalad install -d . \
        -s "${URL_DER_STATS}" \
        outputs/derivatives/cpp_spm-stats
    cd outputs/derivatives/cpp_spm-stats
    datalad create --force .
    cd "${start_dir}"
fi

datalad push --to origin -r

echo ############################
echo # DATALAD IS READY TO WORK #
echo ############################
