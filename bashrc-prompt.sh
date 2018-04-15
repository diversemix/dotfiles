source ~/dotfiles/bashrc-colors.sh

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
    branch_color=${TEAL}
    printf "${branch_color}[$branch]"
  fi
}

prompt_prefix() {
  if [ -d .git ]; then
    git_info
  else
    # disk, memory, network, dropbox
    echo "⛃ 🗇 🖧 🖿 |$(hostname)"
  fi
}

LAST_RESULT="if [ \$? = 0 ]; then echo \"${GOOD}\"; else echo \"${BAD}\"; fi"
THE_PWD="short_pwd"
PROMPT_PREFIX="prompt_prefix"

PS1="${P_RESET}\`${LAST_RESULT}\`${P_NORMAL}|${P_YELLOW}\`${PROMPT_PREFIX}\`${P_NORMAL}:${P_BLUE}\`${THE_PWD}\` ${P_YELLOW}\$${P_NORMAL} "
