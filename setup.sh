#!/bin/sh

#ARCH + WAYBAR + WBG + FCITX5 + HYPRLAND + PIPEWIRE + PYWAL

#MAKE SURE YOU ARE CONNECTED WITH WIFI and BE SURE TO BE SET SUDO WELL.
set -e

echo "Starting to install things"
sudo pacman -S  --needed ttf-jetbrains-mono-nerd waybar fcitx5 fcitx5-hangul fcitx5-configtool wayland hyprland pipewire wireplumber pywal alsa-utils noto-fonts-cjk noto-fonts git python-pywal ly network-manager-applet base-devel alacritty dolphin wofi pipewire-alsa pipewire-pulse

echo "hyprland setting..."
mkdir -pv ~/.config/hypr

cd ~/.config/hypr

git clone https://github.com/powwow787/dotfiles

rm -rf *.nix

echo "hyprland set."

echo "waybar setting..."
git clone https://github.com/elifouts/Dotfiles ~/.config/waybar
cd ~/.config/waybar
rm -rf .bashrc LICENSE readme.md wallpapers images InstallScripts
cd .config
mv waybar ..
cd ..
rm -rf .config

echo "waybar set."

echo "i18n setting.."

echo "
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
" | sudo tee -a /etc/environment

echo "i18n set right."

echo "First, we install wbg, we have to install yay for first."

git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si

echo "yay installed."

echo "installing wbg"

yay -S wbg 

echo "installed wbg"

echo "setting pipewire"

systemctl --user enable pipewire

echo "pipewire set"

echo "setting another things"

sudo systemctl enable ly
cd ~/

mkdir .wallpaper
cd .wallpaper
#curl -O https://url.kr/pxn2xc 
#mv *.png wallpaper.png

wal -i ./*.png

clear

echo "ALL THINGS SET. PLEASE RESTART YOUR COMPUTER!!!!"







