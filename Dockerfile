#stage: 1
From node:8 as react-build
WORKDIR /app
COPY . ./
RUN yarn
RUN yarn build

#stage: 2 - the production environment
FROM nginx:alpine
COPY - from=react-build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "deamon off;"]
