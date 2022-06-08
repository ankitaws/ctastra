FROM node:16-alpine AS builder
ENV NODE_ENV production
WORKDIR /app
COPY package.json .COPY package-lock.json .
RUN npm i --production
COPY . .
RUN npm run build
FROM nginx:stable-alpine as runner
ENV NODE_ENV production
COPY --from=builder /app/build /usr/share/nginx/htmlCOPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
