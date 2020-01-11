#!/bin/bash

ffmpeg -y -reconnect 1 -reconnect_streamed 1 -nostdin -err_detect ignore_err -user_agent $STREAMURLAGENT -i $STREAMURL  $STREAMCODEC  -format hls -sn -hls_time 10 -hls_list_size 5 -hls_flags split_by_time+append_list+discont_start+omit_endlist+delete_segments -hls_segment_filename /usr/share/nginx/html/c_%08d.ts  /usr/share/nginx/html/c.m3u8
