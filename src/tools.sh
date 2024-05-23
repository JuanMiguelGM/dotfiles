if command_present "rg"; then
  alias grep="rg"
  export FZF_DEFAULT_COMMAND='rg --files'
else
  add_package "ripgrep"
fi

if command_present "zoxide"; then
  eval "$(zoxide init $SHELL_ENV)"
else
  add_package "zoxide"
fi

if command_present "fdfind"; then
  alias fd="fdfind"
fi

if command_present "batcat"; then
  alias bat="batcat"
fi

if command_present "fd"; then
  export FZF_ALT_C_COMMAND='fd --type directory'
else
  add_apt_package "fd-find"
  add_brew_package "fd"
fi

if command_present "starship"; then
  # more on https://starship.rs/guide/
  eval "$(starship init $SHELL_ENV)"
else
  add_brew_package "starship"
fi

# To fix the icons in the terminal, install the following:
# brew install lsd
# brew tap homebrew/cask-fonts
# brew install --cask font-hack-nerd-font
# iTerm2 > Preferences > Profiles > Text > Non-ASCII-Font > Change Font -> Hack Nerd Font Regular 12

if command_present "lsd"; then
  alias ls='lsd'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'
else
  add_package "lsd"
fi

if command_present "fzf"; then
  export FZF_DEFAULT_OPTS='--reverse --border --exact --height=75% -m'
  export FZF_CTRL_T_OPTS="--bind 'ctrl-/:change-preview-window(down|hidden|)'"

  # fzf config (hook: alt-c, ctrl-t, ctrl-r)
  [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]] && source /usr/share/doc/fzf/examples/key-bindings.zsh
else
  add_package "fzf"
fi

if command_present "bat"; then
  local cmd="$(which bat)"
  [[ ! $! -eq 0 ]] && cmd="$(which batcat)"

  alias bat="$cmd"
  alias less="$cmd"

  # improve fzf preview
  export FZF_CTRL_T_OPTS="$FZF_CTRL_T_OPTS --preview '$cmd -n --color=always {}'"
else
  add_package "bat"
fi

if command_present "age"; then
  echo -n ""
else
  add_package "age"
fi

if command_present "lazygit"; then
  alias lg=lazygit
fi
