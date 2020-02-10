git_url() {
	curl -s -H "${H_TOKEN}" -H "${H_ACCEPT}" $1
}

show_column() {
	printf "${1}%0.s-" {1..10}
	git_url https://api.github.com/projects/columns/$3/cards | 
		jq '.[] | { content_url: .content_url }' |
		grep ":"| cut -d "\"" -f4 > /tmp/open_urls_$3
	NUM=$(wc -l /tmp/open_urls_$3| cut -d ' ' -f1) 
	printf " $2 (${NUM})\n\n" 
	echo "" > /tmp/column_$3
	for url in $(cat /tmp/open_urls_$3)
	do
		git_url "${url}" | 
			jq '{title: .title, url: .html_url, name: .user.login }' | 
			grep ":" | cut -d "\"" -f4 | paste -d "," - - - >> /tmp/column_$3
	done
	cat /tmp/column_$3| column -s, -t
}


pulls() {
	git_url https://api.github.com/repos/elifesciences/elife-xpub/pulls?state=open |
		jq '.[] | {title: .title, url: .html_url, name: .user.login }' > /tmp/open.json
	printf "${BLUE}%0.s-" {1..10}
	printf " PULL REQUESTS\n"
	cat /tmp/open.json | grep ":" | cut -d "\"" -f4 | paste -d "," - - - | column -s, -t
	echo ""
}

kanban() {
	# Useful for getting the other endpoints ... 
	# git_url https://api.github.com/repos/elifesciences/elife-xpub/projects
	# git_url https://api.github.com/projects/1391224
	# git_url https://api.github.com/projects/1391224/columns
	# git_url https://api.github.com/projects/columns/2434975/cards

	# ToDo
	show_column ${YELLOW} "TODO" 6581624

	# In Progress  
	show_column ${GREEN} "IN PROGRESS" 5944599

	# Done
	# show_column ${RED} "DONE" 5944601
}

xpub() {
	pulls
	kanban
}

export NEW_RELIC_NO_CONFIG_FILE=true
