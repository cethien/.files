{ config, lib, ... }:

{
  config = lib.mkIf config.deeznuts.desktop.hyprland.enable {
    programs.waybar.settings.mainBar = {
      layer = "top";
      position = "top";
      spacing = 0;
      height = 34;
      modules-left = [
        "custom/logo"
        "hyprland/workspaces"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "tray"
        "memory"
        "network"
        "wireplumber"
        "battery"
        "custom/power"
      ];
      "wlr/taskbar" = {
        format = "{icon}";
        on-click = "activate";
        on-click-right = "fullscreen";
        icon-theme = "WhiteSur";
        icon-size = 25;
        tooltip-format = "{title}";
      };
      "hyprland/workspaces" = {
        on-click = "activate";
        format = "{icon}";
        format-icons = {
          default = "";
          active = "󱓻";
          urgent = "󱓻";
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
        };
        persistent_workspaces = {
          "1" = [ ];
          "2" = [ ];
          "3" = [ ];
          "4" = [ ];
          "5" = [ ];
        };
      };
      memory = {
        interval = 5;
        format = "󰍛 {}%";
        max-length = 10;
      };
      tray = {
        spacing = 10;
      };
      clock = {
        tooltip-format = "{calendar}";
        format-alt = "  {=%a %d %b %Y}";
        format = "  {=%I=%M %p}";
      };
      network = {
        format-wifi = "{icon}";
        format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        format-ethernet = "󰀂";
        format-alt = "󱛇";
        format-disconnected = "󰖪";
        tooltip-format-wifi = "{icon} {essid}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
        tooltip-format-ethernet = "󰀂  {ifname}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
        tooltip-format-disconnected = "Disconnected";
        on-click = "~/.config/rofi/wifi/wifi.sh &";
        on-click-right = "~/.config/rofi/wifi/wifinew.sh &";
        interval = 5;
        nospacing = 1;
      };
      wireplumber = {
        format = "{icon}";
        format-bluetooth = "󰂰";
        nospacing = 1;
        tooltip-format = "Volume = {volume}%";
        format-muted = "󰝟";
        format-icons = {
          headphone = "";
          default = [ "󰖀" "󰕾" "" ];
        };
        on-click = "pamixer -t";
        scroll-step = 1;
      };
      "custom/logo" = {
        format = "  ";
        tooltip = false;
        on-click = "~/.config/rofi/launchers/misc/launcher.sh &";
      };
      battery = {
        format = "{capacity}% {icon}";
        format-icons = {
          charging = [
            "󰢜"
            "󰂆"
            "󰂇"
            "󰂈"
            "󰢝"
            "󰂉"
            "󰢞"
            "󰂊"
            "󰂋"
            "󰂅"
          ];
          default = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
        format-full = "Charged ";
        interval = 5;
        states = {
          warning = 20;
          critical = 10;
        };
        tooltip = false;
      };
      "custom/power" = {
        format = "󰤆";
        tooltip = false;
        on-click = "~/.config/rofi/powermenu/type-2/powermenu.sh &";
      };
    };
  };
}
