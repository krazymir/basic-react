FROM node:alpine as prodbuild

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

FROM nginx
EXPOSE 80
COPY --from=prodbuild /app/build /usr/share/nginx/html