FROM lopsided/archlinux:latest AS base

RUN sed -i '/^\[options\]/a DisableSandbox' /etc/pacman.conf && \
    pacman -Sy --noconfirm --needed tar sudo && \
    useradd -m -s /bin/bash robertpaulson && \
    echo "robertpaulson ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/robertpaulson

# yay
RUN 		sudo pacman -Sy --noconfirm --needed git base-devel && \
		sudo pacman -Rns --noconfirm rust 2>/dev/null || true && \
		git clone https://aur.archlinux.org/yay-bin.git && \
		cd yay-bin || exit 1 && \
		makepkg -si --noconfirm


USER robertpaulson
WORKDIR /home/robertpaulson
