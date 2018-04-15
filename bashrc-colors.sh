
export RESET=$(tput sgr0)
export BOLD=$(tput bold)
export RED=$(tput bold;tput setaf 1)
export YELLOW=$(tput bold;tput setaf 3)
export WHITE=$(tput bold;tput setaf 7)
export GREEN=$(tput bold;tput setaf 2)
export BLUE=$(tput bold;tput setaf 4)
export TEAL=$(tput bold;tput setaf 6)

export P_RESET="\[${RESET}\]"
export P_RED="\[${RED}\]"
export P_YELLOW="\[${YELLOW}\]"
export P_WHITE="\[${WHITE}\]"
export P_GREEN="\[${GREEN}\]"
export P_BLUE="\[${BLUE}\]"
export P_TEAL="\[${TEAL}\]"

export GOOD="${BOLD}${GREEN}✔${RESET}"
export BAD="${BOLD}${RED}✖${RESET}"
