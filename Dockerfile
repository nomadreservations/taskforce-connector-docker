FROM node:10-alpine

RUN yarn global add taskforce-connector@1.4.2

CMD ["taskforce"]
