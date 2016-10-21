#!/bin/bash

sudo pacman -S git

mkdir	Downloads
cd	Downloads

git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

yaourt -S libxcb xcb-util xcb-util-keysyms xcb-util-wm

yaourt -S gcc make python3

cd bspwm
make
sudo make install
cd ..

cd sxhkd
make
sudo make install
cd ..

mkdir -p ~/.config
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd

cp ./bspwm/examples/bspwmrc ~/.config/bspwm/
chmod +x ~/.config/bspwm/bspwmrc
cp ./bspwm/examples/sxhkdrc ~/.config/sxhkd/

echo -e "sxhkd &\nexec bspwm" > ~/.xinitrc

git clone https://github.com/baskerville/xdo.git
git clone https://github.com/baskerville/sutils.git
git clone https://github.com/baskerville/xtitle.git
git clone https://github.com/LemonBoy/bar.git

cd xdo
make && sudo make install
cd ..

cd sutils
make && sudo make install
cd ..

cd xtitle
make && sudo make install
cd ..

cd bar
make && sudo make install
cd ..

mkdir -p ~/.config/panel
sudo echo -e -n "export PANEL_FIFO=\"/tmp/panel-fifo/\"" >> /etc/profile
sudo echo -e -n "export PATH=$PATH:~/.config/panel/" >> /etc/profile

cp ./bspwm/examples/panel/panel ~/.config/panel
cp ./bspwm/examples/panel/panel_bar ~/.config/panel
cp ./bspwm/examples/panel/panel_colors ~/.config/panel

chmod +x ~/.config/panel/*
