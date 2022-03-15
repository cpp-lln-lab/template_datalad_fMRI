#!/bin/bash
set -e -u -x

# Adapted from the F big workflow:
# https://github.com/psychoinformatics-de/fairly-big-processing-workflow/blob/main/bootstrap_forrest_fmriprep.sh

SUB_ID=$1
TASK_ID=$2
OUTPUT_SPACES=$3

# execute fmriprep. Its runscript is available as /singularity within the
# container. Custom fmriprep parametrization can be done here.
/singularity inputs/raw outputs/derivatives participant \
    --participant-label $SUB_ID \
    --work-dir ouputs/derivatives/wdir \
    --fs-license-file code/license.txt \
    --bids-filter-file code/fmriprep/bids_filter_file.json \
    --skip-bids-validation \
    --task-id $TASK_ID \
    --output-spaces $OUTPUT_SPACES
