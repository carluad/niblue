#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

dnf install -y gnome-shell gdm gnome-software epiphany nautilus thermald 
dnf install -y fastfetch distrobox podman-compose podman-docker
dnf remove -y gnome-software-rpm-ostree PackageKit

# Turtle for nautilus
# dnf install -y python3-pygit2 python3-secretstorage nautilus-python meld
# git clone https://gitlab.gnome.org/philippun1/turtle.git /tmp/turtle
# python /tmp/turtle/install.py install

# dnf install -y fastfetch gnome-themes-extra podman-compose podman-docker distrobox
#dnf remove -y firefox firefox-langpacks gnome-software-rpm-ostree toolbx

#sed -i '/^PRETTY_NAME/s/Silverblue/Niblue/' /usr/lib/os-release

