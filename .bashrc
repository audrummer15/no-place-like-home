# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

########################################################################
#
# Customize the prompt
#
########################################################################

# Fill with underscore ___ or minuses ---
# (this is recalculated every time the prompt is shown in function prompt_command):
fill="___ "
reset_style='\[\033[00m\]'
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
command_style=$reset_style
prompt_style=$reset_style'\[\033[1;29m\]' # bold black

# http://osxdaily.com/2006/12/11/how-to-customize-your-terminal-prompt/
PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\[\e[1;33m\][\[\e[m\]\[\e[1;34m\]\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;34m\]\h\[\e[m\]\[\e[1;33m\]:\[\e[m\] \[\e[1;34m\]\W\[\e[m\]\[\e[1;33m\]]\[\e[m\]\[\e[1;33m\]\\$\[\e[m\]'"$command_style "

# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG


function prompt_command {
	# create a $fill of all screen width minus the time string and a space:
	let fillsize=${COLUMNS}-9
	fill=""

	while [ "$fillsize" -gt "0" ]
	do
		fill="-${fill}" # fill with underscores to work on
		let fillsize=${fillsize}-1
	done

	# If this is an xterm set the title to user@host:dir
	# If you don't want to change the title, comment out this block
	case "$TERM" in
		xterm*|rxvt*)
			bname=`basename "${PWD/$HOME/~}"`
			echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
			;;
		*)
			;;
	esac
}

PROMPT_COMMAND=prompt_command

########################################################################
#
# End Prompt Customization
#
########################################################################


########################################################################
#
# Random functions
#
########################################################################
function do-work() {
	TODAY=$({ echo "$HOME/Documents/Daily/"; date +"%m-%d-%y"; } | tr -d "\n")

	if [ ! -d $TODAY ]
    	then
        	echo "Creating directory $TODAY..."
        	mkdir $TODAY
	else
        	echo "$TODAY already exists..."
	fi

	echo "Moving to directory $TODAY..."
	cd $TODAY
	mkdir archived_jobs
}
