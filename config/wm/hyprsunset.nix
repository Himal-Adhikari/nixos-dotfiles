{ ... }:
{
  services.hyprsunset = {
    enable = true;
    settings = {
      max-gamma = 150;

      profile = [
        {
          time = "4:00";
          identity = true;
        }
        {
          time = "20:00";
          temperature = 4500;
          gamma = 0.7;
        }
      ];
    };
  };
}
