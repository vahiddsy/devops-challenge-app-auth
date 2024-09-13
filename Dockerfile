FROM docker.arvancloud.ir/node:18.20-alpine

RUN mkdir -p /home/node/app/node_modulesa && chown -R node:node /home/node/app

RUN apk --update --no-cache add curl

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install 

COPY --chown=node:node . .

USER node

EXPOSE 3000

CMD [ "npm", "start" ]