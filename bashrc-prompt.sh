source ~/dotfiles/bashrc-colors.sh

# Prompt Section

LAST_RESULT="last_result"
THE_PWD="short_pwd"
PROMPT_PREFIX="prompt_prefix"

PS1="${P_RESET}\`${LAST_RESULT}\`${P_RESET}|${P_YELLOW}\`${PROMPT_PREFIX}\`${P_RESET}:${P_BLUE}\`${THE_PWD}\`\n${P_YELLOW}\$${P_RESET} "
echo ""
