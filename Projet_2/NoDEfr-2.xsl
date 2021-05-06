<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" 
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" 
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" 
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
    xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" 
    xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0"
    xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
    xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0"
    xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0"
    xmlns:math="http://www.w3.org/1998/Math/MathML"
    xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
    xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0"
    xmlns:ooo="http://openoffice.org/2004/office"
    xmlns:ooow="http://openoffice.org/2004/writer"
    xmlns:oooc="http://openoffice.org/2004/calc"
    xmlns:dom="http://www.w3.org/2001/xml-events"
    xmlns:xforms="http://www.w3.org/2002/xforms"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    office:version="1.0">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:strip-space elements="*"/>

    <!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
    <xsl:template match="/">
            <xsl:element name="Modele">
                <xsl:apply-templates select=".//table:table[@table:name='Classes']/table:table-row/following-sibling::table:table-row[1]"/>
            </xsl:element>

    </xsl:template>


    <!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--> 
    <xsl:template match="table:table-row">
        <xsl:if test="position() &lt; last()-3">
            <xsl:variable name="idClasse">
                <xsl:value-of select=".//table:table-cell[1]/text:p"/>
            </xsl:variable>
            <xsl:element name="classe">
                <!--<xsl:element name="test">
                    <xsl:value-of select=".//@table:style-name"/>
                </xsl:element>-->
                <xsl:element name="identifiant">
                    <xsl:value-of select=".//table:table-cell[1]/text:p"/>
                </xsl:element>
                <xsl:element name="nom">
                    <xsl:value-of select=".//table:table-cell[2]/text:p"/>
                </xsl:element>
                <xsl:element name="definition">
                    <xsl:value-of select=".//table:table-cell[3]/text:p"/>
                </xsl:element>
                <xsl:element name="sousClasseDe">
                    <xsl:value-of select=".//table:table-cell[4]/text:p"/>
                </xsl:element>
                <xsl:element name="note">
                    <xsl:value-of select=".//table:table-cell[5]/text:p"/>
                </xsl:element>
                <xsl:apply-templates select="//table:table[@table:name=$idClasse]"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="table:table">
        <xsl:for-each select=".//table:table-row/following-sibling::table:table-row[1]">
            <xsl:if test="position() &lt; last()-3">
                <xsl:element name="relation">
                    <!--<xsl:element name="test">
                        <xsl:value-of select=".//@table:style-name"/>
                    </xsl:element>-->
                    <xsl:element name="identifiant">
                        <xsl:value-of select=".//table:table-cell[1]/text:p"/>
                    </xsl:element>
                    <xsl:element name="nom">
                        <xsl:value-of select=".//table:table-cell[2]/text:p"/>
                    </xsl:element>
                    <xsl:element name="defintion">
                        <xsl:value-of select=".//table:table-cell[3]/text:p"/>
                    </xsl:element>
                    <xsl:element name="indicateurLinguistique">
                        <xsl:value-of select=".//table:table-cell[4]/text:p"/>
                    </xsl:element>
                    <xsl:element name="coDomaine">
                        <xsl:value-of select=".//table:table-cell[5]/text:p"/>
                    </xsl:element>
                    <xsl:element name="regleDeContenu">
                        <xsl:value-of select=".//table:table-cell[6]/text:p"/>
                    </xsl:element>
                    <xsl:element name="raffine">
                        <xsl:value-of select=".//table:table-cell[7]/text:p"/>
                    </xsl:element>
                    <xsl:element name="exemple">
                        <xsl:value-of select=".//table:table-cell[8]/text:p"/>
                    </xsl:element>
                    <xsl:element name="note">
                        <xsl:value-of select=".//table:table-cell[9]/text:p"/>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>        
    </xsl:template> 
    <!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->

</xsl:stylesheet> 