FROM rockylinux/rockylinux:9.1
RUN useradd -ms /bin/bash yuto
RUN dnf update -y && \
    dnf -y install git && \
    dnf -y install sudo && \
    usermod -aG wheel yuto
WORKDIR /home/yuto
USER yuto