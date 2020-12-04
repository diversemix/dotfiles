tool_search() {
    if [ "$1" == "" ] ; then echo Need a search term as an argument! ; return 1 ; fi
    echo
    ag -c $1 ${TOOLBOX_DATA} | sort -r -t : -k 2 -g | sed -e 's/:/  /g' | awk '{printf "%s\t%s\n", $2, $1}' 
}

full_tool_search() {
    if [ "$1" == "" ] ; then echo Need a search term as an argument! ; return 1 ; fi
    echo
    ag $1 ${TOOLBOX_DATA} 
}

cheatsheet() {
    curl -s "https://raw.githubusercontent.com/duckduckgo/zeroclickinfo-goodies/master/share/goodie/cheat_sheets/json/$1.json" | grep -C 2 $2
}

tool_browse() {
  [ "$1" == "" ] && vi -c ":cd ${TOOLBOX_DATA}" ${TOOLBOX_DATA} || \
  vi -c ":cd ${TOOLBOX_DATA}" ${TOOLBOX_DATA}/$1.md
}

alias ts=tool_search
alias fts=full_tool_search
alias tb=tool_browse
alias td="~/dotfiles/scripts/todo.sh"
alias cheat=cheatsheet
echo "${YELLOW}Tools"
echo "    ${GREEN}tb${RESET}           : tool browse, opens vim in correct location, optional arg for file; e.g. tb {bash} "
echo "    ${GREEN}fts,ts${RESET}       : (full) tool search; e.g. ts vim"
echo "    ${GREEN}cheat${RESET}        : ddg cheatsheets; e.g. cheat tmux window"
echo "    ${GREEN}td${RESET}           : ${RED}My todo list${RESET}"
# EOF