# first phase
FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html