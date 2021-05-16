# Utilisation

## Description rapide du répertoire

- **xml2ttl.xsl** : feuille xslt qui transforme le xml en OWL au format turtle
- **resources.xml** : version xml du noDEfr2 produite par le groupe projet 2.2
- **noDEfr2_OWL.ttl** : output au format turtule après application de la feuille xslt sur le fichier xml

## Execution

L'application de la feuille xslt se fait via un compilateur xsl comme **Saxon**.

Executer la commande suivante dans le répertoire courant pour lancer la compilation.

```bash
saxonb-xslt -o noDEfr2_OWL.ttl resources.xml xml2ttl.xsl
```

## Validation

La validation de la syntaxe du fichier turtle peut se faire sur le [site du **W3C**](https://www.w3.org/2015/03/ShExValidata/). Il suffit de copier coller le fichier **noDEfr2_OWL.ttl** et de lancer la validation.
