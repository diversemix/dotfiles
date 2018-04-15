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
    echo "$remote_short${TEAL}:$branch"

    staged=$(git status -s | cut -c 1| uniq -c| sed -e 's/ //g' | grep -e '..' |tr -s ' ' | xargs)
    locally=$(git status -s | cut -c 2| uniq -c| sed -e 's/ //g' | grep -e '..' |tr -s ' ' | xargs)

    printf "${RED}[$locally]${TEAL}($staged)"
  fi
}

prompt_prefix() {
  if [ -d .git ]; then
    git_info
  else
    DISK=$(df -h / | tr -s ' ' | cut -d ' ' -f5 | tail -n 1 | cut -d '%' -f1)
    print_value_with_color "⛃ " ${DISK}

    MEM=$(free | grep Mem | awk  '{printf ("%2.0f", $3/$2 * 100.0) }')
    print_value_with_color "🗇 " ${MEM}
    #print_command_with_color "🖧 " "test_network"

    # disk, memory, network, dropbox
    echo "| ${YELLOW}$(hostname)${RESET}"
  fi
}

last_result() {
  if [ $? = 0 ]; then echo "${GOOD}"; else echo "${BAD}"; fi
}

LAST_RESULT="last_result"
THE_PWD="short_pwd"
PROMPT_PREFIX="prompt_prefix"

PS1="${P_RESET}\`${LAST_RESULT}\`${P_RESET}|${P_YELLOW}\`${PROMPT_PREFIX}\`${P_RESET}:${P_BLUE}\`${THE_PWD}\`\n${P_YELLOW}\$${P_RESET} "
echo ""
