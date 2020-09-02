"""
Python script listening to the GPIO pin n°23.
If an input is detected (via a button push), request a scan to the defaut scanner and save the file in a directory.
@author const39
"""

from gpiozero import LED, Button
from datetime import datetime
from signal import pause
import subprocess
import os


HOME_DIR = "/home/pi" 
SCAN_DIR = "scan"
DEST_DIR = HOME_DIR + '/' + SCAN_DIR
DEST_FORMAT = "png"

isRunning = False

def generateFilename():
    """
    Generate a filename containing the current datetime.
    """
    return "scan_" + datetime.now().strftime("%d-%m-%Y_%H:%M:%S") + "." + DEST_FORMAT

def createDir():
    """
    Create the destination directory if it does not exist.
    """

    if not os.path.exists(DEST_DIR):
        os.mkdir(DEST_DIR)

def scan():

    global isRunning
    if isRunning == False:

        isRunning = True

        # Create the destination directory if it doesn't exist
        createDir()

        # Create the file name with the current datetime
        filename = generateFilename()

        # Blink LED to indicate that the scan is processing
        led.blink(0.8, 0.8)

        # Request a scan
        request = ["scanimage", "--format=" + DEST_FORMAT]
        with open(DEST_DIR + '/' + filename, 'w') as outfile:
                subprocess.run(request, shell=False, stdout=outfile)

        # Switch the LED off once the process has ended
        led.off()

        isRunning = False


## ** Main code ** ##
button = Button(23) # GPIO 16 = BCM 23
led = LED(24) # GPIO 18 = BCM 24

button.when_pressed = scan # Callback when button pressed

pause() # Pause main thread to prevent to script to end while background threads are running

