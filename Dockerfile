FROM node:10.23 AS build

WORKDIR /app
COPY . /app

RUN apt-get update -y
RUN apt-get install -y python
RUN apt-get install git

RUN npm install
RUN npm run apply:copay
RUN npm run env:prod
RUN npm run ionic:build
# Moved to the docker-compose
# RUN npm run start

# EXPOSE 8100

# CMD ["npm", "run", "ionic:serve:nobrowser"]

FROM nginx:latest AS service

COPY --from=build app/www/ /usr/share/nginx/html/

EXPOSE 80
