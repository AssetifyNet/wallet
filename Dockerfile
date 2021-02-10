FROM node:10.23

WORKDIR /app
COPY . /app

RUN apt-get update -y
RUN apt-get install -y python
RUN apt-get install git

RUN npm install
RUN npm run apply:bitpay
# Moved to the docker-compose
# RUN npm run start

EXPOSE 8100

CMD ["npm", "run", "ionic:serve:nobrowser"]
