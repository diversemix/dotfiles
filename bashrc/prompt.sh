last_result_color() {
  if [ $? = 0 ]
  then 
    echo "${GREEN}✔ ${RESET}"
    export LAST_RESULT=1
  else 
    echo "${RED}$?⏎ ✖ ${RESET}"
    export LAST_RESULT=0
  fi
}

# Prompt Section
long-prompt() {
  PS1='\[$(last_result_color)\]\[${RESET}\]$(system-info) $(git_short_info $PWD)$(set_dir_title)$(short_pwd) $ '
}

short-prompt() {
  PS1='\[$(last_result_color)\]\[${RESET}\]$(git_short_info $PWD)$(set_dir_title)$(short_pwd) $ '
}
short-prompt
