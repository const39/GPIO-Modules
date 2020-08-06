"""
Script python qui écoute la broche GPIO #######.
Si un input est détecté, lance un scan et sauve le fichier dans l'endroit prévu.

"""

from gpiozero import Button
import subprocess
from datetime import datetime


DEST_DIR = "/home/pi/scan"
DEST_FORMAT = "tiff"

# On initialise une connexion sur la broche ########### A CHANGER
button = Button(5)
button.when_pressed = scan


# TODO ajouter sécurité pour pas avoir plusieurs scans en même temps


def generateFilename():
    """
    Generate a filename containing the current datetime.
    """
    return "scan_" + datetime.now().strftime("%d/%m/%Y_%H:%M:%S") + "." + DEST_FORMAT


def scan():
    # Création du nom du fichier à partir de la date et l'heure courante
    filename = generateFilename()

    # Lancement du scan
    subprocess.call(
        ["scanimage", "--format=" + DEST_FORMAT, ">", DEST_DIR + "/" + filename],
        shell=False,
    )
