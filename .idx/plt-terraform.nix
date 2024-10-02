let
  base = import ./base-config.nix { };
in
base.projectConfig "plt-terraform {
  packages = with pkgs; [
    python311
    nodejs_20
    terraform
  ];
  extensions = [
    { id = "ms-python.python"; uuid = "f1f59ae4-9318-4f3c-a9b5-81b2eaa5f8a5"; version = "2024.14.1"; }
  ];
  shellAliases = {
    start-app = "python app.py";
  };
  setup = ''
    echo "Setting up Project terraform"
    npm install
    python -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
  '';
}
