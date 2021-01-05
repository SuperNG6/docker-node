# node lts-buster-slim
FROM node:lts-buster-slim
# set label
LABEL maintainer="NG6"

ENV TIMEZONE Asia/Shanghai
COPY bashrc /root/.bashrc
RUN apt -y update && apt -y install tzdata git curl wget \
&&	ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
&&	echo $TIMEZONE > /etc/timezone \
&&  echo "**** cleanup ****" \
&&  apt-get clean \
&&  rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

WORKDIR /app
# volume
VOLUME [ "/app" ]
