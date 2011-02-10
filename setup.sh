#!/bin/bash

args=("$@")
platform=`uname`

workingDirectory=`pwd`

nodeRepos=( \
    https://github.com/ry/node.git \
    https://github.com/isaacs/npm.git \
)

vimRepos=( \
    https://github.com/scrooloose/nerdtree.git \
    https://github.com/scrooloose/nerdcommenter.git \
    https://github.com/tpope/vim-fugitive.git \
    https://github.com/mattn/zencoding-vim.git \
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
    
    node cli.js config set unsafe-perm true 
    make install
    
    cd $workingDirectory
}

function vimSetup {
    
    cd ~/.vim
    
    mkdir -p .vim/{doc,plugin,syntax}
    
    ln -s ../Repositories/nerdtree/nerdtree_plugin
    ln -s ../Repositories/zencoding-vim/autoload

    cd plugin
    ln -s ../../Repositories/nerdtree/plugin/NERD_tree.vim
    ln -s ../../Repositories/nerdcommenter/plugin/NERD_commenter.vim
    ln -s ../../Repositories/vim-fugitive/plugin/fugitive.vim
    ln -s ../../Repositories/zencoding-vim/plugin/zencoding.vim

    cd ../doc
    ln -s ../../Repositories/nerdtree/doc/NERD_tree.txt
    ln -s ../../Repositories/nerdcommenter/doc/NERD_commenter.txt
    ln -s ../../Repositories/vim-fugitive/doc/fugitive.txt
    ln -s ../../Repositories/zencoding-vim/doc/zencoding.txt

    cd $workingDirectory
}

function cloneRepos {
    
    for arg in "${args[@]}"; do
        case "$arg" in
            vim)

                for repo in "${vimRepos[@]}"; do
                    
                    cd ~/Repositories
                    git clone $repo
                done

                vimSetup
                ;;
            node)

                for repo in "${nodeRepos[@]}"; do
                    
                    cd ~/Repositories
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
