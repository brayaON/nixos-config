{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.bof = {
    isNormalUser = true;
    home = "/home/bof";
    extraGroups = [ "docker" "lxd" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$BAEyZcdLGIlWw6BH$GOK0x1NBLxtuWRKU0CorhUV5D5pybTDSV1N4dKJ89hCSTd2TGTuKFFV.tnAIXWt7z.tiAJxrqEIn8OfP.YDhq1";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7lA++p4tOfpygs62cg5WZDrQzzSI0m+ZeHKP9FbfNQ bof@macbookbof.local"
    ];
  };
}
