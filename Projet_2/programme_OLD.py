#!/home/alexia/anaconda3/bin/python3
from pandas_ods_reader import read_ods
from lxml import etree
import unidecode


def creationRacine(df):
    root = etree.Element("root")
    doc = etree.SubElement(root, "EntiteDuMondeDeLaFormation")

    for j in range(len(df)):
        
        doc = etree.SubElement(root, "EntiteDuMondeDeLaFormation")

        for i in range(len(df.columns)): 
            nom=df.columns[i].replace(" ", "")
            etree.SubElement(doc, unidecode.unidecode(nom)).text = df.iloc[j,i]

    tree = etree.ElementTree(root)
    tree.write("filename.xml")

def main():
    path = "NoDEfr-2.ods"
    sheet_name = "Classes"
    df = read_ods(path, sheet_name)
    creationRacine(df)
    

if __name__ == "__main__":
    main()