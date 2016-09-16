#!/usr/bin/env bash
set -e

source pypi_conf.sh

pip install devpi-client --index=$PYPI_INDEX_URL
devpi use $PYPI_INDEX_URL
devpi login $PYPI_USER --password=$PYPI_PASSWORD
devpi upload --no-vcs
