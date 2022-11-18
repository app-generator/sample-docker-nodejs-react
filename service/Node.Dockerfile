# pull official base image
FROM node:14

# set working directory
WORKDIR /usr/src/app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY api-server-nodejs/package.json ./
RUN npm install 

# add app
COPY api-server-nodejs ./
RUN npm run build

RUN ls
RUN pwd
# Expose port
EXPOSE 5000

# start app
CMD ["npm", "run" ,"start-node"]
