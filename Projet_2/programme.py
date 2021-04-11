#!/home/alexia/anaconda3/bin/python3
from pandas_ods_reader import read_ods
from lxml import etree
import unidecode
import struct
import pandas as pd
from pyexcel import get_book
import string


def creationRacine(path, nbSheet, sheetNames):
    singleSheetName = "Classes"
   
    root = etree.Element("root")

    df = read_ods(path, singleSheetName)
    nomIdentifiant=df.iloc[1,0]
    racine = etree.SubElement(root, "EntiteDuMondeDeLaFormation", IDREF=nomIdentifiant)

    obtenirValeurCellule(path, singleSheetName, racine, 1, 1, 1)
    creationFils(path, racine)
    #contenuSheetSecondaire(path, root, nbSheet, sheetNames)


    tree = etree.ElementTree(root)
    return(tree)


def creationFils(path, branche):
    sheet_name = "Classes"
    df = read_ods(path, sheet_name)

    for j in range(5):
        nom=string.capwords(df.iloc[2+j,1]).replace(",","").replace(" ", "").replace("'", "") #Permet de récupérer le nom des balises sans accents, ni espace, ni apostrophes
        nomIdentifiant=df.iloc[2+j,0]
        fils = etree.SubElement(branche, unidecode.unidecode(nom), IDREF=nomIdentifiant)
        obtenirValeurCellule(path, "Classes", fils, j+2, 1, 1)
        contenuSheetSecondaire(path,fils, nomIdentifiant)


def contenuSheetSecondaire(path, branche, nomSheet):
    detailBranche = etree.SubElement(branche, "Details")

    df = read_ods(path, nomSheet)

    for j in range(len(df)): #Nombre de lignes de la feuille de calcul
        separationInterieurDesId= etree.SubElement(detailBranche, "Lignes")
        obtenirValeurCellule(path, nomSheet, separationInterieurDesId, j,0, 2)



#Obtention de la valeur par rapport à une ligne du tableur
def obtenirValeurCellule(path, sheet_name, branche, commencementNumeroLigne, commencementNumeroColonne,arret):
    df = read_ods(path, sheet_name)
    
    for i in range(len(df.columns)-arret): 
        nom=df.columns[i+commencementNumeroColonne].replace(" ", "") #Permet d'enlever les espaces dans le nom des colonnes
        if isinstance(df.iloc[commencementNumeroLigne,i+commencementNumeroColonne], float):
            etree.SubElement(branche, unidecode.unidecode(nom)).text = str(df.iloc[commencementNumeroLigne,i+commencementNumeroColonne]).encode('utf-8','ignore')
        else :
            etree.SubElement(branche, unidecode.unidecode(nom)).text = df.iloc[commencementNumeroLigne,i+commencementNumeroColonne]


def main():
    path = "NoDEfr-2.ods" #Chemin du fichier à exporter

    #Connaître le nb de sheet du fichier
    xl = pd.ExcelFile(path)
    res = len(xl.sheet_names) 

    #Connaître le nom des sheets
    at = get_book(file_name=path)
    sheetNames= at.sheet_names()

    #Création de l'arbre
    tree = creationRacine(path, res, sheetNames)

    #Creation du fichier xml
    tree.write("filename.xml",  xml_declaration=True, encoding='utf-8', standalone="no")



if __name__ == "__main__":
    main()