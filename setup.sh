#!/bin/bash

args=("$@")
platform=`uname`

workingDirectory=`pwd`

nodeRepos=( \
    'https://github.com/ry/node.git' \
    'https://github.com/isaacs/npm.git' \
)

vimRepos=( \
    'https://github.com/scrooloose/nerdtree.git' \
    'https://github.com/tpope/vim-fugitive.git' \
)

function initializePlatform {
    
    if [[ "$platform" == 'Darwin' ]]; then
        
        # Handle an OSX system - assumes XCode is installed (LAME!)...
        sudo ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)"
        
        brew install git
        brew install macvim
        
    else
        
        # Handle an Ubuntu system...
        sudo apt-get -yq update
        sudo apt-get -yq upgrade
        
        sudo apt-get -yq install aptitude git build-essential openssh-server vim
        
    fi
}

function initializeHome {
    
    cd ~/

    git init
    git remote add origin git://github.com/cdata/home.git
    git pull origin master
    
    mkdir ~/Repositories
    mkdir ~/.local

    cd $workingDirectory
}


function nodeSetup {
    
    if [[ "$platform" == 'Darwin' ]]; then
        brew install openssl
    else
        sudo apt-get -yq install libssl-dev
    fi

    cd ~/Repositories/node
    
    ./configure --prefix=~/.local
    make && make install
    
    cd ~/Repositories/npm
    
    make install
    
    cd $workingDirectory
}

function vimSetup {
    
    cd ~/.vim

    mkdir doc
    mkdir plugin
    mkdir syntax
    
    ln -s ../Repositories/nerdtree/nerdtree_plugin
    
    cd plugin
    ln -s ../Repositories/nerdtree/plugin/NERD_tree.vim
    ln -s ../Repositories/vim-fugitive/plugin/fugitive.vim

    cd ../doc
    ln -s ../Repositories/nerdtree/doc/NERD_tree.txt
    ln -s ../Repositories/vim-fugitive/doc/fugitive.txt

    cd $workingDirectory
}

function cloneRepos {
    
    cd ~/Repositories

    for arg in $args; do
        case "$arg" in
            vim)
                echo "Performing vim setup..."

                for repo in $vimRepos; do

                    echo "Cloning $repo"
                    git clone $repo
                done

                vimSetup
                ;;
            node)
                echo "Performing node setup..."

                for repo in $nodeRepos; do

                    echo "Cloning $repo"
                    git clone $repo
                done
 
                nodeSetup
                ;;
        esac
    done

    cd $workingDirectory
}

function selfDestruct {
    
    rm $workingDirectory/$0
}

initializePlatform
initializeHome
cloneRepos
selfDestruct
