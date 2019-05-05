FROM ubuntu:16.04

LABEL maintainer = "Pawel Polanski <pawel@upday.com>"

ARG flutter_version

WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    lib32stdc++6 libstdc++6 libglu1-mesa locales \
    ca-certificates \
    git-core \
    supervisor \
    curl \
    unzip \
    rsync \
    gcc \
    build-essential \
    libgtk-3.0 \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

RUN sh -c 'echo "en_US.UTF-8 UTF-8" > /etc/locale.gen' && \
    locale-gen && \
    update-locale LANG=en_US.UTF-8

ENV FLUTTER_HOME /root/flutter
ENV FLUTTER_ROOT $FLUTTER_HOME
ENV FLUTTER_VERSION $flutter_version

RUN git clone https://github.com/flutter/flutter.git ${FLUTTER_HOME}
ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin
RUN flutter precache --linux

ENV DESKTOP_HOME /root/flutter-desktop-embedding
RUN git clone --depth 1 https://github.com/google/flutter-desktop-embedding.git ${DESKTOP_HOME}
RUN apt-get -qqy update && apt-get -qqy install \ 
    scrot 

RUN apt-get install -y --no-install-recommends \
    make \
    pkgconf \
    xz-utils \
    xorg-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libxxf86vm-dev

RUN cd /root/flutter-desktop-embedding &&  \ 
    git clone -b docker https://github.com/tomaszpolanski/flutter-presentations.git
RUN mkdir /root/flutter-desktop-embedding/flutter-presentations/linux/ &&  \ 
    cp /root/flutter-desktop-embedding/example/linux/* /root/flutter-desktop-embedding/flutter-presentations/linux/

ENV ENABLE_FLUTTER_DESKTOP true

ENV DISPLAY :0



# Xvfb :0 -screen 0 1024x768x16 &
CMD ["Xvfb", ":0", "-screen", "0", "1024x768x16"]