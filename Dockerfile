FROM mhart/alpine-node:8
MAINTAINER Andrew Bruce <andy@softwareab.net>

# required environment
ENV \
  NODE_PATH /usr/lib/node_modules

# packages
RUN \
  npm install docxtemplater -g && \
  npm install jszip@2 -g

# other startup info
WORKDIR /work
ENTRYPOINT ["docxtemplater"]

