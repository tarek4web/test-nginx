#!/bin/bash
envsubst '$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;' > mem.out &

ffmpeg -y -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 -reconnect_delay_max 2 -nostdin -err_detect ignore_err -user_agent $STREAMURLAGENT -i $STREAMURL  $STREAMCODEC  -format hls -sn -hls_time 10 -hls_list_size 5 -hls_flags split_by_time+append_list+discont_start+omit_endlist+delete_segments -hls_segment_filename "/usr/share/nginx/html/hls/c_%08d.ts"  /usr/share/nginx/html/hls/c.m3u8