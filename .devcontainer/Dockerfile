FROM ruby:3.2.3

ENV DISPLAY=host.docker.internal:0.0

RUN apt-get update && apt-get install -y \
    git \
    telnet \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# タイムゾーンを日本標準時に設定（GitHub に push する時刻がズレないようにするため）
ENV TZ=Asia/Tokyo
