# Use tmuxinator instead of tmux
alias tmux="tmuxinator"

# Path to your oh-my-zsh installation
export ZSH="/Users/iandias/.oh-my-zsh"

# Theme
ZSH_THEME="af-magic"

# Plugins
plugins=(git)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Autoload compinit
autoload -Uz compinit && compinit

# Enable URL quote magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Editor
export EDITOR="nvim"

# Aliases
# Add your custom aliases here

# RVM
# export PATH="$PATH:$HOME/.rvm/bin"

# Conda
# export PATH="$HOME/miniconda3/bin:$PATH"

# Lvim
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Change location of lazygit config
# export XDG_CONFIG_HOME="$HOME/.config"

# export PATH="$HOME/.config/lvim:$PATH"

export PATH="$PATH:$HOME/.local/bin"
# Direnv
eval "$(direnv hook zsh)"

# LazyGit config file
# export LG_CONFIG_FILE="/Users/iandias/.config/nvim/lua/plugins/lazygit/config.yml"
# export lazygit_config_file_path="/Users/iandias/.config/nvim/lua/plugins/lazygit/config.yml"
# Case-sensitive completion
# Uncomment the following line if you want to enable case-sensitive completion
# CASE_SENSITIVE="true"

# Auto-update settings
# Uncomment the following lines if you want to disable auto-update checks or set the update interval
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13

# Command auto-correction
# Uncomment the following line if you want to enable command auto-correction
# ENABLE_CORRECTION="true"

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
#
# neovim-remote: to open up nvim within lazigit
# if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
#     alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
# fi
#
# if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
#     export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
#     export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
# else
#     export VISUAL="nvim"
#     export EDITOR="nvim"
# fi

# Terravision: https://github.com/patrickchugh/terravision
export PATH=$PATH:/Users/iandias/Desktop/Work/terravision

# For Chatgpt CLI
alias cgpt="chatgpt"
