FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 
# /app/build have our files to run in production

# essentialy saying that the first block is finished
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html