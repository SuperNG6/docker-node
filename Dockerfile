# node lts-buster-slim
FROM node:lts-buster-slim
# set label
LABEL maintainer="NG6"

RUN apt -y update && apt -y install tzdata git curl wget \
&&  cat >> /root/.bashrc << EOF \
	alias cnpm="npm --registry=https://registry.npm.taobao.org \
	--cache=$HOME/.npm/.cache/cnpm \
	--disturl=https://npm.taobao.org/dist \
	--userconfig=$HOME/.cnpmrc" \
	EOF \
&&  echo "**** cleanup ****" \
&&  apt-get clean \
&&  rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

WORKDIR /app
# volume
VOLUME [ "/app" ]
