#!/usr/bin/env bash

config_path="$HOME/.config"
if [ ! -d $config_path ]; then
    mkdir "$config_path"
fi

deploy_nvim () {
    path="$config_path/nvim"

    rm -rf $path
    cp -r ./nvim $path
    echo "Successfully deployed nvim to $path."
}

deploy_alac () {
    path="$config_path/alacritty"

    rm -rf $path
    cp -r ./alacritty $path
    echo "Successfully deployed alacritty to $path."
}

deploy_zellij () {
    path="$config_path/zellij"

    rm -rf $path
    cp -r ./zellij $path
    echo "Successfully deployed zellij to $path."
}


if [[ "$1" == "" ]]; then
    echo Error: no deploy target
    echo "Avalible targets: "
    echo "- nvim : neovim"
    echo "- alac : alacritty terminal"
    echo "- zellij : layout manager"
    echo "- all : all of above"
    exit 1
elif [[ "$1" == "nvim" ]]; then
    deploy_nvim
elif [[ "$1" == "alac" ]]; then
    deploy_alac
elif [[ "$1" == "zellij" ]]; then
    deploy_zellij
elif [[ "$1" == "all" ]]; then
    deploy_alac
    deploy_zellij
    deploy_nvim
fi
