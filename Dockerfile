FROM node:16
# replace this with your application's default port
EXPOSE 8082

# Bundle APP files
COPY server server/
COPY package.json .
COPY ecosystem.config.js .
COPY server.js .

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install --production

# Show current folder structure in logs
RUN ls -al -R
ENV NODE_PORT 8082
ENV NODE_ENV production

CMD [ "node", "server.js" ]
