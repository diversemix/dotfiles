export EDITOR=vim
export VISUAL=vim

# -----------------------------------------------------------------------
# Postgres
# export PGHOST=localhost
# export PGUSER=postgres
# export PGPASSWORD=postgres

# -----------------------------------------------------------------------
# .NET
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# -----------------------------------------------------------------------
# GO 
# export GOPATH=$HOME/go
# export GOROOT=/usr/local/go
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


# -----------------------------------------------------------------------
# gh cli
# GH_NO_UPDATE_NOTIFIER: set to any value to disable update notifications. By default, gh checks for new releases once every 24 hours and displays an upgrade notice on standard error if a newer version was found.
export GH_NO_UPDATE_NOTIFIER=1

# -----------------------------------------------------------------------
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# -----------------------------------------------------------------------
# FZF
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
#export FZF_CTRL_T_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,**/*.class}"'
export FZF_CTRL_T_OPTS='--border --info=inline --preview "bat --style=numbers --color=always --line-range :500 {}"  --bind shift-up:preview-page-up,shift-down:preview-page-down'

# -----------------------------------------------------------------------
# BAT
export BAT_THEME=ansi
export BAT_STYLE=changes,header,grid,numbers
