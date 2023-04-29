FROM rockylinux/rockylinux:9.1
RUN useradd -ms /bin/bash yuto
RUN dnf update -y && \
    dnf -y install git
RUN usermod -aG wheel yuto
USER yuto
WORKDIR /home/yuto
CMD ["/bin/bash"]