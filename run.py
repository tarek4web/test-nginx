import os
import sys
import time

while 1 > 0:

    if len( os.popen( "ps uaxw |grep ffmpeg |grep -c -v grep | awk '{ print $1 }'" ).read().strip().split( '\n' ) ) < 1:
        print ("Restarting ffmpeg")
        os.system("bash /home/ffmpeg.sh") 
    else:
        print ("sleeping 5")
        time.sleep(5)
