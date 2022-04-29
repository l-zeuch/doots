# Just a meme
which doas &>/dev/null
if [[ $? -eq 0 ]]; then
	alias didistutter='doas $(fc -ln -1)'
else
	which sudo &>/dev/null
	if [[ $? -eq 0 ]]; then
		alias didistutter='sudo $(fc -ln -1)'
	fi
fi

# Tool replacements
which bat &>/dev/null
if [[ $? -eq 0 ]]; then
	alias cat='bat --paging=never'
fi

which exa &>/dev/null
if [[ $? -eq 0 ]]; then
	alias ls='exa --long --group-directories-first --icons'
fi
