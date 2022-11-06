#!/bin/sh

# Install paru
sudo pacman -S rustup pkg-config
rustup update stable
rustup default stable
git clone https://aur.archlinux.org/paru.git /tmp/paru
(cd /tmp/paru && makepkg -si)

# Install packages
paru -S --needed - < ./pkglist.txt

# Configure vscode 
cat ./vscode/extensions.txt | grep "^[^#]" | xargs -I {} code --install-extension {} --force
cp -f ./vscode/settings.json ~/.config/Code\ -\ OSS/User

# Install .config folder
yes | cp -rf ./.config ~/

# Configure ssh
ssh-keygen -t rsa -b 4096 -C "kudinov.nikita@gmail.com"

# Configure git
git config --global user.name "relby"
git config --global user.email "kudinov.nikita@gmail.com"
git config --global init.defaultBranch "main"
gh auth login

# Disable firefox gnome theme
# gnome-layout-switcher

# Configure tailscale
sudo systemctl enable tailscaled
sudo systemctl start tailscaled
sudo tailscale up

# Configure gnome
# https://extensions.gnome.org/extension/1486/extensions-sync

# Install wallpapers
MAIN_WALLPAPER="2022-10-03-23-59-32-dj-light.png"
BACKGROUNDS_LOCATION="$HOME/.local/share/backgrounds"
cp ./wallpapers/* $BACKGROUNDS_LOCATION
gsettings set org.gnome.desktop.background picture-uri "file:///$BACKGROUNDS_LOCATION/$MAIN_WALLPAPER" # Doesn't work for some reason

# Configure pacman and paru
sudo cp ./terminal/pacman.conf /etc
sudo cp ./terminal/paru.conf   /etc

# TODOS:
# install browser extensions
# install configs in them
# copy gnome settings, keybindings, and extensions
# pacman and paru settings
# configure tailscale
