#!/usr/bin/env bash
set -e

source ./pypi_conf.sh

# upload package to pypi
if [ -n "$PYPI_USER" ] && [ -n "$PYPI_PASSWORD" ]; then
    echo "Generating pypi auth config"
    cat > ~/.pypirc << EOF
[distutils]
index-servers =
    pypi

[pypi]
repository:$PYPI_REPO_URL
username:$PYPI_USER
password:$PYPI_PASSWORD
EOF
fi

cat ~/.pypirc

python setup.py sdist -d artifact

twine upload dist/*

