"""




Python script listening to the GPIO pin n°5.
If an input is detected (via a button push), shutdown or wake up the Raspberry Pi.
@author const39
"""

from gpiozero import Button, LED
from signal import pause
import subprocess

def halt():
	led.off()
	subprocess.call(["poweroff"], shell=False)


## ** Main code ** ##
button = Button(3) # BCM 3 = GPIO 5
led = LED(4) # BCM 4 = GPIO 7

led.on()
button.when_pressed = halt # Callback when button is pressed

pause() # Pause main thread to prevent the script to end while background threads are running
