"""
Script python qui écoute la broche GPIO 5.
Si un input est détecté, éteint/allume le Raspberry.

"""

from gpiozero import Button
import subprocess

# On initialise une connexion sur la broche BCM 3 (= GPIO 5)
button = Button(3)
button.wait_for_press()

subprocess.call(["halt"], shell=False)

