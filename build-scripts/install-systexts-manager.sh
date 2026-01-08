#!/bin/sh

VERSION="0.3.1" # sysexts-manager version
VERSION_ID="43" # Fedora release
ARCH="x86-64"   # or arm64
URL="https://github.com/travier/sysexts-manager/releases/download/sysexts-manager/"
NAME="sysexts-manager-${VERSION}-${VERSION_ID}-${ARCH}.raw"
sudo install -d -m 0755 -o 0 -g 0 "/var/lib/extensions"{,.d} "/run/extensions"
curl --silent --fail --location "${URL}/${NAME}" \
    | sudo bash -c "cat > /var/lib/extensions.d/${NAME}"
ln -snf "/var/lib/extensions.d/${NAME}" "/var/lib/extensions/sysexts-manager.raw"
sudo restorecon -RFv "/var/lib/extensions"{,.d} "/run/extensions"
# sudo systemctl enable systemd-sysext.service
# sudo systemctl restart systemd-sysext.service
