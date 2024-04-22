FROM node:20 AS base
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
FROM base AS build

WORKDIR /usr/src/app

COPY . .

RUN npm run build
RUN npm prune --prod

FROM node:20-alpine3.19 AS deploy

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/build ./build
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/package.json ./package.json

EXPOSE 	3333

CMD [ "npm", "start" ]