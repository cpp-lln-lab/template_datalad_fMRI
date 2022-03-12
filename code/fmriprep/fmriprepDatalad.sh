#!/bin/bash
set -e -u -x

sub_id=$1

# create workdir for fmriprep inside the dataset to simplify singularity call
# PWD will be available in the container
mkdir -p ouputs/derivatives/wdir

# execute fmriprep. Its runscript is available as /singularity within the
# container. Custom fmriprep parametrization can be done here.
/singularity inputs/raw outputs/derivatives participant \
    --participant-label $sub_id \
    -w ouputs/derivatives/wdir \
    -t retino* \
    --fs-license-file code/license.txt \
    --bids-filter-file code/fmriprep/bids_filter_file.json \
    --skip-bids-validation \
    --output-spaces \
    --ignore fieldmaps
