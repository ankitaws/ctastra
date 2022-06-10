FROM node:12-alpine
RUN yum install -y
WORKDIR /app
COPY . .
CMD ["node", "src/index.js"]
