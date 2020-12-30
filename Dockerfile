FROM node:15-buster-slim

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list
RUN sed -i "/^# deb.*universe/ s/^# //" /etc/apt/sources.list
RUN apt -q update && \
    apt install --yes \
      git \
      build-essential \
      pkg-config \
      libsodium-dev \
      autoconf-archive \
      libssl-dev
RUN git clone https://github.com/cjdelisle/PacketCrypt

RUN cd PacketCrypt && \
    ./autogen.sh && \
    ./configure && \
    make && \
    npm install
    
WORKDIR PacketCrypt
