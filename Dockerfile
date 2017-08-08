FROM node:alpine

ADD ./ /app
WORKDIR /app

RUN yarn install
RUN yarn build

EXPOSE 3000

# ENTRYPOINT ["yarn", "run", "serve"] # this one does not send thru SIGINT, hours wasted: 2
ENTRYPOINT ["node", "./node_modules/.bin/http-server", "./build", "-p 3000", "--cors"]
