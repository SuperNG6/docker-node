# node lts-buster-slim
FROM node:lts-buster-slim
# set label
LABEL maintainer="NG6"

COPY bashrc /.bashrc
RUN apt -y update && apt -y install tzdata git curl wget \
&&  echo "**** cleanup ****" \
&&  apt-get clean \
&&  rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

WORKDIR /app
# volume
VOLUME [ "/app" ]
