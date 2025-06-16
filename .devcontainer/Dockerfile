FROM ruby:3.2.3

ENV DISPLAY=host.docker.internal:0.0

RUN apt-get update && apt-get install -y \
    git \
    telnet \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
