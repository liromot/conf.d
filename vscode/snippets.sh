#!/usr/bin/env sh

VSCODE_PROFILES_DIR=~/".config/Code/User/profiles"
CONFIG_PATH=$(cd $(realpath $0 | xargs dirname) && pwd)

if [ -d "$VSCODE_PROFILES_DIR" ]; then
  for dir in "$VSCODE_PROFILES_DIR"/*/; do
    dir="${dir%/}"

    if [ ! -d "$dir/snippets" ]; then
      mkdir "$dir/snippets"
    fi

    echo "cp $CONFIG_PATH/snippets/* $dir/snippets/"
    cp $CONFIG_PATH/snippets/* $dir/snippets/
  done
fi
