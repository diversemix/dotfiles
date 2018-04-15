# Prompt Section
# export PS1="\n\[\e[1;32m\]\w\[\e[1;31m\] [\!] \[\e[1;33m\]\$\[\e[m\] "
short_pwd() {
  local pwd=$(pwd)
  pwd=${pwd/#$HOME/\~}
  sed 's:\([^/]\)[^/]*/:\1/:g' <<<"$pwd"
}

git_info() {
  if [ -d .git ]; then
    #local pwd=$(pwd)
    #echo ${pwd} $(pwd) $PWD
    local branch=$(git status -s -b | head -n 1 | sed -e 's/## //g' | sed -e 's/\.\.\..*//g')
    local remote=$(git remote -v | grep fetch | cut -f2 | cut -d ' ' -f1)
    local remote_short=$(echo $remote | \
      sed -e 's/https:\/\/github.com\///g' | \
      sed -e 's/.git$//g' | \
      sed -e 's/git@github.com://g')
    echo $remote_short
    branch_color='\033[0;36m'
    printf "${branch_color}[$branch]:"
  fi
}

prompt_prefix() {
  if [ -d .git ]; then
    git_info
  else
    echo $(hostname):
  fi
}

RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
WHITE="\[\033[37;1m\]"
GREEN="\[\033[32;1m\]"
BLUE="\[\033[34;1m\]"
GOOD="${GREEN}✔${NORMAL}"
BAD="${RED}✖${NORMAL}"
LAST_RESULT="if [ \$? = 0 ]; then echo \"${GOOD}\"; else echo \"${BAD}\"; fi"
THE_PWD="short_pwd"
PROMPT_PREFIX="prompt_prefix"

PS1="${RESET}\`${LAST_RESULT}\`${NORMAL}|${YELLOW}\`${PROMPT_PREFIX}\`${BLUE}\`${THE_PWD}\` ${YELLOW}\$${NORMAL} "
