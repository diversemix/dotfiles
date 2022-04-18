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
#PS1='\[$(last_result_color)\]\w\[${RESET}\]$(system-info)$(git_short_info)$(set_dir_title)$ '
long-prompt() {
  PS1='\[$(last_result_color)\]\[${RESET}\]$(system-info)$(git_short_info)$(set_dir_title) $(short_pwd) $ '
}

short-prompt() {
  PS1='\[$(last_result_color)\]\[${RESET}\]$(git_short_info)$(set_dir_title) $(short_pwd) $ '
}
short-prompt
