last_result_color() {
  if [ $? = 0 ]
  then 
    echo "${GREEN}✔ ${RESET}"
  else 
    echo "${RED}$?⏎ ✖ ${RESET}"
  fi
}

# Prompt Section
set_long_prompt() {
  PS1='$(last_result_color)${RESET}$(system-info) $(git_short_info $PWD)$(set_dir_title)$(short_pwd) $ '
}

set_short_prompt() {
  PS1='$(last_result_color)${RESET}$(git_short_info $PWD)$(set_dir_title)$(short_pwd) $ '
}

set_prompt_vars() {
  set_dir_title
}

bash_prompt() {
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

