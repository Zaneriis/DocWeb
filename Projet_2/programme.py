#!/home/alexia/anaconda3/bin/python3
from pandas_ods_reader import read_ods
from lxml import etree
import unidecode
import struct


def creationRacine(path):
    sheet_name = "Classes"
   
    root = etree.Element("root")
    racine = etree.SubElement(root, "EntiteDuMondeDeLaFormation")

    obtenirValeurCellule(path, sheet_name, racine, 1)
    creationFils(path, racine)
    contenuSheetSecondaire(path, root)


    tree = etree.ElementTree(root)
    return(tree)


def creationFils(path, branche):
    nomFils=['CertificatBadgeDiplome', 'Certification', 'NiveauDeCertification', 'ConditionDAcces']
    sheet_name = "Classes"
    df = read_ods(path, sheet_name)

    for j in range(len(nomFils)):
        fils = etree.SubElement(branche, nomFils[j])
        obtenirValeurCellule(path, "Classes", fils, j+2)


def contenuSheetSecondaire(path, branche):
    detailfils = etree.SubElement(branche, "DetailsDesIdentifiants")
    sheet_name = "RC0015"
    descriptifParId= etree.SubElement(detailfils, "Feuille")

    df = read_ods(path, sheet_name)

    for j in range(len(df)):
        obtenirValeurCellule(path, sheet_name, descriptifParId, j)



def obtenirValeurCellule(path, sheet_name, branche, nb):
    df = read_ods(path, sheet_name)
    
    for i in range(len(df.columns)): 
        nom=df.columns[i].replace(" ", "") #Permet d'enlever les espaces dans le nom des colonnes
        if isinstance(df.iloc[nb,i], float):
            etree.SubElement(branche, unidecode.unidecode(nom)).text = str(df.iloc[nb,i]).encode('utf-8','ignore')
        else :
            etree.SubElement(branche, unidecode.unidecode(nom)).text = df.iloc[nb,i]


def main():
    path = "NoDEfr-2.ods"
    tree = creationRacine(path)

    tree.write("filename.xml")



if __name__ == "__main__":
    main()