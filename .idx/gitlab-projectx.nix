let
  base = import ./base-config.nix { };
in
base.projectConfig "project-b" {
  packages = with pkgs; [
    go
    terraform
  ];
  extensions = [
    { id = "golang.go"; uuid = "d6f6cfea-4b6f-41f4-b571-6ad2ab7918da"; version = "0.42.1"; }
    { id = "hashicorp.terraform"; uuid = "d7e26c29-facd-4884-b1d7-bd06b57e2a5b"; version = "2.30.0"; }
  ];
  shellAliases = {
    build = "go build";
    tf = "terraform";
  };
  setup = ''
    echo "Setting up gitlab project"
    go mod tidy
    terraform init
  '';
}
