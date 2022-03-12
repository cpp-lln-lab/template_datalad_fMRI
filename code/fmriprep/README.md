# Running fmriprep

- [Running fmriprep](#running-fmriprep)
  - [Requirements](#requirements)
  - [Freesurfer licence](#freesurfer-licence)
  - [Configuration](#configuration)
  - [Run with Docker](#run-with-docker)
  - [Run with singularity](#run-with-singularity)
  - [Running with datalad (WIP)](#running-with-datalad-wip)
    - [Install container image as subdataset](#install-container-image-as-subdataset)
    - [Use datalad to call fmriprep](#use-datalad-to-call-fmriprep)

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
sub_id="pilot001"

sh fmriprepDocker.sh $sub_id
```

## Run with singularity

See nipreps doc: https://www.nipreps.org/apps/singularity/

Build singularity image:

```
singularity build   code/images/fmriprep-21.0.1.simg \
                    docker://nipreps/fmriprep:21.0.1
```

## Running with datalad (WIP)

Adapted from the F big workflow:

https://github.com/psychoinformatics-de/fairly-big-processing-workflow/blob/main/bootstrap_forrest_fmriprep.sh

### Install container image as subdataset

```bash
container_name='bids-fmriprep'
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

datalad containers-add \
  --call-fmt 'singularity exec -B {{pwd}} --cleanenv {img} {cmd}' \
  -i code/pipeline/images/bids/bids-fmriprep--20.2.0.sing \
  $container_name
```

### Use datalad to call fmriprep

```bash
sub_id="pilot001"
task_id='retino'

datalad containers-run \
  -m "Compute ${subid}" \
  --container-name bids-fmriprep \
  --explicit \
  --output outputs/derivatives \
  --input inputs/raw/sub-$sub_id/ses-001/anat \
  --input inputs/raw/sub-$sub_id/ses-002/func/*${task_id}* \
  --input code/license.txt \
  "sh code/runfmriprep.sh $sub_id"
```
