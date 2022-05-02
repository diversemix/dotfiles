export DISK_THRESHOLD=70
export MEM_THRESHOLD=50
export DOCKER_THRESHOLD=3
export SEP="▌"

# 160 ms base line
# Prompt Section
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
  if [ -d "$1/.git" ]; then
    echo "$(git status -s -b | grep -v "##" | wc -l | tr -d ' ')"
  else
    if [ "$1" != "/" ]; then
      git_local $(dirname $1)
    fi
  fi
}

set_prompt_vars() {
  # IMPORTANT - the checking of the last return code must come first
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

  # Using z.sh so handle the PROMPT_COMMAND
  if [ $_Z_NO_PROMPT_COMMAND ]
  then
    (_z --add "$(command pwd '$_Z_RESOLVE_SYMLINKS' 2>/dev/null)" 2>/dev/null &     )
  fi

  NEW_PWD="$(short_pwd)"
  PROMPT_PWD="▌${NEW_PWD}"

  GIT_BRANCH=""
  GIT_BRANCH="$(git_branch $PWD)"
  if [ ! -z "${GIT_BRANCH}" ]
  then
      if [ ${GIT_BRANCH::4} == "HEAD" ]
      then
        GIT_BRANCH=$(git rev-parse --short HEAD)
      fi
      GIT_BRANCH="${GIT_BRANCH}"
  fi

  GIT_LOCAL=0
  GIT_LOCAL=$(git_local $PWD)
  GIT_LOCAL=${GIT_LOCAL:=0}
  if [ ${GIT_LOCAL} -gt 0 ]
  then
      GIT_LOCAL="(${GIT_LOCAL})"
  else
      GIT_LOCAL=""
  fi

  DISK=0
  DISK=$(df -h $HOME | tr -s ' ' | cut -d ' ' -f5 | tail -n 1 | cut -d '%' -f1)
  if [ $DISK -gt $DISK_THRESHOLD ]
  then
    DISK="⛃ ${DISK}% "
  else
    DISK=""
  fi
  
  MEM=0
  MEM=$([ ! -z $(which free) ] && free | grep Mem | awk  '{printf ("%2.0f", $3/$2 * 100.0) }' || echo 0)
  if [ $MEM -gt $MEM_THRESHOLD ]
  then
    MEM="🐘${MEM}% "
  else
    MEM=""
  fi

  DKR_COUNT=0
  DKR_COUNT=$([ ! -z $(which ip) ] && ip a | grep veth | wc -l || echo 0)
  if [ $DKR_COUNT -gt $DOCKER_THRESHOLD ]
  then
    DKR_COUNT="🐋${DKR_COUNT} "
  else
    DKR_COUNT=""
  fi
}

prompt_test() {
  time for a in `seq 1 10` ; do set_prompt_vars ; done
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
    PS1="${TITLEBAR}${LAST_RESULT}${Y}${UC}\u${Y}@${UC}\h${EMW}${BK}\${DISK}\${MEM}\${DKR_COUNT}${NONE}${K}${BGY}\${GIT_BRANCH}${BGM}\${GIT_LOCAL}${BGB}\${PROMPT_PWD}${BGB}${B}${SEP}${UC}$ ${NONE}"
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

