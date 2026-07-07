{ ... }:
{
  programs.freetube = {
    enable = true;
    settings = {
      allowDashAv1Formats = true;
      checkForUpdates = false;
      defaultQuality = "1080";
      baseTheme = "catppuccinMocha";
      hideTrendingVideos = true;
      useSponsorBlock = true;
      sponsorBlockSelfPromo = {
        color = "Yellow";
        skip = "autoSkip";
      };
      # {"_id":"sponsorBlockSelfPromo","value":{"color":"Yellow","skip":"autoSkip"}}
    };
  };
}
