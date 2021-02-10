FROM node:10.23 AS build

WORKDIR /app
COPY . /app

RUN apt-get update -y
RUN apt-get install -y python
RUN apt-get install git

RUN npm run clean-all
RUN npm install
RUN npm run apply:bitpay
# Moved to the docker-compose
# RUN npm run start

EXPOSE 8100
