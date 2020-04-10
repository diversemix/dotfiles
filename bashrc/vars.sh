export SVN_EDITOR=vim
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export VISUAL=vim
export EDITOR="$VISUAL"

export WORKON_HOME=${HOME}/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Assume we have dropbox installed
export TOOLBOX_DATA=~/diversemix.github.io/toolbox
echo -n "Got vars..."
