FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 
# /app/build have our files to run in production

# essentialy saying that the first block is finished
FROM nginx

# In our machine it does not do anything automatically
# It is for elastbeanstalk, it automatically map to our incoming traffic
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html