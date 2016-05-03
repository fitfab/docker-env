FROM node:4.4.3

# We create an unprivileged user, prosaically called app,
# to run the app inside the container. If you don’t do this,
# then the process inside the container will run as root,
# which is against security best practices and principles.
RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@3.8.7

# Home env variable
ENV HOME=/home/app

# copy package.json and npm-shrinkwrap.json from host
# to the container
COPY package.json npm-shrinkwrap.json $HOME/chat/
RUN chown -R app:app $HOME/*

# set user
USER app

# Working directory
WORKDIR $HOME/chat

# Setting the npm  registry helps speed up things 
# (https://medium.com/@andyccs/webpack-and-docker-for-development-and-deployment-ae0e73243db4#.1p0m5nwx6)
# install packages and shrinkwrap
RUN npm config set registry http://registry.npmjs.org/ && \
    npm install && npm shrinkwrap

# run command
CMD ["node", "index.js"]

