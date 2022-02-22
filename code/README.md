[![](https://img.shields.io/badge/Octave-CI-blue?logo=Octave&logoColor=white)](https://github.com/Remi-gau/template_matlab_analysis/actions)
![](https://github.com/Remi-gau/template_matlab_analysis/workflows/CI/badge.svg)
[![codecov](https://codecov.io/gh/Remi-gau/template_matlab_analysis/branch/master/graph/badge.svg)](https://codecov.io/gh/Remi-gau/template_matlab_analysis)

# Template repository for matlab analysis project

## How to install and use this template

### Install with Git

1. Click the green button `Use this template`.

1. Give a name to the repository you want to create. Something short that
   contains the name of your experiment: `analysis_fMRI_FaceLocalizer`.

1. Decide if you want this new repo to be public or private.

1. Click on `Create repository from template`

You now have a copy of the template on your Github account. You can then
download the code and the pre-set dependencies like this.

1. Click on green `Download` button and copy the `URL_to_your_repo` that is
   shown there.

1. Open a terminal and type this:

```bash
git clone --recurse-submodules URL_to_your_repo
```

This will set up everything automatically in your current directory.

## Content

```bash
├── .git
│   ├── COMMIT_EDITMSG
│   ├── FETCH_HEAD
│   ├── HEAD
│   ├── ORIG_HEAD
│   ├── branches
│   ├── config
│   ├── description
│   ├── hooks
│   │   ├── pre-commit.sample
│   │   └── pre-push.sample
│   ├── ...
│   └── ...
├── .github  # where you put anything github related
│   └── workflows # where you define your github actions
│       └── moxunit.yml # a yaml file that defines a github action
├── docs # sphynx based documentation
├── lib # where you put the code from external libraries (mathworks website or other github repositories)
│   └── README.md
├── src # WHERE YOU PUT YOUR CODE
│   ├── README.md
│   └── miss_hit.cfg
├── tests # where you put your unit tests
|   ├── README.md
|   └── miss_hit.cfg
├── LICENSE
├── README.md
├── .pre-commit-config.yaml
├── requirements.txt # a simple environment for anything python related in this repo
├── miss_hit.cfg # configuration file for the matlab miss hit linter
└── initEnv.m # a .m file to set up your project (adds the right folder to the path)
```

## Keeping your code stylish

If you have python installed:

```
pip install -r requirements.txt
pre-commit install
```

## Testing your code

## Continuous integration
