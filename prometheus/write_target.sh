#!/bin/bash

# This script is used to substitute variables in a JSON file with values from environment variables.
dir=$(dirname "$0") # Get the directory of the script to save files
mkdir -p $dir/targets # Create a directory to store the target files or ignore if exists
target=$(mktemp) # Create a temporary file to process the target with awk
targetmetadata=$(mktemp) # Create a temporary file to store the target metadata
url=$1 # Get the URL from the first argument

echo "${url#https://}" >> $target # Remove the https:// prefix from the URL and write it to the target tmp file

# Separate the target URI into service, environment, and deployment using awk
awk -v RS='[-]' '{a=$0; getline b; getline c; print a, b, c}' OFS=\\n $target >> $targetmetadata
 
export TARGET_URI="$(cat $target)"
export SERVICE="$(cat $targetmetadata | sed -n '1p')"
export ENVIRONMENT="$(cat $targetmetadata | sed -n '2p')"
export DEPLOYMENT="$(cat $targetmetadata | sed -n '3p')"

envsubst < $dir/target_template.json > $dir/target_$SERVICE.json
mv $dir/target_$SERVICE.json $dir/targets/ # Move the target file to the targets directory