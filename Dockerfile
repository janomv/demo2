# pull official base image
FROM node:14.19.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
#RUN npm install --silent
#RUN npm install react-scripts@3.4.1 -g --silent
RUN npm install @aws-amplify/cli@7.6.5 -g --silent
RUN npm install ui-react -g --silent
#RUN amplify push --y
# add app
COPY . ./

# start app
CMD ["npm", "start"]