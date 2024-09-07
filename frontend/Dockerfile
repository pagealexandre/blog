FROM node:18
WORKDIR /app
# install vite globally
RUN yarn add vite
# copy all filtes
COPY . .
# install all deps
RUN yarn install

# vite default port
EXPOSE 2600
CMD ["yarn", "run", "dev"]