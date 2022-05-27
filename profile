# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

# expand set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes NPM bin if it exists
if [ -d "$HOME/.local/share/npm/bin" ] ; then
    PATH="$HOME/.local/share/npm/bin:$PATH"
fi

PATH="$HOME/.local/share/cargo/env:$PATH"
PATH="/usr/local/go/bin:$PATH"
PATH="$HOME/.local/share/cargo/bin:/var/lib/gems/2.7.0/gems:$PATH"
PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH=$PATH

export TERMINAL="kitty"

export EDITOR=/usr/bin/nvim
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'
# Clean $HOME, according to XDG directory specification
# See also: https://wiki.archlinux.org/title/XDG_Base_Directory
if [ -f "$HOME/.config/dirs.rc" ]; then
    source $HOME/.config/dirs.rc
fi

if [ -f "$HOME/.config/secrets.env" ]; then
    source $HOME/.config/secrets.env
fi
