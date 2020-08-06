"""
Python script listening to the GPIO pin n° #######.
If an input is detected (via a button push), request a scan to the defaut scanner and save the file in a directory.
@author Constantin Fleury (const39)
"""

from gpiozero import Button
import subprocess
from datetime import datetime


DEST_DIR = "/home/pi/scan"
DEST_FORMAT = "tiff"

# Initialise a connection on the pin n° ########### TODO
button = Button(5)
button.when_pressed = scan


# TODO add safety net to prevent the start of multiple scan at once


def generateFilename():
    """
    Generate a filename containing the current datetime.
    """
    return "scan_" + datetime.now().strftime("%d/%m/%Y_%H:%M:%S") + "." + DEST_FORMAT


def scan():
    # Create the file name with the current datetime
    filename = generateFilename()

    # Request a scan
    subprocess.call(
        ["scanimage", "--format=" + DEST_FORMAT, ">", DEST_DIR + "/" + filename],
        shell=False,
    )
