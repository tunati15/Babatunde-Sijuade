# Specifying the base Image
FROM node:14-alpine

# Create app directory
# Setting work directory in the container
WORKDIR /app

# Install app dependencies
#  Copying the package.json from host machine to the container
COPY package*.json ./

# Installs node.js dependencies on the container.
RUN npm install

# Bundle app source
# copies content of the current directory (where the Dockerfile is located) into the “/app” directory of the container. 

COPY . /app 

# Expose port 
EXPOSE 80

CMD [ "node", "server.js" ]