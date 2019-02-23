source ~/dotfiles/bashrc-colors.sh

last_result() {
  if [ $? = 0 ] ; then echo ${GOOD}; else echo ${BAD}; fi
}
# Prompt Section

THE_PWD="short_pwd"
HOST_OR_GIT="host_or_git"
SYS_INFO="system_info"
echo ""

PS1='\[$(last_result)\] \[${BLUE}\]\w\[${RESET}\] $ '

# Large prompt -depricated as its taking a long time to perfect
# alias bp='PS1="${P_RESET}\`${LAST_RESULT}\` \`${SYS_INFO}\`${P_RESET}${P_YELLOW}\`${HOST_OR_GIT}\`${P_RESET}:${P_BLUE}\`${THE_PWD}\`\n${P_RESET}\$ "'
