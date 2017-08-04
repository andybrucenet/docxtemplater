FROM mhart/alpine-node:8
MAINTAINER Andrew Bruce <andy@softwareab.net>

# packages
RUN \
  npm install docxtemplater -g && \
  npm install jszip@2 -g

# runtime user
RUN adduser -D -u 1000 npmuser
USER npmuser
WORKDIR /work

# set entrypoint
ENTRYPOINT ["node"]

