# Utilisation

## Execution

L'application de la feuille xslt se fait via un processeur xslt comme **Saxon**.

Pour compiler le projet, il suffit de lancer la commande :

```bash
make all
```

Ou executer la commande suivante dans le répertoire courant pour lancer le processeur.

```bash
saxonb-xslt -o bin/noDEfr2_OWL.ttl src/resources.xml src/xml2ttl.xsl
```

## Validation

La validation de la syntaxe du fichier turtle peut se faire sur le [site du **W3C**](https://www.w3.org/2015/03/ShExValidata/). Il suffit de copier coller le fichier **NoDEfr2_OWL.ttl** et de lancer la validation.
