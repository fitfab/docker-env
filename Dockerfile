FROM node:v4.4.3

# We create an unprivileged user, prosaically called app,
# to run the app inside the container. If you don’t do this,
# then the process inside the container will run as root,
# which is against security best practices and principles.
RUN useradd --user-group --create-home --shell /bin/false app

# install webpack and express
RUN npm install -g webpack && npm install -g express

# Home env variable
ENV HOME=/home/app

# set user
USER app

# Working directory
WORKDIR $HOME/chat

