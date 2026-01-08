ARG FEDORA_MAJOR_VERSION=latest

FROM quay.io/fedora/fedora-bootc:${FEDORA_MAJOR_VERSION}

# COPY system_files /
COPY systemd/system /lib/systemd/system
COPY build.sh /tmp/build.sh 

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    rm -rf /tmp/* /var/* && \
    mkdir -p /tmp /var/tmp && \
    chmod -R 1777 /tmp /var/tmp

