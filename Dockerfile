FROM node:latest
MAINTAINER Felipe Seolin Bento
ENV NODE_ENV=production
ENV PORT=3000
COPY . /var/www
WORKDIR /var/www
RUN npm install
ENTRYPOINT npm start
EXPOSE $PORT