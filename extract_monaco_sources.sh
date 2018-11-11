#!/bin/bash
set -e

cd vscode

yarn

node_modules/.bin/gulp editor-distro

cd ../monaco-editor-standalone

git rm -r *

cp -r ../vscode/out-monaco-editor-core .

git commit -am"Changes on $(date +'%Y-%m-%d')"

#git push origin master