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
        
    else
        
        # Handle an Ubuntu system...
        sudo apt-get -yq update
        sudo apt-get -yq upgrade
        
        sudo apt-get -yq install aptitude git build-essential
        
    fi
}

function initializeHome {
     
    git clone git@github.com:cdata/home.git ~/

    mkdir ~/Repositories
    mkdir ~/.local
}

function cloneRepos {
    
    for arg in $args
        case "$arg" in
            vim)
                for repo in $vimRepos
                    git clone $repo ~/Repositories/
                done

                vimSetup
                ;;
            node)
                for repo in $nodeRepos
                    git clone $repo ~/Repositores/
                done
 
                nodeSetup
                ;;
        esac
    done
}

function nodeSetup {
    
    if [[ "$platform" == 'Darwin' ]]; then
        brew install openssl
    else
        sudo apt-get install libssl-dev
    fi

    cd ~/Repositories/node
    
    ./configure --prefix=~/.local
    make && make install
    
    cd ~/Repositories/npm
    
    make install
    
    cd $workingDirectory
}

function vimSetup {
    
    # General VIM folder structure
    mkdir ~/.vim/doc
    mkdir ~/.vim/plugin
    mkdir ~/.vim/syntax
    
    # NERD tree
    ln -s ../Repositories/nerdtree/nerdtree_plugin
    ln -s ../Repositories/nerdtree/plugin/NERD_tree.vim ~/.vim/plugin/NERD_tree.vim
    ln -s ../Repositories/nerdtree/doc/NERD_tree.txt ~/.vim/doc/NERD_tree.txt

    # Fugitive
    ln -s ../Repositories/vim-fugitive/plugin/fugitive.vim ~/.vim/plugin/fugitive.vim
    ln -s ../Repositories/vim-fugitive/doc/fugitive.txt ~/.vim/doc/fugitive.txt
}

function selfDestruct {
    
    rm $workingDirectory/$0
}

initializePlatform
initializeHome

