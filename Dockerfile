# build the SPA
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run the nginx server and serve the build
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html