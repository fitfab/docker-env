#Running this project
- git clone https://github.com/fitfab/docker-env.git
- docker-compose build
- docker-compose up
- Then check on the browser http://localhost:3002

##other docker commands
- command to build the image
> docker build -t fitfab/dev1:1.0 .
- command to run the image just created
> docker run -it --name dev1 fitfab/dev1:1.0 /bin/bash
