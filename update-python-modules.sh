#!/bin/sh

# Workaround for pip's keyring bug
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

PIP_GENERATOR="flatpak-builder-tools/pip/flatpak-pip-generator --checker-data --yaml --runtime=org.gnome.Sdk//44"

$PIP_GENERATOR lxml
# lxml must be force installed as it is in the GMOME 41 sdk but not the platform.
sed -e 's/--no-build-isolation/--no-build-isolation --ignore-installed/g' -i python3-lxml.yaml

$PIP_GENERATOR python-dateutil
$PIP_GENERATOR pillow pybind11 deprecation --output=python3-pikepdf-deps
