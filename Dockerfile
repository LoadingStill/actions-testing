FROM: node:Debian
COPY . app
WORKDIR /app
CMD node app.js
