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

  programs.vim = {
    enable = false;
  };

  # Define vim package at the top level where we define other packages
  home.packages = with pkgs; [
    (vim_configurable.override {
      python3 = python3;
      guiSupport = "no";
      darwinSupport = true;
    })
  ];

  # Manage the entire .vim directory structure
  home.file.".vim" = {
    source = ./vim;
    recursive = true;
  };

  # Link the vimrc to the right location
  home.file.".vimrc".source = ./vim/vimrc;
  programs.git = {
    enable = true;
    includes = [
      { path = ./dotfiles/git/gitconfig; }
    ];
    ignores = ["*~" "*.swp" "*result*" ".direnv" ".DS_Store" "tags" ".projections.json"];
  };

  programs.zsh = {
    enable = true;
    initExtra = builtins.readFile ./dotfiles/zsh/zshrc;
  };

  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.ripgrep.enable = true;

  programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable=true;
  };

  home.file = {
    ".tmux.conf".source = ./dotfiles/tmux/tmux.conf;
    ".alacritty.toml".source = ./dotfiles/alacritty/alacritty.toml;
  };
}
