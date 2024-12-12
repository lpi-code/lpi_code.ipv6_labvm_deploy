FROM mcr.microsoft.com/devcontainers/base:bullseye

COPY plugins/modules_utils/certs/*.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates && \
    apt update && apt install vagrant -y

RUN vagrant plugin install vagrant-libvirt