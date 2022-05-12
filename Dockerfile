FROM node:lts-alpine
WORKDIR /app

COPY ./package.json .
COPY ./yarn.lock .
RUN yarn install --production --pure-lockfile
COPY ./dist .

EXPOSE 8000
CMD [ "node", "./src/main.js" ]