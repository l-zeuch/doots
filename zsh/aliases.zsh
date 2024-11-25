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

which eza &>/dev/null
if [[ $? -eq 0 ]]; then
    alias ls='eza -gh --group-directories-first --git --icons --hyperlink'
    alias lh='ls -d .*'
    alias lD='ls -D'
    alias lc='ls -1'
    alias ll='ls -l'
    alias la='ll -a'
    alias lA='ll --sort=acc'
    alias lC='ll --sort=cr'
    alias lM='ll --sort=mod'
    alias lS='ll --sort=size'
    alias lX='ll --sort=ext'
    alias llm='lM'
    alias l='la -a'
    alias lsa='l'
    alias lx='l -HimUuS'
    alias lxa='lx -Z@'
    alias lt='ls -T'
    alias tree=lt
fi

which zoxide &>/dev/null
if [[ $? -eq 0 ]]; then
    alias cd='z'
fi

goinside() {
    docker exec -it $1 bash -c "stty cols $COLUMNS rows $LINES && bash";
}
