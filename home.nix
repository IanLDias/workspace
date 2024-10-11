{ pkgs, ... }: {
  home.stateVersion = "23.05";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = false;
    vimAlias = false;
    # extraConfig = builtins.readFile ./nvim/init.lua;
  };

  programs.git = {
    enable = true;
    includes = [
      { path = ./dotfiles/git/gitconfig; }
    ];
    ignores = ["*~" "*.swp" "*result*" ".direnv" ".DS_Store" "tags" ".projections.json"];
  };

  programs.zsh = {
    enable = true;
  };

  programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable=true;
  };

  home.file = {
    ".tmux.conf".source = ./dotfiles/tmux/tmux.conf;
    ".alacritty.toml".source = ./dotfiles/alacritty/alacritty.toml;
    ".zshrc".source = ./dotfiles/zsh/zshrc;
  };
}
