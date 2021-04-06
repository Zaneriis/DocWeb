# Projet - NoDEfr-2, une norme pour la description des offres de formation

[Lien utile](https://sebsauvage.net/comprendre/xml/)

## Sujet

Un groupe d'experts de l'AFNOR travaillent depuis deux ans sur la spécification d'un modèle conceptuel pour la description des offres de formation (NoDEfr-2). Le méta modèle utilisé pour modéliser le NoDEfr-2 est celui proposé par l'ISO dans le cadre du MLR. Le paradigme de ce méta-modèle (ensembliste reposant sur la description de classes et d'éléments de données) est proche de ceux proposés par le W3C pour le web des données (RDFS) et le web sémantique (OWL2). Pour travailler les experts utilisent un tableur (document semi-formel): un onglet représente les classes, et les autres onglets (un par classe) leurs propriétés (éléments de données). L'objectif de ce projet est de formaliser automatiquement ce travail pour générer automatiquement des schémas RDFS et OWL.

**Formalisation des informations semi structurées issus d'un tableur calc. Le programme prendra en entrée un ods et générera un fichier XML compatible avec le schéma XML du l'équipe 1**

La grammaire XSD sera fournie par une autre équipe.

## Définitions

### ods

OpenDocument est un format ouvert de données pour les applications bureautiques : traitements de texte, tableurs, présentations, diagrammes, dessins et base de données bureautique. OpenDocument est la désignation d'usage d'une norme publiée par Organization for the Advancement of Structured Information Standards (OASIS) et dont l'appellation officielle est Open Document Format for Office Applications, également abrégée par le sigle ODF.

En France, le format OpenDocument est le seul format recommandé comme format bureautique par le référentiel général d'interopérabilité depuis sa version 2.0 validé le 20 avril 2016.

Il existe plusieurs types possibles : texte (odt), classeur (ods), présentation (odp), graphique (odg). Il ne s'agit là que des principaux.

### XML

XML, pour eXtensible Markup Language (langage de balisage extensible), est un langage de balisage généraliste recommandé par le W3C comme l'est HTML. XML est un sous-ensemble du langage SGML. Cela signifie que contrairement aux autres langages de balisages, XML n'est pas prédéfini, vous devez définir vos propres balises. Le but principal de ce langage est le partage de données entre différents systèmes, tel qu'Internet.

**C'est un des avantages du XML: c'est l'un des rares formats qui peut être à la fois lu par un humain et par un ordinateur**.

![XML_FAMILY](/home/alexia/Documents/INSA/ITI_4.2/WEBSEM/PROJET/XML_FAMILY.gif)

Exemple :

```XML
<?xml version= "1.0 " encoding= "utf-8 "?>
<annuaire>
    <personne dpmt= "sciences ">
        <nom> Dupond </nom>
        <prenom> Jean-Baptiste </prenom>
        <tel> 3637 </tel>
    </personne>
    ...
    <personne dpmt= "langue ">
        <nom> Martin </nom>
        <prenom> Michel </prenom>
        <tel> 5354 </tel>
    </personne>
</annuaire>
```

### XSD

XSD donne une définition précise de la structure d'un document au format XML, (quelle balise doit contenir quelle autre, quel type d'information peut contenir une balise (nombre, texte...), quelles balises sont obligatoires ou non, etc.).

Fichier XSD =  va contenir la **définition** de la structure du document XML.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" attributeFormDefault="unqualified">
    <xs:element name="BIBLIOTHEQUE">
        <xs:complexType>
            <xs:choice maxOccurs="unbounded">
                <xs:element name="MAGAZINE">
                    <xs:complexType>
                        <xs:sequence>
                            <xs:element name="TITRE" type="xs:string"/>
                            <xs:element name="DATEPARUTION" type="xs:date"/>
                        </xs:sequence>
                    </xs:complexType>
                </xs:element>
                <xs:element name="ROMAN">
                    <xs:complexType>
                        <xs:sequence>
                            <xs:element name="TITRE" type="xs:string"/>
                            <xs:element name="AUTEUR" type="xs:string"/>
                            <xs:element name="PRIX" type="xs:integer"/>
                        </xs:sequence>
                    </xs:complexType>
                </xs:element>
            </xs:choice>
        </xs:complexType>
    </xs:element>
</xs:schema>
```





## Liens

### XML

* https://lxml.de/tutorial.html
* https://webdevdesigner.com/q/creating-a-simple-xml-file-using-python-57655/
* https://docs.python.org/3/library/xml.etree.elementtree.html
* https://qastack.fr/programming/3605680/creating-a-simple-xml-file-using-python

### Pandas

* https://eric.univ-lyon2.fr/~ricco/tanagra/fichiers/fr_Tanagra_Data_Manipulation_Pandas.pdf