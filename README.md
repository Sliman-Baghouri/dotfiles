# Starshower .Files | Arch | Hyprland | Neovim | Kitty

Hey there! 👋 This is a collection of my personal dotfiles. here is where I fine-tune and tweak my Unix-like environment to suit my whims and fancies.

![Example Image](https://raw.githubusercontent.com/Sliman-Baghouri/dotfiles/main/.config/HyprV/backgrounds/currentBG/v2-background-dark%20(copy%202).jpg)

## Contents

Inside this digital treasure chest, you'll find a mishmash of configurations, a symphony of code that makes my command line sing and dance:

- **.dotfiles/**: Where the party starts. Dive in and explore the settings for all sorts of applications and tools.
- **.bashrc**: My trusty sidekick, guiding me through the maze of the Bash shell with its clever little tricks.
- **.nvim**: The maestro orchestrating the Vim text editor, ensuring every keystroke feels like a stroke of genius.

## Usage

If you're feeling adventurous:

1. **Clone the Repository** Fire up your terminal and let's get this show on the road:

   ```bash
   git clone https://github.com/Sliman-Baghouri/dotfiles.git ~/.dotfiles
   
2. **Create symbolic links using stow** remove/rename any file in home that conflicts with dotfiles, cd into .dotfiles directory and run:
   ```bash
   stow .

3. install needed packages via paru, yay or pacman if avialable
   
   ```bash
   paru -S waybar wofi mako xdg-desktop-portal-hyprland-git polkit-gnome pamixer pavucontrol brightnessctl bluez bluez-utils blueman network-manager-applet btop pacman-contrib ttf-jetbrains-mono-nerd noto-fonts-emoji lxappearance xfce4-settings fd ripgrep wl-clipboard hyprpaper pyprland
   
(for wallpaper dont forget to add Pictures/1.png) check ~/.config/hypr/hyprpaper.conf

That's all, folks. Thanks for stopping by.


