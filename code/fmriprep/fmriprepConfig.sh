#!/usr/bin/env bash
set -e -u -x

ROOT_DIR="$PWD/../.."
INPUT_DIR=${ROOT_DIR}/inputs/raw
OUTPUT_DIR=${ROOT_DIR}/outputs/derivatives
CODE_DIR=${ROOT_DIR}/code

# fmriprep version
VERSION="21.0.1"

OUTPUT_SPACES='MNI152NLin2009cAsym T1w'

TASK_ID="visMotion"
