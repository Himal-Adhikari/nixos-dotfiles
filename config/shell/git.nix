{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Himal Adhikari";
        email = "himalad321@gmail.com";
      };
      init.defaultBranch = "master";
    };
  };
}
