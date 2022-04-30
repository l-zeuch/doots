# ZSH theme
#
# Certain aspects have been taken from robbyrussel's minimalistic
# theme, however I've added some more information such as current
# time and user@host, as well as an SSH connection prompt.
#
# Feel free to dislike, but this fits me best : )

local return_code="%(?..%{$fg[red]%}Exit %?%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$fg[red]%}%n@%m%{$reset_color%}'
else
    local user_host='%{$fg[green]%}%n@%m%{$reset_color%}'
fi

local current_dir='%{$fg[blue]%}%c%{$reset_color%}'
local git_branch='$(git_prompt_info)'
local time="%{$fg[cyan]%}%*%{$reset_color%} "

function ssh_connection() {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "%{$fg_bold[blue]%}(ssh) %{$reset_color%}"
    fi
}

PROMPT="$(ssh_connection)${user_host} %B${current_dir} %b"
RPROMPT="%B${return_code}%b ${git_branch} ${time}"


ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}\uE0A0 ‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
