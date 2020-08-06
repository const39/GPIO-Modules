# GPIO Modules

## Installation / Désinstallation

-   Pour installer les modules Python et le script `gpio-modules`, exécuter le script Bash `install.sh`.
    Note : l'installation a lieu dans le répertoire de départ de l'utilisateur (`$HOME`)

-   Pour désinstaller les modules Python et le script `gpio-modules`, exécuter le script Bash `uninstall.sh`.

## Utilisation

Démarrer/arrêter un module :
`gpio-modules {start|stop} {<module_name>|all}`
où `module_name` est le nom du dossier contenant un script Python éponyme (ou `all` pour démarrer/arrêter tous les modules).

Lister les modules installés/démarrés :
`gpio-modules {installed|running}`

## Modules inclus

-   `on_off_button` gère l'allumage et l'arrêt du Raspberry Pi lors de l'appui sur le bouton associé.
-   `remote_scanner` envoie une requête de scan au scanner par défaut enregesitré par le Raspberry Pi et enregistre le fichier dans le dossier prévu à cet effet. **Nécessite le paquet `scanimage`.**
