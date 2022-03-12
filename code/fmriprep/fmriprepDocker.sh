#!/bin/bash
set -e -u -x

sub_id=$1

#load variables from config
source fmriprepConfig.sh

# Execute fmriprep.
# Custom fmriprep parametrization can be done here.
# See:https://fmriprep.org/en/stable/usage.html

docker run -it --rm \
    --user "$(id -u):$(id -g)" \
    -v "${CODE_DIR}":/code \
    -v "${INPUT_DIR}":/data \
    -v "${OUTPUT_DIR}":/out \
    nipreps/fmriprep:"${VERSION}" /data/ /out/fmriprep \
    participant --participant_label "${sub_id}" \
    --skip-bids-validation \
    --fs-license-file /code/license.txt \
    --work-dir /out/wdir/ \
    --task-id "${TASK_ID}" \
    --output-spaces ${OUTPUT_SPACES} \
    --bids-filter-file /code/fmriprep/bids_filter_file.json
