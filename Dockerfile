FROM land007/playwright:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN sed -i 's/\r$//' /*.sh ; chmod +x /*.sh && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/playwright_patrol" >> /.image_names && \
	echo "land007/playwright_patrol" > /.image_name

RUN echo "/check.sh /home/pwuser/node" >> /start.sh && \
#	echo "/usr/bin/nohup supervisor -w /node/ /node/server.js > /node/node.out 2>&1 &" >> /start.sh
	echo "supervisor -w /home/pwuser/node/ /home/pwuser/node/server.js" >> /start.sh

#USER pwuser

ADD node /home/pwuser/node_/
#RUN mkdir /home/pwuser/node && chmod -R 777 /home/pwuser/node_/ /home/pwuser/node/
RUN mkdir /home/pwuser/node && \
	chown pwuser /home/pwuser/node_/ /home/pwuser/node/ && \
	chgrp pwuser /home/pwuser/node_/ /home/pwuser/node/
WORKDIR /home/pwuser/node

EXPOSE 8080/tcp

#docker build -t land007/playwright_patrol:latest .
#docker run -it --rm --ipc=host --user pwuser --security-opt seccomp=seccomp_profile.json --name playwright_patrol land007/playwright_patrol:latest
#docker run -it --rm --ipc=host --user pwuser --security-opt seccomp=seccomp_profile.json --name playwright_patrol -p 18080:8080 -v C:\\Users\\jiayq\\git\\docker_playwright_patrol\\node:/home/pwuser/node land007/playwright_patrol:latest
#docker cp playwright:/home/pwuser/example.png ./Desktop

#docker exec -it playwright_patrol bash
