FROM ubuntu:19.10

LABEL maintainer = "Tomek Polanski <polanski.tomek@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    build-essential \
    ca-certificates \
    clang \
    curl \
    cmake \
    expect \
    gcc \
    git-core \
    lcov \
    lib32gcc1  \
    lib32stdc++6 \
    lib32z1 \
    libc6-i386  \
    libgles2-mesa-dev \
    libglu1 \
    libglu1-mesa \
    libgtk-3.0 \
    libgtk-3-dev \
    libstdc++6 \
    libsqlite3-dev \
    locales \
    maven  \
    ninja-build \
    qemu-kvm \
    pkg-config \
    rsync \
    screen  \
    scrot \
    software-properties-common \
    supervisor \
    tmux  \
    unzip \
    wget  \
    x11-xserver-utils \
    xvfb \
    zip \
    && rm -rf /var/lib/apt/lists/*

RUN sh -c 'echo "en_US.UTF-8 UTF-8" > /etc/locale.gen' && \
    locale-gen && \
    update-locale LANG=en_US.UTF-8

RUN useradd -m -s /bin/bash user
USER user

WORKDIR /home/user
RUN cmake --version

ARG flutter_version

ENV FLUTTER_HOME /home/user/flutter
ENV FLUTTER_ROOT $FLUTTER_HOME
ENV FLUTTER_VERSION $flutter_version

RUN git clone -b beta https://github.com/flutter/flutter.git ${FLUTTER_HOME}
ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin
RUN flutter version ${FLUTTER_VERSION}
RUN flutter config --enable-linux-desktop
RUN flutter precache --linux

ENV PRESENTATIONS_HOME /home/user/flutter-presentations
RUN git clone https://github.com/tomaszpolanski/flutter-presentations.git ${PRESENTATIONS_HOME}
RUN cd ${PRESENTATIONS_HOME} && \
    flutter packages get

RUN cd ${PRESENTATIONS_HOME} && flutter build linux
RUN pub global activate fast_flutter_driver_tool
ENV PATH /home/user/.pub-cache/bin:$PATH
ENV DISPLAY :0
CMD ["Xvfb", ":0", "-screen", "0", "1920x1920x24"]


#./build_docker.sh 3.10.0 ./
#docker run -d tomek/flutter:latest
#docker exec -d 798f91f95392573bb183b7813cb2c73a92a70647327aea187eeaf530befa1f30 sh -c "Xvfb :0 -screen 0 1920x1920x24"
#docker exec 798f91f95392573bb183b7813cb2c73a92a70647327aea187eeaf530befa1f30 sh -c "cd /home/user/flutter-presentations/ && fastdriver --dart-args "--no-sound-null-safety" --flutter-args "--no-sound-null-safety""
