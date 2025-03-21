#!/usr/bin/env bash

set -eo pipefail

cd /app/aspects-dbt

if [ -e "./requirements.txt" ]
then
echo "Installing dbt python requirements"
pip install -r ./requirements.txt
else
echo "No requirements.txt file found; skipping"
fi

echo "Installing dbt dependencies"
dbt deps

mkdir -p $DBT_STATE