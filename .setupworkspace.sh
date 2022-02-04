#!/bin/bash

# Parameters to be passed:
#   $1: Path to the virtualenv base folder
#   $2: Path to requirements.json

VIRTUALENV_BASE_PATH=$1
SOURCE_REQS_PATH=$2
TESTS_REQS_PATH=$3

# TODO: Check if python3 is installed

# Check if virtualenv is already present at the said location.
if [ ! -f ${VIRTUALENV_BASE_PATH}/bin/activate ]; then
    if [ -d ${VIRTUALENV_BASE_PATH} ] || [ -f ${VIRTUALENV_BASE_PATH} ] || [ -h ${VIRTUALENV_BASE_PATH} ]; then
        echo "Cannot create virtualenv, a folder/ file/ link already exists at the same path"
        exit 1
    fi

    echo "Creating virtual environment at ${VIRTUALENV_BASE_PATH}"
    python3 -m venv ${VIRTUALENV_BASE_PATH}
    echo "Creation of virtual environment complete"
else
    echo "Virtualenv already present"
fi

echo "Installing requirements in virtual env"
${VIRTUALENV_BASE_PATH}/bin/pip install -r ${SOURCE_REQS_PATH}
${VIRTUALENV_BASE_PATH}/bin/pip install -r ${TESTS_REQS_PATH}
echo "Installation of requirements in virtual env complete"
