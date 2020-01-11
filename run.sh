#!/bin/bash
echo -n "configuring nginx"
envsubst '$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
echo -n "starting nginx"
nginx -g 'daemon off;'

ffmpeg -y -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 -reconnect_delay_max 2 -nostdin -err_detect ignore_err -user_agent $STREAMURLAGENT -i $STREAMURL -f flv $STREAMCODEC $STREAMRTMP