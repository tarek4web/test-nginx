#!/bin/bash
envsubst '$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;' > mem.out &

ffmpeg -y -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 -reconnect_delay_max 2 -nostdin -err_detect ignore_err -user_agent $STREAMURLAGENT -i $STREAMURL -f flv $STREAMCODEC $STREAMRTMP