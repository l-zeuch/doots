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

PATH="$HOME/.local/share/go/bin:$PATH"
PATH="/var/lib/gems/2.7.0/gems:$PATH"
PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
PATH="$HOME/.config/spicetify:$PATH"
PATH="$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"
PATH="$HOME/.local/share/cargo/bin/:$PATH"
export PATH=$PATH

export EDITOR=/usr/bin/nvim

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# XDG-based application config (alphabetical by application)
# Cargo/Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Dotnet/NuGet
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

# GnuPG
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Go
export GOPATH="$XDG_DATA_HOME/go"

# GTK
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Node/NPM
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export TUF_ROOT="$XDG_DATA_HOME/sigstore/root"

# Python
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"

# Redis
export REDISCLI_RCFILE="$XDG_CONFIG_HOME/redis/redisclirc"
export REDISCLI_HISTFILE="$XDG_DATA_HOME/redis/rediscli_history"

# SQLite
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

# TeX Live
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"

# PostgreSQL
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"

# X11
export XCOMPOSEFILE="$XDG_CONFIG_HOME/X11/XCompose"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

# Xauthority (with SSH override)
export XAUTHORITY="$XDG_CACHE_HOME/Xauthority"
if [ -n "$SSH_CONNECTION" ]; then
    export XAUTHORITY="$HOME/.Xauthority"
fi

# Other
export MANPAGER="nvim -c 'Man!' -o -"
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'

