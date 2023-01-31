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

if [ ! -z "${GIN_BASENAME}" ]; then
    cd "${derivatives_dir}"
    datalad create-sibling-gin -d . -s origin --access-protocol ssh --private  cpp_brewery/"${GIN_BASENAME}"-derivatives
    cd "${root_dir}"
    datalad subdatasets --set-property url https://gin.g-node.org/cpp_brewery/"${GIN_BASENAME}"-derivatives "${derivatives_dir}"
fi

datalad create -d . "${preproc_dir}"

if [ ! -z "${GIN_BASENAME}" ]; then
    cd "${preproc_dir}"
    datalad create-sibling-gin -d . -s origin --access-protocol ssh --private  cpp_brewery/"${GIN_BASENAME}"-derivatives-bidspm-preproc
    cd "${root_dir}"
    datalad subdatasets --set-property url https://gin.g-node.org/cpp_brewery/"${GIN_BASENAME}"-derivatives-bidspm-preproc bidspm-preproc
fi

datalad create -d . "${stats_dir}"

if [ ! -z "${GIN_BASENAME}" ]; then
    cd "${stats_dir}"
    datalad create-sibling-gin -d . -s origin --access-protocol ssh --private  cpp_brewery/"${GIN_BASENAME}"-derivatives-bidspm-stats
    cd "${root_dir}"
    datalad subdatasets --set-property url https://gin.g-node.org/cpp_brewery/"${GIN_BASENAME}"-derivatives-bidspm-stats bidspm-stats
fi

datalad push --to origin -r

echo "############################"
echo "# DATALAD IS READY TO WORK #"
echo "############################"
