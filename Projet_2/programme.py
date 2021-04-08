#!/home/alexia/anaconda3/bin/python3
from pandas_ods_reader import read_ods
from lxml import etree
import unidecode
import struct
import pandas as pd
from pyexcel import get_book


def creationRacine(path, nbSheet, sheetNames):
    singleSheetName = "Classes"
   
    root = etree.Element("root")
    racine = etree.SubElement(root, "EntiteDuMondeDeLaFormation")

    obtenirValeurCellule(path, singleSheetName, racine, 1)
    creationFils(path, racine)
    contenuSheetSecondaire(path, root, nbSheet, sheetNames)


    tree = etree.ElementTree(root)
    return(tree)


def creationFils(path, branche):
    nomFils=['CertificatBadgeDiplome', 'Certification', 'NiveauDeCertification', 'ConditionDAcces']
    sheet_name = "Classes"
    df = read_ods(path, sheet_name)

    for j in range(len(nomFils)):
        fils = etree.SubElement(branche, nomFils[j])
        obtenirValeurCellule(path, "Classes", fils, j+2)


def contenuSheetSecondaire(path, branche, nbSheet, sheetNames):
    detailfils = etree.SubElement(branche, "DetailsDesIdentifiants")

    for k in range(nbSheet-1):
        
        individualSheetName = sheetNames[k+1]
        descriptifParId= etree.SubElement(detailfils, "Identifiant", name=individualSheetName)

        df = read_ods(path, individualSheetName)

        for j in range(len(df)): #Nombre de lignes de la feuille de calcul
            separationInterieurDesId= etree.SubElement(descriptifParId, "Lignes")
            obtenirValeurCellule(path, individualSheetName, separationInterieurDesId, j)



#Obtention de la valeur par rapport à une ligne du tableur
def obtenirValeurCellule(path, sheet_name, branche, nb):
    df = read_ods(path, sheet_name)
    
    for i in range(len(df.columns)): 
        nom=df.columns[i].replace(" ", "") #Permet d'enlever les espaces dans le nom des colonnes
        if isinstance(df.iloc[nb,i], float):
            etree.SubElement(branche, unidecode.unidecode(nom)).text = str(df.iloc[nb,i]).encode('utf-8','ignore')
        else :
            etree.SubElement(branche, unidecode.unidecode(nom)).text = df.iloc[nb,i]


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