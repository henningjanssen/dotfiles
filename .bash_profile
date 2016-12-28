export EDITOR=vim

GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;34m\]"
RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
COLOREND="\[\e[00m\]"

# Responsive Prompt
parse_git_branch() {
	if [[ -f "$BASH_COMPLETION_DIR/git-completion.bash" ]]; then
		branch=`__git_ps1 "%s"`
	else
		ref=$(git symbolic-ref HEAD 2> /dev/null) || return
		branch="${ref#refs/heads/}"
	fi

	if [[ $branch != "" ]]; then
		if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working directory clean" ]]; then
			echo "${GREEN}$branch${COLOREND}"
		else
			echo "${RED}$branch${COLROEND}"
		fi
	fi
}

parse_remote_state() {
	remote_state=$(git status -sb 2> /dev/null | grep -oh "\[.*\]")
	if [[ "$remote_state" != "" ]]; then
		out="${BLUE}[${COLOREND}"

		if [[ "$remote_state" == *ahead* ]] && [[ "$remote_state" == *behind* ]]; then
			behind_num=$(echo "$remote_state" | grep -ohP "behind \d*" | grep -ohP "\d*$")
			ahead_num=$(echo "$remote_state" | grep -ohP "ahead \d*" | grep -ohP "\d*$")
			out="$out${RED}$behind_num${COLOREND},${GREEN}$ahead_num${COLOREND}"
		elif [[ "$remote_state" == *ahead* ]]; then
			ahead_num=$(echo "$remote_state" | grep -ohP "ahead \d*" | grep -ohP "\d*$")
			out="$out${GREEN}$ahead_num${COLOREND}"
		elif [[ "$remote_state" == *behind* ]]; then
			behind_num=$(echo "$remote_state" | grep -ohP "behind \d*" | grep -ohP "\d*$")
			out="$out${RED}$behind_num${COLOREND}"
		fi

		out="$out${BLUE}]${COLOREND}"
		echo " $out"
	fi
}

prompt() {
	if [[ $? -eq 0 ]]; then
		exit_status="${BLUE}›${COLOREND} "
	else
		exit_status="${RED}›${COLOREND} "
	fi

	PS1="\[\033[01;32m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n $(parse_git_branch)$(parse_remote_state)$exit_status"
}

PROMPT_COMMAND=prompt

