
# Add symbolic links

If the files exist already, create a backup and remove them.

- Change ZSH location to use this new location
ln -s ~/.config/workspace/zsh/.zshrc ~/.zshrc

- Alacritty
ln -s ~/.config/workspace/.alacritty.toml ~/.config/.alacritty.toml

- Tmux
ln -s ~/.config/workspace/tmux/.tmux.conf ~/.tmux.conf

- Nvim
ln -s ~/.config/workspace/nvim ~/.config/nvim
