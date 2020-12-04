export RESET=$(tput sgr0)
export BOLD=$(tput bold)
export BLINK=$(tput blink)
export BLACK=$(tput bold;tput setaf 0)
export RED=$(tput bold;tput setaf 1)
export GREEN=$(tput bold;tput setaf 2)
export YELLOW=$(tput bold;tput setaf 3)
export BLUE=$(tput bold;tput setaf 4)
export MAGENTA=$(tput bold;tput setaf 5)
export TEAL=$(tput bold;tput setaf 6)
export WHITE=$(tput bold;tput setaf 7)

export GOOD="${GREEN}✔${RESET}"
export BAD="${RED}✖${RESET}"
