FROM node:14-alpine

RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

RUN apk update && apk upgrade

COPY ./nuxt-app /usr/src/nuxt-app/
RUN yarn install --silent

RUN yarn build

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

# start the app
CMD [ "yarn", "start" ]