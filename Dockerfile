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

COPY compile.sh /usr/share/compile.sh
COPY package.sh /usr/share/package.sh
COPY read.sh /usr/share/read.sh

# Add user jenkins to the image
RUN adduser --quiet jenkins
RUN echo "jenkins:jenkins" | chpasswd
    
# Jenkins
RUN mkdir /home/jenkins/workspace
RUN chown jenkins.jenkins /home/jenkins/workspace

RUN mkdir /tmp/fdk/
    
# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]