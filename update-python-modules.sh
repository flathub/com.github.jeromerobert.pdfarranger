#!/bin/sh

# Workaround for pip's keyring bug
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

PIP_GENERATOR="flatpak-builder-tools/pip/flatpak-pip-generator --checker-data"

$PIP_GENERATOR lxml
# lxml must be force installed as it is in the GMOME 41 sdk but not the platform.
sed -e 's/--no-build-isolation/--no-build-isolation --ignore-installed/g' -i python3-lxml.json

$PIP_GENERATOR python-dateutil
$PIP_GENERATOR pillow pybind11 setuptools-scm-git-archive setuptools-scm deprecation --output=python3-pikepdf-deps
