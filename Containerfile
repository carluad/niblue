ARG FEDORA_MAJOR_VERSION=latest

FROM quay.io/fedora/fedora-bootc:${FEDORA_MAJOR_VERSION}

# COPY system_files /
# COPY system-files/lib/systemd/system /lib/systemd/system
COPY build-scripts/setup-packages.sh /tmp/setup-packages.sh
COPY build-scripts/install-systexts-manager.sh /tmp/install-sysexts-manager.sh

RUN rmdir /opt
RUN ln -sT /var/opt /opt
RUN mkdir -p /var/lib/alternatives

RUN /tmp/setup-packages.sh
RUN /tmp/install-sysexts-manager.sh
RUN systemctl enable thermald gdm systemd-sysext.service

RUN rm -rf /tmp/* /var/*
RUN mkdir -p /tmp /var/tmp
RUN chmod -R 1777 /tmp /var/tmp

