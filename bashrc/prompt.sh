last_result_color() {
  if [ $? = 0 ]
  then 
    echo "${BLUE}✔ "
    export LAST_RESULT=1
  else 
    echo "${RED}$? ✖ "
    export LAST_RESULT=0
  fi
}

# Prompt Section

THE_PWD="short_pwd"
HOST_OR_GIT="host_or_git"
SYS_INFO="system_info"
PS1='\[$(last_result_color)\]\w\[${RESET}\] $(git_info)\n$ '


# TODO - would be good to do some checking if in a git repo folder
# Large prompt -depricated as its taking a long time to perfect
# alias bp='PS1="${P_RESET}\`${LAST_RESULT}\` \`${SYS_INFO}\`${P_RESET}${P_YELLOW}\`${HOST_OR_GIT}\`${P_RESET}:${P_BLUE}\`${THE_PWD}\`\n${P_RESET}\$ "'
