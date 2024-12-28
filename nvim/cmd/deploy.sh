#!/bin/sh

config_path="$HOME/.config"

if [ ! -d "$config_path" ]; then
  mkdir "$config_path"
fi

cp -r ../nvim "$config_path"
