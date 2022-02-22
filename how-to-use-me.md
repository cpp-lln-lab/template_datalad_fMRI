# How to use this [template](https://github.com/cpp-lln-lab/template_datalad_fMRI)

- [How to use this template](#how-to-use-this-template)
   - [Prerequisites](#prerequisites)
   - [Get (install) this cooked repo on your computer with Datalad](#get-install-this-cooked-repo-on-your-computer-with-datalad)
   - [Dataset structure](#dataset-structure)
      - [Set up automatically the subdatasets](#set-up-automatically-the-subdatasets)
   - [DEMO](#demo)

## Prerequisites

- You will need to have datalad installed,
  [check this for a crash course](https://github.com/cpp-lln-lab/datalad_crash_course)

## Get (install) this cooked repo on your computer with Datalad

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

### Set up automatically the subdatasets

To do so, you need to:

1. create on GIN the empty repository for each of the (sub)subdataset
2. copy each (ssh) URL of the the just created GIN repo into `dataladConfig.sh`
3. run ` bash dataladSetUp.sh`

Note that if any of the URLs in `dataladConfig.sh` is left empty then the
subdatasets will still be created but no sibling will be added and you will have
to set the siblings manually and set the url in the parent dataset. This can be
quite annoying so we strongly recommend creating the remote repos first.

These scripts can be modified to everyone needs (eg also add into derivatives
`fmriprep` or `mriqc` or `freesurfer` or etc.).

The script `dataladSetUp.sh` as it is will:

1. install a ready `inputs/raw` dataset from a URL (either from
   [openneuro](https://openneuro.org/) or [GIN](https://gin.g-node.org/))
2. install
   - a subdataset `outputs/derivatives`
   - install sub-subdatasets for
     - `outputs/derivatives/cpp_spm-preproc`
     - `outputs/derivatives/cpp_spm-preproc`
3. make sure that the derivatives folders are datalad datasets and not pure git repos

```bash
.
└── derivatives
    ├── cpp_spm-preproc
    └── cpp_spm-stats
```

## DEMO

Use this URL for the raw data set in `dataladConfig.sh`

```bash
git@gin.g-node.org:/cpp-lln-lab/CPP_visMotion-raw.git
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
