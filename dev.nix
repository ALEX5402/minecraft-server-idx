{ pkgs, ... }: {
  channel = "stable-24.05"; # or "unstable"
  packages = [
    pkgs.jdk21
    pkgs.unzip
    pkgs.screen
  ];
  env = {};
  idx = {
    workspace = {
      onCreate = { };
      onStart = { 
         startMC = ''
         set -eu
         ./start.sh
         '';
      };
    #dahd
    };
    # Enable previews and customize configuration
    };
}
