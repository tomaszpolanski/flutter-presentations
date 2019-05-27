FROM ubuntu:16.04

LABEL maintainer = "Tomek Polanski <polanski.tomek@gmail.com>"

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
    scrot \
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
RUN flutter precache --linux

ENV PRESENTATIONS_HOME /home/user/flutter-presentations
RUN git clone https://github.com/tomaszpolanski/flutter-presentations.git ${PRESENTATIONS_HOME}
ENV ENABLE_FLUTTER_DESKTOP true
RUN cd ${PRESENTATIONS_HOME} && \
    flutter packages get

ENV DISPLAY :0

CMD ["Xvfb", ":0", "-screen", "0", "1824x1824x16"]
#./build_docker.sh v1.6.0 ./
#docker run -d tomek/flutter:latest
#docker exec aea281ea4ac1bec020d5d9b1a38600de500f7084aba799dc1e942494f7d98fb4 sh -c "cd /home/user/flutter-presentations/ && ./run_tests.sh"
