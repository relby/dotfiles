#!/bin/sh

# Install paru
sudo pacman -S rustup pkg-config
rustup update stable
rustup default stable
git clone https://aur.archlinux.org/paru.git /tmp/paru
(cd /tmp/paru && makepkg -si)

# Install packages
sudo paru -S --needed - < ./pkglist.txt

# Configure vscode 
cat ./vscode/extensions.txt | grep ^[^#] | xargs -I {} code --install-extension {} --force
cp -f ./vscode/settings.json "~/.config/Code - OSS/User"

# Install .config folder
cp -rf ./.config ~/

# Configure ssh
ssh-keygen -t rsa -b 4096 -C "kudinov.nikita@gmail.com"

# Configure git
git config --global user.name "relby"
git config --global user.email "kudinov.nikita@gmail.com"
gh auth login

