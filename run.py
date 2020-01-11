import os
import argparse
import sys
import time
import signal


while 1 > 0:

    if len( os.popen( "ps uaxw |grep ffmpeg |grep -c -v grep | awk '{ print $1 }'" ).read().strip().split( '\n' ) ) < 1:
        try:
            print ("Restarting ffmpeg")
            os.system("bash /home/ffmpeg.sh") 

        except (KeyboardInterrupt, SystemExit):
            print ("CTRL+C received. Killing all workers")
    else:
        print ("status stopped sleeping for 5 s")
        time.sleep(5)
