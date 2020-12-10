function topmem()
{
    ps -eo size,pid,user,command --sort -size | \
        awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s" , $x) } print "" }' | \
        cut -c -120 |\
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

short_pwd() {
  local pwd=$(pwd)
  pwd=${pwd/#$HOME/\~}
  sed 's:\([^/]\)[^/]*/:\1/:g' <<<"$pwd"
}

git_info() {
  if [ -d .git ]; then
    local branch=$(git status -s -b | head -n 1 | sed -e 's/## //g' | sed -e 's/\.\.\..*//g')
    local remote=$(git remote -v | grep fetch | cut -f2 | cut -d ' ' -f1)
    if [ -z "$remote" ]
    then
      printf "⇒ ${TEAL}($branch)${RESET}\n"
      return
      printf "cheese"
    fi

    local remote_short=$(echo $remote | \
      sed -e 's/https:\/\/github.com\///g' | \
      sed -e 's/.git$//g' | \
      sed -e 's/git@github.com://g')

    staged="($(git status -s | grep -v '?' |cut -c 1| uniq -c| sed -e 's/ //g' | grep -e '..' |tr -s ' ' | xargs))"
    locally="[$(git status -s | cut -c 2| uniq -c| sed -e 's/ //g' | grep -e '..' |tr -s ' ' | xargs)]"

    ahead_by=$(git rev-list ${branch}..HEAD|wc -l)
    behind_by=$(git rev-list HEAD..${branch}|wc -l)
    sync="${RESET} ${ahead_by}▼ ${behind_by}▲ "
    printf "⇒ ${TEAL}${branch}${sync}${RED}$locally ${GREEN}${staged}${RESET}\n"
    printf "%-45s %s\n%-45s %s\n%-45s %s\n%-45s %s\n" \
      $(pwd) [${ahead_by}] \
      ${remote_short}:${branch} [${behind_by}] \
      "Not staged" "${locally}" \
      "Staged" ${staged} \
      >/tmp/last_git
  fi
}

docker-info() {
    docker ps -a --format "....{{.Image}} | {{.Status}}"
}

docker-count() {
  docker ps | grep -v CONTAINER | wc -l
}

system-info() {
    DISK=$(df -h / | tr -s ' ' | cut -d ' ' -f5 | tail -n 1 | cut -d '%' -f1)
    MEM=$(free | grep Mem | awk  '{printf ("%2.0f", $3/$2 * 100.0) }')
    print_percent_with_color "⛃ ${DISK}%%" ${DISK}
    print_percent_with_color " 🐘 ${MEM}%%" ${MEM}
    printf " 🐋 $(docker-count)\n"
}

host_or_git() {
  if [ -d .git ]; then
    git_info
  else
    echo " ${YELLOW}$(hostname)${RESET}"
  fi
}

print_nonzero_with_color() {
  message=$1
  value=$2
  color=${RED}
  if [ $value -le 0 ] ; then color=${GREEN} ; fi
  if [ $value -gt 0 ] ; then color=${RED}${BLINK} ; fi
  printf "${color}${message}${RESET}"
}

print_percent_with_color() {
  message=$1
  value=$2
  color=${RED}${BLINK}
  if [ $value -le 80 ] ; then color=${YELLOW}${BLINK} ; fi
  if [ $value -le 50 ] ; then color=${GREEN} ; fi
  printf "${color}${message}${RESET}"
}

print_command_with_color() {
  message=$1
  command=$2
  value=$(${command})
  if [ $? = 0 ]
  then
    color=${GREEN}
    [ "${value}" == "" ] && value="good"
  else
    color=${RED}${BLINK}
    [ "${value}" == "" ] && value="bad"
  fi
  printf "${color}${message}${value}${RESET}"
}

test_network() {
  ping -t200 -c1 google.co.uk 2>&1 >/dev/null
}

test_dropbox() {
  out=$(dropbox status)
  echo $out ; ps aux | grep dropbox | grep -v grep >/dev/null
}

test_uncommited() {
  pushd . > /dev/null; cd $1 ; git status -s | wc -l ; popd > /dev/null
}

genetics_define() {
  curl -s https://www.genomicseducation.hee.nhs.uk/glossary/$1/ | pup  'meta[property="og:description"] attr{content}'
}


git_search() {
  curl -s "https://github.com/search?q=$1&type=repositories" | pup 'ul[class="repo-list"]' | sed -e 's/href=\"/href=\"https:\/\/github.com/g' | w3m -T text/html
}

print-status() {
  DISK=$(df -h / | tr -s ' ' | cut -d ' ' -f5 | tail -n 1 | cut -d '%' -f1)
  MEM=$(free | grep Mem | awk  '{printf ("%2.0f", $3/$2 * 100.0) }')
  SWAP=$(free | grep Swap | awk '{printf ("%2.0f", $3/$2 * 100.0) }')
  DOCKER=$(docker ps | grep -v CONTAINER | wc -l)

  print_percent_with_color "  💾 Disk    : ${DISK}%% \n" ${DISK}
  print_percent_with_color "  🐘 Memory  : ${MEM}%% \n" ${MEM}
  print_percent_with_color "  🧻 Swap    : ${SWAP}%% \n" ${SWAP}
  print_command_with_color "  🤝 Network : " "test_network"
  echo ""
  print_command_with_color "  🧳 Dropbox : " "test_dropbox"
  echo ""
  print_command_with_color "  🐋 Docker  : " "docker-count"
  echo ""
  uncommited=$(test_uncommited ${TOOLBOX_DATA})
  print_nonzero_with_color "  toolbox  : ${uncommited}"  ${uncommited}
  echo ""
  uncommited=$(test_uncommited ${HOME}/dotfiles)
  print_nonzero_with_color "  dotfiles : ${uncommited}"  ${uncommited}
  echo ""
}

echo "${YELLOW}Functions"
echo "    ${GREEN}topmem${RESET}       : lists top memory hogs"
echo "    ${GREEN}set-title${RESET}    : sets window title"
echo "    ${GREEN}print-status${RESET} : prints status of system"
echo "    ${GREEN}system-info${RESET}  : one line status of system"
echo "    ${GREEN}docker-info${RESET}  : docker version"
# EOF
