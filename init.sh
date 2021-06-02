#!/bin/sh
################################################################################
#
# Bash initialization template file
#
# Created by peromage 2021/02/24
# Last modified 2021/03/18
#
#
# This section should remain untouched
# Initialization
[ -z "$BASH_VERSION" ] && return
init_home=$(dirname $(realpath "$BASH_SOURCE"))
init_file=$(realpath "$BASH_SOURCE")
#
# Examples of configuration outside of ribash
#
# z.lua
#------
#eval "$(lua5.3 $init_home/bin/z.lua --init bash enhanced once)"
#
# Examples of configuration options of ribash
#
# Prompt theme
#-------------
#rice_theme="my-bash"
#
# Space separated string for mods under ribash/mods
#--------------------------------------------------------
#rice_mods="basic nav env"
#
################################################################################
rice_theme="my-bash"
rice_mods="basic nav env"
. $init_home/ribash/ribash.sh # Rice config should start before this line

export PATH=$HOME/a/bin:$PATH
. $HOME/a/workbench/init.sh
. $HOME/a/workbench/sources/ecgdev_docker.sh
. $HOME/a/workbench/sources/ecg2sdk_setup.sh

eval "$(lua5.3 $init_home/bin/z.lua --init bash enhanced once)"
alias dki="docker image ls"
alias dkc="docker ps -a"
alias dkrmi="docker rmi"
alias dkrm="docker rm"

cpm_setup() {
    local p="$HOME/repo/ecg_master"
    cd "$p"
    . env_setup.sh
    cd fnv/cpm
}
