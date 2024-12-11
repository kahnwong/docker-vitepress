FROM node:22 AS build

WORKDIR /opt/build

COPY package.json .
COPY yarn.lock .
RUN yarn install

FROM node:22-alpine AS deploy

WORKDIR /opt/app

COPY --from=build /opt/build/package.json ./
COPY --from=build /opt/build/node_modules ./node_modules
COPY .vitepress/config.mts .vitepress/config.mts
COPY index.md .
COPY notes ./notes

EXPOSE 5173

CMD [ "yarn", "dev", "--host", "0.0.0.0" ]
