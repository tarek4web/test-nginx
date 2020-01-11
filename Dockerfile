FROM nginx:1.17.6

LABEL description="pysatools_heroku_build"

# Install required system packages and remove the apt packages cache when done.
RUN apt-get update && \
    apt-get upgrade -y && \ 	
    apt-get install -y \
	nscd  \
	ffmpeg && \
    apt-get clean
	
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html
COPY run.sh /home/

CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && /bin/bash ./home/run.sh && nginx -g 'daemon off;'

