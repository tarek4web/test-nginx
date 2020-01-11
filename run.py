import os
import argparse
import sys
import time
import signal


while 1 > 0:

    process = os.popen("ps uaxw |grep ffmpeg |grep -c -v grep")
    processes = int(process[0])
    if ( processes < 1 ):
        m += 1
        try:
            print ("Restarting ffmpeg")
            os.system("bash /home/ffmpeg.sh") 

        except (KeyboardInterrupt, SystemExit):
            print ("CTRL+C received. Killing all workers")
    else:
        print ("status stopped sleeping for 5 s")
        time.sleep(5)
