{ pkgs ? import <nixpkgs> {} }:

{
  channel = "nixos-24.11";

  customPython = pkgs.python311.withPackages (ps: with ps; [
    requests
    pandas
    numpy
    matplotlib
  ]);
 
  packages = with pkgs; [
    customPython
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
      { id = "ms-vscode-remote.remote-ssh-edit"; uuid = "bfeaf631-bcff-4908-93ed-fda4ef9a0c5c"; version = "0.86.0"; }
      { id = "redhat.vscode-yaml"; uuid = "2061917f-f76a-458a-8da9-f162de22b97e"; version = "1.15.0"; }
      { id = "donjayamanne.githistory"; uuid = "5960f38e-0bbe-4644-8f9c-9c8824e82511"; version = "0.6.20"; }
      { id = "oderwat.indent-rainbow"; uuid = "eaa2127d-cb69-4ab9-8505-a60c9ee5f28b"; version = "8.3.1"; }
      { id = "4a454646.github-purple"; uuid = "dc8a300e-fc9f-46a8-ac4f-4fec1ad4406c"; version = "0.0.15"; }
      { id = "adam-bender.commit-message-editor"; uuid = "b9883563-e6ba-4f6c-b03c-193c80e79c75"; version = "0.25.0"; }
      { id = "vinirossa.vscode-gitandgithub-pack"; uuid = "dc1a111a-a14f-43c0-b144-1bdfbdeb9a7c"; version = "2.0.1"; }
      { id = "sleistner.vscode-fileutils"; uuid = "d637104e-1fd7-4063-98fc-8afe46012c9b"; version = "3.10.3"; }
      { id = "thang-nm.catppuccin-perfect-icons"; uuid = "d29b49ee-781a-4913-8eba-21fd00d77969"; version = "0.21.32"; }
      { id = "mguellsegarra.highlight-on-copy"; uuid = "f603001a-0035-4fd5-97dc-351591e2a9a9"; version = "1.1.4"; }
      { id = "naumovs.color-highlight"; uuid = "121396ad-85a1-45ec-9fd1-d95028a847f5"; version = "2.8.0"; }
      { id = "mikestead.dotenv"; uuid = "532533c9-a894-4a58-9eee-bbfbe7c06f71"; version = "1.0.1"; }
      { id = "wayou.vscode-todo-highlight"; uuid = "97a08c5f-6667-4242-a5c5-045dfb6bd4b9"; version = "1.0.5"; }
      { id = "usernamehw.errorlens"; uuid = "9d8c32ab-354c-4daf-a9bf-20b633734435"; version = "3.20.0"; }
      { id = "kennylong.kubernetes-yaml-formatter"; uuid = "ff7ddaea-da15-4049-972f-4408841beffa"; version = "1.1.0"; }
      { id = "ms-vscode.cpptools-themes"; uuid = "99b17261-8f6e-45f0-9ad5-a69c6f509a4f"; version = "2.0.0"; }
      { id = "redhat.vscode-redhat-account"; uuid = "c65f53b6-ea7d-4e62-acf9-11f1ae3edeec"; version = "0.2.0"; }
      { id = "abhatt-rh.snippets-for-asciidoc"; uuid = "f78d7b6c-7039-4104-81a0-f3ec0cc78d5b"; version = "0.0.5"; }
      { id = "asciidoctor.asciidoctor-vscode"; uuid = "c1309cc2-f420-46a3-b2be-ca04f4d9e51b"; version = "3.3.1"; }
      { id = "redhat.vscode-commons"; uuid = "2f0eaac2-070b-4dc7-9b23-8dd4c970c11c"; version = "0.0.6"; }
      { id = "gruntfuggly.todo-tree"; uuid = "261cac81-cd7b-4555-bb41-0c2d2bcd3e70"; version = "0.0.226"; }
      { id = "4ops.terraform"; uuid = "b861aa84-146f-440f-b6be-76124b02b729"; version = "0.2.5"; }
      { id = "pjmiravalle.terraform-advanced-syntax-highlighting"; uuid = "72964da7-16bd-4af1-93a4-511b2f582934"; version = "0.1.0"; }
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
