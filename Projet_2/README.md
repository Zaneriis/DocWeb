# Projet 2 

**Formalisation des informations semi structurées issus d'un tableur calc. Le programme prendra en entrée un ods et générera un fichier XML compatible avec le schéma XML du l'équipe 1**


## RAPPORT
Lien : https://www.overleaf.com/5648792571gydrbwmvvtqf

## Obtention du xml de sortie

Pour lire la sortie xml sur le terminal :  

``` bash
saxonb-xslt content.xml NoDEfr-2.xsl
```

Pour enregistrer la sortie xml dans un fichier output.xml :

``` bash
saxonb-xslt -o output.xml content.xml NoDEfr-2.xsl
```
