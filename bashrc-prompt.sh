
# Prompt Section
# export PS1="\n\[\e[1;32m\]\w\[\e[1;31m\] [\!] \[\e[1;33m\]\$\[\e[m\] "

RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
WHITE="\[\033[37;1m\]"
GREEN="\[\033[32;1m\]"
BLUE="\[\033[34;1m\]"
SMILEY="${GREEN}✔${NORMAL}"
FROWNY="${RED}✖${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

PS1="${RESET}\`${SELECT}\` ${YELLOW}\h${NORMAL}:${BLUE}\w ${YELLOW}>${NORMAL}"
