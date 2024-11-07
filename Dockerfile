FROM node:20 AS build

WORKDIR /opt/build

COPY package.json .
COPY yarn.lock .
RUN yarn install

FROM node:20-alpine AS deploy

WORKDIR /opt/app

COPY . .
COPY --from=build /opt/build/package.json ./
COPY --from=build /opt/build/node_modules ./node_modules

EXPOSE 5173

CMD [ "yarn", "dev", "-h", "0.0.0.0" ]
