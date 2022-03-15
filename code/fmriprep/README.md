# Running fmriprep

- [Running fmriprep](#running-fmriprep)
  - [Requirements](#requirements)
  - [Freesurfer licence](#freesurfer-licence)
  - [Configuration](#configuration)
  - [Run with Docker](#run-with-docker)
    - [Notes](#notes)
  - [Run with singularity](#run-with-singularity)
  - [Running with datalad (WIP)](#running-with-datalad-wip)
    - [Install container image as subdataset](#install-container-image-as-subdataset)
    - [Use datalad to call fmriprep](#use-datalad-to-call-fmriprep)

fmriprep doc: https://fmriprep.org/en/21.0.1/index.html

nipreps doc: https://www.nipreps.org/

## Requirements

- docker / singularity
- dalalad extensions: mentioned in the [requirements.txt](../requirements.txt)
  - neuroimaging
  - containers

This should install those extensions.

```bash
pip install -r code/requirements.txt
```

## Freesurfer licence

```bash
# For example
# path_to_FS_licence="$HOME/Dropbox/Softwares/Freesurfer/License/license.txt"
path_to_FS_licence=FIXME

cp ${path_to_FS_licence} code/license.txt

datalad save -m "Add Freesurfer license file"
```

## Configuration

Some common variables to run fmriprep can be set in
`code/fmriprep/fmriprepConfig.sh`

## Run with Docker

from `code/fmriprep`

```bash
sub_id=FIXME

bash fmriprepDocker.sh $sub_id
```

### Notes

Note using the docker argument `--user "$(id -u):$(id -g)"` may not work because
might not able to create the directories in the `derivatives` folder.

## Run with singularity

See nipreps doc: https://www.nipreps.org/apps/singularity/

Build singularity image:

```bash
#load variables from config
source fmriprepConfig.sh

singularity build ../images/fmriprep-${VERSION}.simg \
                  docker://nipreps/fmriprep:${VERSION}
```

## Running with datalad (WIP)

Adapted from the F big workflow:

https://github.com/psychoinformatics-de/fairly-big-processing-workflow/blob/main/bootstrap_forrest_fmriprep.sh

### Install container image as subdataset

TODO
- how to `source` info from `code/fmriprep/fmriprepConfig.sh`? Is this a ZSH issue?

```bash
container_name="bids-fmriprep"
container="https://github.com/ReproNim/containers.git"

# clone the container-dataset as a subdataset.
datalad clone -d . "${container}" code/pipeline

# Register the container in the top-level dataset.
#-------------------------------------------------------------------------------
# FIXME: If necessary, configure your own container call in the --call-fmt
# argument. If your container does not need a custom call format, remove the
# --call-fmt flag and its options below.
# This container call-format is customized to execute an fmriprep call defined
# in a separate script, and does not need modifications if you stick to
# fmriprep.

VERSION="21.0.1"

datalad containers-add \
  --call-fmt 'singularity exec -B {{pwd}} --cleanenv {img} {cmd}' \
  -i code/pipeline/images/bids/bids-fmriprep--"${VERSION}".sing \
  $container_name
```

### Use datalad to call fmriprep

TODO
- how to `source` info from `code/fmriprep/fmriprepConfig.sh`? Is this a ZSH issue?
- how to pass several output_spaces at once?

```bash
sub_id="con07"
OUTPUT_SPACES='MNI152NLin2009cAsym'
TASK_ID="visMotion"

datalad containers-run \
  -m "Compute ${subid}" \
  --container-name bids-fmriprep \
  --explicit \
  --output outputs/derivatives \
  --input inputs/raw/sub-$sub_id/ \
  --input code/license.txt \
  "sh code/fmriprep/fmriprepDatalad.sh $sub_id $TASK_ID $OUTPUT_SPACES"
```
