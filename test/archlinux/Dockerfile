FROM lopsided/archlinux:latest AS base

RUN sed -i '/^\[options\]/a DisableSandbox' /etc/pacman.conf && \
    pacman -Syu --noconfirm --needed tar sudo && \
    useradd -m -s /bin/bash robertpaulson && \
    echo "robertpaulson ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/robertpaulson

USER robertpaulson
WORKDIR /home/robertpaulson
