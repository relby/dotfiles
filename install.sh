#!/bin/sh

# Install paru
sudo pacman -S --noconfirm rustup pkg-config
rustup update stable
rustup default stable
OUTPUT_FILE="/tmp/paru"
git clone https://aur.archlinux.org/paru.git $OUTPUT_FILE
(cd $OUTPUT_FILE && makepkg -si --noconfirm)

# Install packages
paru -S --needed --noconfirm - < ./pkglist.txt

# Configure pacman and paru
sudo cp ./terminal/pacman.conf /etc
sudo cp ./terminal/paru.conf   /etc

# Install .config folder
yes | cp -rf ./.config ~/

# Configure nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim +PackerInstall +qall

# Configure ssh
ssh-keygen -t rsa -b 4096 -C "kudinov.nikita@gmail.com" -N "" -f $HOME/.ssh/id_rsa

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
EXTENSION="extensions-sync@elhan.io"
VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$EXTENSION" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
wget -O $EXTENSION.zip "https://extensions.gnome.org/download-extension/$EXTENSION.shell-extension.zip?version_tag=$VERSION_TAG"
gnome-extensions install --force $EXTENSION.zip
if ! gnome-extensions list | grep --quiet $EXTENSION; then
    busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s $EXTENSION
fi
gnome-extensions enable $EXTENSION
rm $EXTENSION.zip

sudo cp "~/.local/share/gnome-shell/extensions/$EXTENSION/schemas/org.gnome.shell.extensions.extensions-sync.gschema.xml" "/usr/share/glib-2.0/schemas/"
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

gsettings set org.gnome.shell.extensions.extensions-sync github-gist-id "fd4fa21156e44f52a4e56b178c0dfbc6"
gsettings set org.gnome.shell.extensions.extensions-sync github-user-token $(gh auth token)
busctl --user call org.gnome.Shell /io/elhan/ExtensionsSync io.elhan.ExtensionsSync read
