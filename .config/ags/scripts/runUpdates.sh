#!/bin/bash

# Provided by: https://github.com/JJDizz1L

install_arch_updates() {
    echo "正在升级Arch Linux..."
    sudo pacman -Syu
    echo "正在升级AUR包..."
    if command -v paru &>/dev/null; then
        paru -Syu
    elif command -v yay &>/dev/null; then
        yay -Syu
    else
        echo "未发现AUR Helper. 请尝试安装yay或者paru"
    fi
    if command -v flatpak &>/dev/null; then
        echo "正在升级Flatpak包..."
        flatpak update -y
    fi
    echo "Arch & AUR升级成功."
}

install_ubuntu_updates() {
    echo "正在升级Ubuntu..."
    sudo apt update && sudo apt upgrade -y
    echo "正在升级Flatpak包..."
    flatpak update -y
    echo "Ubuntu升级成功."
}

install_fedora_updates() {
    echo "正在升级Fedora..."
    sudo dnf update -y
    echo "正在升级Flatpak包..."
    flatpak update -y
    echo "Fedora升级成功."
}

install_flatpak_updates() {
    echo "正在升级Flatpak包..."
    flatpak update -y
    echo "FlatPak升级成功."

}

case "$1" in
-arch)
    install_arch_updates
    ;;
-ubuntu)
    install_ubuntu_updates
    ;;
-fedora)
    install_fedora_updates
    ;;
-flatpak)
    install_flatpak_updates
    ;;
*)
    echo "使用方法: $0 {-arch|-ubuntu|-fedora|-flatpak}"
    ;;
esac

echo "输入任意键退出..."
read -n 1
