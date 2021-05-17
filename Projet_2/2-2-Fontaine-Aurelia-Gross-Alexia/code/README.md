Enregistrement de la sortie du premier filtre NoDEfr-2.1.xsl (qui permet d'avoir un document xml bien formé) dans le fichier NoDEfr-2.1.xml :

```bash
saxonb-xslt -o NoDEfr-2.1.xml content.xml NoDEfr-2.1.xsl
```
Le fichier NoDEfr-2.1.xml correspond aux attentes mais il contient des balises dont le contenu est vide.  
Pour les supprimer, on applique un nouveau filtre (NoDEfr-2.2.xsl) pour obtenir la nouvelle sortie NoDEfr-2.2.xml :

```bash
saxonb-xslt -o NoDEfr-2.2.xml NoDEfr-2.1.xml NoDEfr-2.2.xsl

```
Pour vérifier la validité du fichier de sortie final NoDEfr-2.2.xml on exécute la commande suivante : 

```bash
xmllint --schema $chemin_vers_le_xsd/NoDEfe-2.xsd NoDEfr-2.2.xml --noout
```
