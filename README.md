# Project <insert name>

## How to use this template

You will need to have datalad installed

### Install with Datalad

1. Click the green button `Use this template`.

1. Give a name to the repository you want to create. Something short that
   contains the name of your experiment: `analysis_fMRI_FaceLocalizer`.

1. Decide if you want this new repo to be public or private.

1. Click on `Create repository from template`

You now have a copy of the template on your Github account. You can then
download the code and the pre-set dependencies like this.

1. Click on green `Code` button and copy the `URL_to_your_repo` that is shown
   there.

1. Open a terminal and type this:

```bash
datalad install --recursive URL_to_your_repo
```

This will set up everything automatically in your current directory.

## Dataset structure

- All inputs (i.e. building blocks from other sources) are located in `inputs/`.
- All custom code is located in `code/`.
- All outputs will go in `outputs/`

[![made-with-datalad](https://www.datalad.org/badges/made_with.svg)](https://datalad.org)

## DEMO

Clone input data: raw data set of visual localizer from the CPP lab

```bash
datalad clone -d . git@gin.g-node.org:/cpp-lln-lab/CPP_visMotion-raw.git inputs/raw
```

You will need to set up a proper alias to launch matlab from your mac or linux
command line to tdo the next step:

```bash
matlab -nodisplay -nosplash -nodesktop -r "run('code/src/demoRunSpatialPrepro.m'); exit;"


# OR

matlab -nodisplay -nosplash -nodesktop -r 'run code/src/demoRunSpatialPrepro.m; exit;'
```

To make it easier to understand, when can use some bash variables

```bash
MATFLAGS="-nodisplay -nosplash -nodesktop"
cmd_to_run="run('code/src/demoRunSpatialPrepro.m'); exit;"
matlab $MATFLAGS -r "$cmd_to_run"
```

And now we insert in a datalad run command

```bash
# THIS DOES NOT WORK
datalad run -m "Try again to create a list of podcast titles" \
 --input "inputs/raw" \
 --output "outputs/derivatives" \
 "matlab -nodisplay -nosplash -nodesktop -r 'run code/src/demoRunSpatialPrepro.m; exit;'"
```

```bash
datalad run -m "Try again to create a list of podcast titles" \
   --input "inputs/raw" \
   --output "outputs/derivatives" \
  'matlab $MATFLAGS -r "$cmd_to_run"'
```

## DataLad datasets and how to use them

This repository is a [DataLad](https://www.datalad.org/) dataset. It provides
fine-grained data access down to the level of individual files, and allows for
tracking future updates. In order to use this repository for data retrieval,
[DataLad](https://www.datalad.org/) is required. It is a free and open source
command line tool, available for all major operating systems, and builds up on
Git and [git-annex](https://git-annex.branchable.com/) to allow sharing,
synchronizing, and version controlling collections of large files. You can find
information on how to install DataLad at
[handbook.datalad.org/en/latest/intro/installation.html](http://handbook.datalad.org/en/latest/intro/installation.html).

### Get the dataset

A DataLad dataset can be `cloned` by running

```
datalad clone <url>
```

Once a dataset is cloned, it is a light-weight directory on your local machine.
At this point, it contains only small metadata and information on the identity
of the files in the dataset, but not actual _content_ of the (sometimes large)
data files.

### Retrieve dataset content

After cloning a dataset, you can retrieve file contents by running

```
datalad get <path/to/directory/or/file>`
```

This command will trigger a download of the files, directories, or subdatasets
you have specified.

DataLad datasets can contain other datasets, so called _subdatasets_. If you
clone the top-level dataset, subdatasets do not yet contain metadata and
information on the identity of files, but appear to be empty directories. In
order to retrieve file availability metadata in subdatasets, run

```
datalad get -n <path/to/subdataset>
```

Afterwards, you can browse the retrieved metadata to find out about subdataset
contents, and retrieve individual files with `datalad get`. If you use
`datalad get <path/to/subdataset>`, all contents of the subdataset will be
downloaded at once.

### Stay up-to-date

DataLad datasets can be updated. The command `datalad update` will _fetch_
updates and store them on a different branch (by default
`remotes/origin/master`). Running

```
datalad update --merge
```

will _pull_ available updates and integrate them in one go.

### Find out what has been done

DataLad datasets contain their history in the `git log`. By running `git log`
(or a tool that displays Git history) in the dataset or on specific files, you
can find out what has been done to the dataset or to individual files by whom,
and when.

### More information

More information on DataLad and how to use it can be found in the DataLad
Handbook at
[handbook.datalad.org](http://handbook.datalad.org/en/latest/index.html). The
chapter "DataLad datasets" can help you to familiarize yourself with the concept
of a dataset.
