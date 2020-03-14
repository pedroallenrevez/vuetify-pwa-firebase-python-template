FROM node:latest as build-stage
WORKDIR /app
COPY ./vuetify-pwa-firebase-python-template/package*.json ./
RUN yarn install
COPY ./vuetify-pwa-firebase-python-template .
RUN yarn build

FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
