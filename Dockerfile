FROM node:12
COPY . .
RUN npm install
EXPOSE 1111
CMD ["node", "server.js"]