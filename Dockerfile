FROM nginx:1.17.6

LABEL description="pysatools_heroku_build"

# Install required system packages and remove the apt packages cache when done.
RUN apt-get update && \
    apt-get upgrade -y && \ 	
    apt-get install -y \
	python3  \
	python3-pip  \
	ssh  \
	supervisor  \
	nscd  \
	ffmpeg && \
    apt-get clean
	
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY run.sh /home/
COPY ffmpeg.sh /home/
COPY run.py /home/

CMD bash /home/run.sh

