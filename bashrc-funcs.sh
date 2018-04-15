
function topmem()
{
    ps -eo size,pid,user,command --sort -size | \
        awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s" , $x) } print "" }' | \
        head

}


function set-title() {
    TITLE=$1
    PROMPT_COMMAND='echo -ne "\033]0;${TITLE}\007"'
}


function swap()
{
    awk '{ t = $1; $1 = $2; $2 = t; print; }'
}

print_value_with_color() {
	message=$1
	value=$2
	color=${RED}
	if [ $value -le 80 ] ; then color=${YELLOW} ; fi
	if [ $value -le 50 ] ; then color=${GREEN} ; fi
	printf "${color}${message}${NORMAL}"
}

print_command_with_color() {
  message=$1
  command=$2
  color=${RED}
  value=$($command)
  if [ $? = 0 ]; then color=${GREEN} ; fi
  printf "${color}${message}${value}${RESET}"
}

test_network() {
  ping -t200 -c1 google.co.uk 2>&1 >/dev/null
}

test_dropbox() {
  out=$(dropbox status)
  echo $out ; ps aux | grep dropbox | grep -v grep >/dev/null
}

print_stats() {
	DISK=$(df -h / | tr -s ' ' | cut -d ' ' -f5 | tail -n 1 | cut -d '%' -f1)
	MEM=$(free | grep Mem | awk  '{printf ("%2.0f", $3/$2 * 100.0) }')
	SWAP=$(free | grep Swap | awk '{printf ("%2.0f", $3/$2 * 100.0) }')

	printf "${GREEN}✔ Last    : Return value of last command${RESET}\n"
	# disk, memory, network, dropbox

	print_value_with_color "⛃ Disk    : ${DISK}%% \n" ${DISK}
	print_value_with_color "🗇 Memory  : ${MEM}%% \n" ${MEM}
	print_value_with_color "  Swap    : ${SWAP}%% \n" ${SWAP}
	print_command_with_color "🖧 Network : " "test_network"
  echo ""
	print_command_with_color "🖿 Dropbox : " "test_dropbox"
  echo ""
}
