FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install dependencies
RUN npm install

# copy the rest of your app's source code from your app directory to your Docker image
COPY . .

# expose port 8080 for the app to listen on
EXPOSE 8080

# define the command to run your app
CMD [ "npm", "run", "serve" ]
