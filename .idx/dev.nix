{ pkgs ? import <nixpkgs> {} }:

{
  channel = "nixos-24.11";
 
  packages = with pkgs; [
    nodejs_20
    terraform
    awscli2
    awsume
    ansible
    docker
    git
    jq
    ripgrep
    htop
    tree
    tmux
    fzf
    direnv
  ];

  env = {
    HOME = "/home/user/idx";
    AWS_CONFIGURE_SSO_DEFAULT_SSO_START_URL = "https://intelerad.awsapps.com/start";
    AWS_CONFIGURE_SSO_DEFAULT_SSO_REGION = "us-east-1";
    CONFIG_HOME = "$HOME/.config";
    AWS_SDK_LOAD_CONFIG = "1";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_STATE_HOME = "$HOME/.local/state";
    PATH = "$PATH:$HOME/Library/Python/3.11/bin:$HOME/.local/bin";
    EDITOR = "${pkgs.vim}/bin/vim";
    VISUAL = "${pkgs.vim}/bin/vim";
    PAGER = "${pkgs.less}/bin/less";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  idx = {
    extensions = [
      { id = "ms-python.python"; uuid = "f1f59ae4-9318-4f3c-a9b5-81b2eaa5f8a5"; version = "2024.14.1"; }
      { id = "hashicorp.terraform"; uuid = "d7e26c29-facd-4884-b1d7-bd06b57e2a5b"; version = "2.30.0"; }
      { id = "ms-azuretools.vscode-docker"; uuid = "0479fc1c-3d88-4636-b43c-258b2fb69211"; version = "1.29.0"; }
      { id = "ms-kubernetes-tools.vscode-kubernetes-tools"; uuid = "4837e4f3-1b01-4732-b1a6-daa57ef64cab"; version = "1.3.16"; }
      { id = "ms-python.debugpy"; uuid = "4bd5d2c9-9d65-401a-b0b2-7498d9f17615"; version = "2024.10.0"; }
      { id = "visualstudioexptteam.intellicode-api-usage-examples"; uuid = "9fa2a00e-3bfa-4c2a-abc4-a865bb2b5cf3"; version = "0.2.8"; }
      { id = "visualstudioexptteam.vscodeintellicode"; uuid = "876e8f93-74d0-4f4f-91b7-34a09f19f444"; version = "1.3.1"; }
      { id = "ms-vscode.remote-explorer"; uuid = "11858313-52cc-4e57-b3e4-d7b65281e34b"; version = "0.4.3"; }

    ];

    home.file.".bashrc".text = ''
      # Shell aliases
      alias ll='ls -alF'
      alias la='ls -A'
      alias l='ls -CF'
      alias update='sudo nixos-rebuild switch'
      alias myalias='echo "This is my custom alias"'
      alias py='python3'
      alias ipy='python3 -c "import IPython; IPython.terminal.ipapp.launch_new_instance()"'
      alias tf='terraform'
      alias dcu='docker-compose up -d'
      alias dcd='docker-compose down'
      alias k='kubectl'
    '';
  };
}
