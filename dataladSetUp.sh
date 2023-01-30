#!/usr/bin/env bash

root_dir=${PWD}
raw_dir=${root_dir}/inputs/raw
derivatives_dir=${root_dir}/outputs/derivatives
preproc_dir=${derivatives_dir}/bidspm-preproc
stats_dir=${derivatives_dir}/bidspm-stats

# get url of the gin repos from config
source dataladConfig.sh

# install raw dataset
datalad install -d . -s "${URL_RAW}" "${raw_dir}"

# create the derivatives universe of classic sub-subdatasets ()
# . outputs
# └── derivatives
#     ├── bidspm-preproc
#     └── bidspm-stats

datalad create -d . "${derivatives_dir}"

if [ ! -z "${URL_DER}" ]; then
    cd "${derivatives_dir}"
    datalad siblings add --name origin --url "${URL_DER}"
    cd "${root_dir}"
    datalad subdatasets --set-property url "${URL_DER}" "${derivatives_dir}"
fi

datalad create -d . "${preproc_dir}"

if [ ! -z "${URL_DER_PREPROC}" ]; then
    cd "${preproc_dir}"
    datalad siblings add --name origin --url "${URL_DER_PREPROC}"
    cd ..
    datalad subdatasets --set-property url "${URL_DER_PREPROC}" bidspm-preproc
    cd "${root_dir}"
fi

datalad create -d . "${stats_dir}"

if [ ! -z "${URL_DER_STATS}" ]; then
    cd "${stats_dir}"
    datalad siblings add --name origin --url "${URL_DER_STATS}"
    cd ..
    datalad subdatasets --set-property url "${URL_DER_STATS}" bidspm-stats
    cd "${root_dir}"
fi

if [ "${USE_BIDSPM_DEV}" = true ]; then
    cd code/lib/bidspm
    git checkout origin/dev
    git switch -c dev
    git submodule update --init --recursive && git submodule update --recursive
    cd "${root_dir}"
    datalad save -m 'switch CPP SPM to dev branch'
fi

datalad push --to origin -r

echo "############################"
echo "# DATALAD IS READY TO WORK #"
echo "############################"
