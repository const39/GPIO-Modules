"""
Python script listening to the GPIO pin n°5.
If an input is detected (via a button push), shutdown or wake up the Raspberry Pi.
@author const39
"""

from gpiozero import Button
import subprocess

# On initialise une connexion sur la broche BCM 3 (= GPIO 5)
button = Button(3)
button.wait_for_press()

subprocess.call(["halt"], shell=False)

