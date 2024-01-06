#!/bin/zsh

# Copyright 2024 Dylan Roussel
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# This script minifies the JavaScript, and moves all the files to the dist directory
# To run, you need to have the following installed:
# - zsh
# - jq (https://jqlang.github.io/jq/)
# - terser (npm install terser -g)

# Create the dist directory if it doesn't exist, and clear it
mkdir -p dist
rm -rf dist/*

typeset -A js_files
typeset -A handled_files

# Minify the JavaScript files and output them to the dist directory
for file in src/*.js
do
    original_file=`basename $file`
    minified_file=`basename $file .js`.min.js

    # Check if first argument is "dev" to determine whether to minify the file
    if [[ $1 == "dev" ]]
    then
        echo "Dev mode, copying $file instead of minifying"
        cp $file dist/$minified_file
    else
        echo "Production mode, minifying $file into $minified_file"
        terser $file -o dist/$minified_file --compress --mangle
    fi

    js_files[$original_file]=$minified_file
    handled_files[$original_file]=1
done

# Copy the manifest.json file to the dist directory
echo "Handling manifest.json file"
jq 'del(."$schema")' src/manifest.json > dist/manifest.json

# Replace the original file names with the minified file names in the manifest.json file
for original in "${(@k)js_files}"
do
    minified=${js_files[$original]}
    echo "Replacing \"$original\" with \"$minified\" in manifest.json"
    sed -i '' "s/\"$original\"/\"$minified\"/g" dist/manifest.json
done

handled_files[manifest.json]=1

# Copy the remaining files to the dist directory
echo "Copying remaining files"
for file in src/*
do
    file_name=`basename $file`
    if [[ -z ${handled_files[$file_name]} ]]
    then
        echo "Copying $file"
        cp -r $file dist/
    fi
done
