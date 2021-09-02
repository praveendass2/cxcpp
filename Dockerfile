FROM debian:buster

MAINTAINER Praveendass

RUN  apt-get  update \
  && apt-get install -y \
     wget build-essential crossbuild-essential-armhf gcc-aarch64-linux-gnu g++-aarch64-linux-gnu file make git maven autoconf libtool ca-certificates zip unzip \
  && wget --no-check-certificate https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3-Linux-x86_64.sh -O /usr/cmake-3.17.3-Linux-x86_64.sh \
  && chmod +x /usr/cmake-3.17.3-Linux-x86_64.sh \
  && /usr/cmake-3.17.3-Linux-x86_64.sh --exclude-subdir && rm /usr/cmake-3.17.3-Linux-x86_64.sh && rm -rf /tmp/* \
  && ldconfig && rm -rf /var/lib/apt/lists/* && apt-get clean 
 
ENV PATH="/usr/cmake-3.17.3-Linux-x86_64/bin:${PATH}"

   
# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
