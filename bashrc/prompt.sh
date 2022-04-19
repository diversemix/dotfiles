# Prompt Section
set_long_prompt() {
  PS1='$(last_result_color)${RESET}$(system-info) $(git_short_info $PWD)$(set_dir_title)$(short_pwd) $ '
}

set_short_prompt() {
  PS1='$(last_result_color)${RESET}$(git_short_info $PWD)$(set_dir_title)$(short_pwd) $ '
}

git_branch() {
  if [ -d $1/.git ]; then
    echo $(git status -s -b | head -n 1 | sed -e 's/## //g' | sed -e 's/\.\.\..*//g')
  else
    if [ "$1" != "/" ]; then
      git_branch $(dirname $1)
    fi
  fi
}

git_local() {
  if [ -d $1/.git ]; then
    echo "$(git status -s | cut -c 2| uniq -c| sed -e 's/ //g' | grep -e '..' |tr -s ' ' | awk 'BEGIN{OFS=","} FNR==1{first=$0;next} {val=val?val OFS $0:$0} END{print first OFS val}')" | tr -d ' '
  else
    if [ "$1" != "/" ]; then
      git_local $(dirname $1)
    fi
  fi
}

system_info() {
    MEM=$(free | grep Mem | awk  '{printf ("%2.0f", $3/$2 * 100.0) }')
    print_percent_with_color "⛃ ${DISK}%%" ${DISK}
    print_percent_with_color " 🐘${MEM}%%" ${MEM}
    printf " 🐋$(docker-count)\n"
}

set_prompt_vars() {
  # last result
  CODE=$?
  if [ $CODE = 0 ]
  then 
    OK="✔"
    BAD=""
  else 
    OK=""
    echo "${RED}${BOLD}${CODE}⏎"
    BAD="✖"
  fi

  NEW_PWD="$(short_pwd)"
  PROMPT_PWD="◣${NEW_PWD}◥"

  GIT_BRANCH="$(git_branch $PWD)"
  if [ ! -z "${GIT_BRANCH}" ]
  then
      GIT_BRANCH="◣ ${GIT_BRANCH}◥"
  fi

  GIT_LOCAL="$(git_local $PWD)"
  if [ ${#GIT_LOCAL} -gt 2 ]
  then
      GIT_LOCAL="◣${GIT_LOCAL}◥"
  else
      GIT_LOCAL=""
  fi

  DISK=$(df -h $HOME | tr -s ' ' | cut -d ' ' -f5 | tail -n 1 | cut -d '%' -f1)
  if [ $DISK -gt 70 ]
  then
    DISK="⛃ ${DISK}%%"
  else
    DISK=""
  fi
}

bash_prompt() {
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    
    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white
    
    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"
    
    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"
    local BK="\[\033[5m\]"
    
    local UC=$W                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color
    
    TITLEBAR="\[\033]0;\u:\${NEW_PWD}\007\]"
    LAST_RESULT="${EMG}\${OK}${EMR}\${BAD}"
    PS1="${TITLEBAR}${LAST_RESULT}${EMY}${UC}\u${EMY}@${UC}\h ${BGR}${EMK}${BK}\${DISK}${NONE} ${BGY}${EMK}\${GIT_BRANCH}${BGM}\${GIT_LOCAL}${BGB}\${PROMPT_PWD}${UC}$ ${NONE}"
}

PROMPT_COMMAND=set_prompt_vars
bash_prompt
unset bash_prompt

# 
# NOTE: There are issues with creating a complex prompt, this relates to how
#       bash calculates its size. This needs changing to use the following:
#  https://bash.cyberciti.biz/guide/Changing_bash_prompt#Creating_complex_prompt
#
# Never just use this
# set_long_prompt
#
# Test to make prompt wrap
# echo -n A ;echo -n B ;echo -n C ;echo -n D ;echo -n E ;echo -n F ;echo -n G ; echo -n H ;echo -n I ;echo -n J ;echo -n K ;echo -n L ;echo -n M ;echo -n N ;echo O 

