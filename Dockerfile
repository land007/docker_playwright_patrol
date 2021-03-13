FROM land007/playwright:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN sed -i 's/\r$//' /*.sh ; chmod +x /*.sh && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/playwright_patrol" >> /.image_names && \
	echo "land007/playwright_patrol" > /.image_name


#docker build -t land007/playwright_patrol:latest .
#docker run -it --rm --ipc=host --user pwuser --security-opt seccomp=seccomp_profile.json --name playwright_patrol land007/playwright_patrol:latest
#docker cp playwright:/home/pwuser/example.png ./Desktop
