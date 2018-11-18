source ~/dotfiles/bashrc-colors.sh

# Prompt Section

LAST_RESULT="last_result"
THE_PWD="short_pwd"
HOST_OR_GIT="host_or_git"
SYS_INFO="system_info"

PS1="${P_RESET}\`${LAST_RESULT}\` \`${SYS_INFO}\`${P_RESET}${P_YELLOW}\`${HOST_OR_GIT}\`${P_RESET}:${P_BLUE}\`${THE_PWD}\`\n${P_RESET}\$ "
echo ""
alias sp='PS1="${P_RESET}\`${LAST_RESULT}\` ${BLUE}\w${RESET}\n$ "'
alias bp='PS1="${P_RESET}\`${LAST_RESULT}\` \`${SYS_INFO}\`${P_RESET}${P_YELLOW}\`${HOST_OR_GIT}\`${P_RESET}:${P_BLUE}\`${THE_PWD}\`\n${P_RESET}\$ "'
