FROM ubuntu:16.04

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
    lib32ncurses5 \
    lib32stdc++6 \
    lib32z1 \
    libc6-i386  \
    libgles2-mesa-dev \
    libglu1 \
    libglu1-mesa \
    libgtk-3.0 \
    libstdc++6 \
    libsqlite3-dev \
    locales \
    maven  \
    ninja-build \
    qemu-kvm \
    rsync \
    screen  \
    scrot \
    software-properties-common \
    supervisor \
    tmux  \
    unzip \
    wget  \
    xvfb \
    zip \
    && rm -rf /var/lib/apt/lists/*

RUN sh -c 'echo "en_US.UTF-8 UTF-8" > /etc/locale.gen' && \
    locale-gen && \
    update-locale LANG=en_US.UTF-8

RUN useradd -m -s /bin/bash user
USER user

WORKDIR /home/user

ARG flutter_version

ENV FLUTTER_HOME /home/user/flutter
ENV FLUTTER_ROOT $FLUTTER_HOME
ENV FLUTTER_VERSION $flutter_version

RUN git clone https://github.com/flutter/flutter.git ${FLUTTER_HOME}
ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin
RUN flutter version ${FLUTTER_VERSION}
RUN flutter config --enable-linux-desktop
RUN flutter precache --linux

ENV PRESENTATIONS_HOME /home/user/flutter-presentations
RUN git clone https://github.com/tomaszpolanski/flutter-presentations.git ${PRESENTATIONS_HOME}
RUN cd ${PRESENTATIONS_HOME} && \
    flutter packages get

ENV DISPLAY :0

CMD ["Xvfb", ":0", "-screen", "0", "1824x1824x16"]
#./build_docker.sh 1.19.0-4.1.pre ./
#docker run -d tomek/flutter:latest
#docker exec ed3d0497b34f13b85354d25ce903b302c0f0dea01ac9497ea56e67655440dc08 sh -c "cd /home/user/flutter-presentations/ && ./run_tests.sh"
