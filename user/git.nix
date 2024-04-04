{ config, pkgs, inputs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "james.a.r.baker@gmail.com";
    userName = "Jay Baker";
  };
}
