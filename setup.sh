#!/bin/bash

args=("$@")
platform=`uname`

workingDirectory=`pwd`

repositories=( \
    https://github.com/cdata/home.git \
    https://github.com/revans/bash-it.git \
)

function initializePlatform {
    
    if [[ "$platform" == 'Darwin' ]]; then
        
        # Handle an OSX system - assumes XCode is installed (LAME!)...
        /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"

        brew install git
        brew install macvim
        
    else
        
        # Handle an Ubuntu system...
        sudo apt-get -yq update
        sudo apt-get -yq upgrade
        
        sudo apt-get -yq install aptitude git build-essential openssh-server vim rubygems1.8
        
    fi
}

function initializeRepositories {

    mkdir ~/repositories
    cd ~/repositories

    for repository in "${repositories[@]}"; do
        git clone $repository
    done

    cd home
    git submodule init
    git submodule update
}

function initializeDotFiles {
    
    cd ~/

    if [[ -e .bashrc ]]; then
        mv .bashrc .bashrc.backup
    fi

    if [[ -e .bash_profile ]]; then
        mv .bash_profile .bash_profile.backup
    fi

    ln -s ~/repositories/home/.vim
    ln -s ~/repositories/home/.vimrc
    ln -s ~/repositories/home/.gvimrc
    ln -s ~/repositories/home/.screenrc
    ln -s ~/repositories/home/.bash_profile
    ln -s ~/repositories/home/.bashrc
    ln -s ~/repositories/home/.support
    ln -s ~/repositories/bash-it .bash_it

    if [[ ! -e .ssh ]]; then
        mkdir .ssh
    fi

    cd .ssh

    ln -s ~/repositories/home/publickeys authorized_keys
}

function selfDestruct {
    
    rm $workingDirectory/$0
}

initializePlatform
initializeRepositories
initializeDotFiles
selfDestruct

