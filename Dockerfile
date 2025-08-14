FROM node:16-alpine as init-builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# now we get the reuslt built into build folder we need to xtract that and load it in ngnix

FROM nginx
COPY --from=init-builder /app/build /usr/share/nginx/html

