# Projet 2 

**Formalisation des informations semi structurées issus d'un tableur calc. Le programme prendra en entrée un ods et générera un fichier XML compatible avec le schéma XML du l'équipe 1**


## RAPPORT
Lien : https://www.overleaf.com/5648792571gydrbwmvvtqf

## Obtention du xml de sortie

Enregistrement de la sortie du premier filtre NoDEfr-2.1.xsl (qui permet d'avoir un document xml bien formé) :

```bash
saxonb-xslt -o NoDEfr-2.1.xml content.xml NoDEfr-2.1.xsl
```
Le fichier NoDEfr-2.1.xml correspond aux attentes mais il contient des balises dont le contenu est vide. Pour les supprimer, on applique un nouveau filtre sur le fichier de sortie NoDEfr-2.1.xml :

```bash
saxonb-xslt -o NoDEfr-2.2.xml NoDEfr-2.1.xml NoDEfr-2.2.xsl

```
Pour vérifier la validité du fichier .xml on exécute la commande suivante : 

```bash
xmllint --schema ../Projet_1/NoDEfe-2.xsd NoDEfr-2.2.xml --noout
```
