FROM fedora:latest

RUN dnf install -y ansible git && dnf clean all
RUN ansible-pull -U https://github.com/AaronHaNasi/dotfile-provision.git
