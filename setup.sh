#!/bin/bash

#ARCH + WAYBAR + WBG + FCITX5 + HYPRLAND + PIPEWIRE + PYWAL

#MAKE SURE YOU ARE CONNECTED WITH WIFI and BE SURE TO BE SET SUDO WELL.
set -e

HYPR_DIR=/home/powwow/.config/hypr
DOTFILE=https://github.com/elifouts/Dotfiles
DOTFILE_DIR=~/.config/
YAY_DIR=~/yay
WP_SOURCE=~/arch-setup/*.png

echo "Starting to install things"
sudo pacman -S  --needed ttf-jetbrains-mono-nerd waybar fcitx5 fcitx5-hangul fcitx5-configtool wayland hyprland pipewire wireplumber python-pywal noto-fonts-cjk noto-fonts git python-pywal network-manager-applet base-devel alacritty nnn wofi pipewire-alsa pipewire-pulse

echo "hyprland setting..."
mkdir -pv $HYPR_DIR

cd $HYPR_DIR

git clone https://github.com/powwow787/dotfiles | true #since i created a file that makes error, but i dont wanna change it 'cause i dont wanna it.

rm -rf *.nix

echo "hyprland set."

echo "waybar setting..."
git clone $DOTFILE $DOTFILE_DIR
cd $DOTFILE_DIR
mv .config/waybar ~/.config/waybar

echo "waybar set."

echo "i18n setting.."

echo "
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
" | sudo tee -a /etc/environment

echo "i18n set right."

echo "First, we install wbg, we have to install yay for first."

git clone https://aur.archlinux.org/yay-bin $YAY_DIR
cd $YAY_DIR
makepkg -si
cd ~/
rm -rf $YAY_DIR
echo "yay installed."

echo "installing wbg"

yay -S wbg 

echo "installed wbg"

echo "setting pipewire"

systemctl --user enable pipewire

echo "pipewire set"

echo "setting another things"

#sudo systemctl enable ly
cd ~/

mkdir .wallpaper
mv $WP_SOURCE ~/.wallpaper
#curl -O https://url.kr/pxn2xc 
#mv *.png wallpaper.png

wal -i ~/.wallpaper/*.png

clear

echo "ALL THINGS SET. PLEASE RESTART YOUR COMPUTER!!!!"







