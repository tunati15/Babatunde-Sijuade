# Specifying the base Image
FROM node:14-alpine

# Create app directory
# Setting work directory in the container
WORKDIR /app

# Install app dependencies
#  Copying the package.json and package-lock.json to the container
COPY package*.json ./


# IInstalls npm on the image

RUN npm install

# Bundle app source
COPY . /app 

# Expose port 
EXPOSE 80
CMD [ "node", "server.js" ]