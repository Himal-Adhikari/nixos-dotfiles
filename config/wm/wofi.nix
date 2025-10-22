{pkgs, ...}:
{
  home.packages = [
    pkgs.wofi
  ];

  home.file.".config/wofi/config".text = ''
show=drun
width=720
allow_images=true
cache_file=/dev/null
hide_scroll=false
insensitive=true
no_actions=true
gtk_dark=true
hide_search=false
dynamic_lines=false
  '';

  home.file.".config/wofi/style.css".text = ''
window {
  background-color: #13191c;
  color: #00bef9;
  font-family: "JetBrains Mono";
  font-size: 14px;
  border-radius: 8px;
}

#outer-box {
  border: 2px solid #2c434f;
  border-radius: 8px;
}

#entry {
  border: 0;
  padding: 8px 16px;
  background-color: transparent;
  border-radius: 0;
  color: #bababa;
}

#entry:selected,
#entry:focus {
  background-color: #2c434f;
  color: #9feaff;
  outline: none;
}

#input {
  margin: 0;
  padding: 6px;
  background-color: #1b2327;
  color: #00bef9;
  border-radius: 0;
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
  border-bottom: 2px solid #2c434f;
}

#input:focus {
  outline: none;
}

#img {
  padding: 0 10px;
}
  '';
}
