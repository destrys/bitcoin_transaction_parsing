#
# This script sets up the local shell environment.
#

#
# Do NOT run this script (`./environment.sh` or `bash
# environment.sh`); instead source it (`source environment.sh`).
# 
if [ "$_" = "$0" ]; then
    echo 'ERROR: Do not execute (`bash environment.sh`) this script! Source it instead (`source environment.sh`)'
    exit 1
fi

#
# Path settings used for further configuration within
# this file.
#

ROOT_DIR=$(pwd)
#LIB_DIR="${ROOT_DIR}/lib"
#TMP_DIR="${ROOT_DIR}/tmp"
export JUPYTER_CONFIG_DIR="${ROOT_DIR}/config"

#
# Python virtualenv
#

VENV_NAME=".virtualenv"
VENV_DIR="${ROOT_DIR}/${VENV_NAME}"
if [ -d "$VENV_DIR" ]; then
    echo "[virtualenv] Entering Python virtualenv at ${VENV_DIR}"
    . "${VENV_DIR}/bin/activate"
else
    echo "ERROR: Python virtualenv directory (${VENV_DIR}) does not exist.  Did you run `make dependencies` yet?"
    exit 1
fi

#
# PYTHONPATH
#
# We need to add this application's 'lib' dir to PYTHONPATH.
#
#
#if [ -z $(echo $PYTHONPATH | grep "$LIB_DIR") ]; then
#    echo "[pythonpath] Adding $LIB_DIR to PYTHONPATH (${PYTHONPATH})"
#    export PYTHONPATH="${LIB_DIR}:${PYTHONPATH}"
#else
#    echo "[pythonpath] $LIB_DIR already on PYTHONPATH (${PYTHONPATH})"
#fi 
