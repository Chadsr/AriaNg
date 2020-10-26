FROM caddy:alpine

RUN apk add git
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ nodejs=8.14.0-r0 npm=8.14.0-r0

COPY package*.json ./
RUN mkdir -p ./node_modules
RUN npm install
COPY . .

RUN ./node_modules/.bin/gulp clean build

RUN mkdir -p /var/www/html/ariang
RUN cp -R ./dist/* /var/www/html/ariang

EXPOSE 80











