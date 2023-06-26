{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
  };
  
  system = {
    copySystemConfiguration = true;
    stateVersion = "23.05";
  };
  
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "Asia/Tokyo";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
        libsForQt5.fcitx5-qt
      ];
    };
  };

  console = {
    keyMap = "us";
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  security = {
    polkit.enable = true;
  };

  sound.enable = true;
  
  hardware = {
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
    opengl.enable = true;
  };

  xdg.portal.wlr.enable = true;
  
  services = {
    xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
        theme = "${(pkgs.fetchFromGitHub {
          owner = "MarianArlt";
          repo = "sddm-sugar-dark";
          rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
          sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
        })}";
      };
    };
    pipewire.enable = true;
  };
  
  programs = {
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
        hidpi = true;
      };
      nvidiaPatches = true;
    };
  };
  
  users = with pkgs; {
    mutableUsers = true;
    users = {
      root = {
        isSystemUser = true;
        password = "root";
        extraGroups = [ "root" ];
      };
      netetra = {
        isNormalUser = true;
        shell = powershell;
        password = "qwerty";
        extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
        packages = [
        ];
      };
    };
  };
  
  fonts.fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      fira-code
      font-awesome
  ];

  environment = {
    systemPackages = with pkgs; [
      # Libraries
      libsForQt5.qt5.qtgraphicaleffects
      # Editor
      helix
      # LSP
      nil
      rust-analyzer
      # Tool
      wget
      nmap
      exa
      mtr
      bottom
      git
      home-manager
      # Hyprland components
      wofi
      waybar
      hyprpaper
      eww-wayland
      wl-clipboard
      pavucontrol
      # GUI App
      google-chrome
      alacritty
      discord
      blender
      vlc
    ];
    variables = {
      EDITOR = "hx";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "hyprland";
      XDG_CURRENT_SESSION = "hyprland";
      XCURSOR_SIZE = "12";
      LIBSEAT_BACKEND = "logind";
      QT_QPA_PLATFORM = "wayland";
      QT_SCAKLE_FACTOR = "1";
      GDK_DPI_SCALE = "1";
      MOZ_ENABLE_WAYLAND = "1";
      WINIT_UNIX_BACKEND = "x11";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
  };
}

