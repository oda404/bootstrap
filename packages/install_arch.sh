#!/bin/bash

install_pacman()
{
    packages=( \
        grub efibootmgr \
        \
        adobe-source-han-sans-kr-fonts \
        otf-ipafont \
        ttf-cascadia-code \
        ttf-hack \
        ttf-ubuntu-mono-nerd \
        \
        xorg xorg-xinit \
        \
        opendoas neovim alacritty \
        android-tools bc automake autoconf bison \
        bluez bluez-utils bottom cpio dhcpcd discord \
        fish inetutils neofetch nmap openvpn p7zip picom scrot \
        unrar unzip usbutils zip mesa \
        pipewire pipewire-audio pipewire-alsa pipewire-pulse \
        \
        clang lld cmake docker docker-compose man-pages \
        qemu-system-x86 qemu-ui-gtk nodejs yarn \
    )
    
    if [ "$is_laptop" == "y" ]; then
        laptop_packages=(acpilight iwd)
    fi
    
    if [ "$cpu_brand" == "amd" ]; then
        cpu_packages=(amd-ucode)
    elif [ "$cpu_brand" == "intel" ]; then
        cpu_packages=(intel-ucode)
    fi

    if [ "$gpu_radeon" == "y" ]; then
        gpu_packages=(xf86-video-amdgpu)
    fi

    doas pacman -Sy ${packages[@]} ${laptop_packages[@]} ${cpu_packages[@]} ${gpu_packages[@]}

    # im just going to assume systemd
    doas systemd enable bluetooth dhcpcd
    if [ "$is_laptop" == "y" ]; then
        doas systemd enable iwd
    fi
}

install_aur()
{
    packages=( \
        miniconda3 otf-bebas-neue-git \
        visual-studio-code-bin 
    )
}

while [ "$is_laptop" != "n" ] && [ "$is_laptop" != "y" ]
do
    read -p "Laptop install (y/n): " is_laptop
done

while [ "$cpu_brand" != "amd" ] && [ "$cpu_brand" != "intel" ]
do
    read -p "CPU (amd/intel): " cpu_brand
done

while [ "$gpu_radeon" != "y" ] && [ "$gpu_radeon" != "n" ]
do
    read -p "Radeon gpu of any kind, integrated or dedicated (y/n): " gpu_radeon
done

install_pacman

