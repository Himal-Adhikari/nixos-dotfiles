{ ... }:
{
  services.hyprsunset = {
    enable = true;
    settings = {
      max-gamma = 150;

      profile = [
        {
          time = "7:30";
          identity = true;
        }
        {
          time = "21:45";
          temperature = 4500;
          gamma = 0.7;
        }
      ];
    };
  };
}
