#!/bin/bash
export CF_ROOT=$HOME/Documents/Repositories/cf-www

export NGX_REPOS=${HOME}/Documents/repositories
export NGX_MODULES_LOCATION=${NGX_REPOS}/nginx-modules
export NGX_INSTALL_PREFIX=${HOME}/.bin/nginx-ui

alias repos='cd ~/repositories'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

##
# Your previous /Users/chrisjoel/.bash_profile file was backed up as /Users/chrisjoel/.bash_profile.macports-saved_2010-06-13_at_18:54:02
##

# MacPorts Installer addition on 2010-06-13_at_18:54:02: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:~/.local/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin

# Path to the bash it configuration
export BASH=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
#export BASH_THEME='doubletime'
#export BASH_THEME='modern-t'
export BASH_THEME='modern'

# Your place for hosting Git repos. I use this for private repos.
#export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR='vim'

# Set the path nginx
#export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to the path of your local jekyll root to use the jekyll aliases

#export JEKYLL_LOCAL_ROOT="$HOME/Sites/jekyllsite"

# And change this to the remote server and root

#export JEKYLL_REMOTE_ROOT="user@server:/path/to/jekyll/root"

# And, for the last of the jekyll variables, this is the formatting you use, eg: markdown,
# textile, etc. Basically whatever you use as the extension for posts, without the preceding dot

#export JEKYLL_FORMATTING="markdown"

# Change this to your console based IRC client of choice.

export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli

#export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH/bash_it.sh

