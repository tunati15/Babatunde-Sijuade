# Specifying the base Image
FROM node:14-alpine

# Create app directory
# Setting work directory in the container
WORKDIR /app

# Install app dependencies
# where available (npm@5+)
# A wildcard is used to ensure both package.json AND package-lock.json are copied
#  Copying the package.json and package-lock.json to the container
COPY package*.json ./


# If you are building your code for production
# RUN npm ci --omit=dev
RUN npm install

# Bundle app source
COPY . /app 

# Expose port 
EXPOSE 80
CMD [ "node", "server.js" ]