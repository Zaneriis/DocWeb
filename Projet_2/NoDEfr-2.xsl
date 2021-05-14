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
    
    <!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->

    <xsl:template match="/">
            <xsl:element name="Modele">
                <xsl:apply-templates select=".//table:table[@table:name='Classes']/table:table-row/following-sibling::table:table-row[1]"/>
            </xsl:element>

    </xsl:template>

    <xsl:template match="table:table-row">
        <xsl:variable name="idClasse">
            <xsl:value-of select=".//table:table-cell[1]/text:p"/>
        </xsl:variable>
        <xsl:element name="classe">
            <xsl:attribute name="identifiant">
                <xsl:value-of select=".//table:table-cell[1]/text:p"/>
            </xsl:attribute>
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
    </xsl:template>

    <xsl:template match="table:table">
        <xsl:for-each select=".//table:table-row/following-sibling::table:table-row[1]">
            <xsl:element name="relation">
                <xsl:attribute name="identifiant">
                    <xsl:value-of select=".//table:table-cell[1]/text:p"/>
                </xsl:attribute>
                <xsl:element name="nom">
                    <xsl:value-of select=".//table:table-cell[2]/text:p"/>
                </xsl:element>
                <xsl:element name="definition">
                    <xsl:value-of select=".//table:table-cell[3]/text:p"/>
                </xsl:element>
                <xsl:element name="indicateurLinguistique">
                    <xsl:value-of select=".//table:table-cell[4]/text:p"/>
                </xsl:element>
                <xsl:element name="coDomaine">
                    <xsl:value-of select=".//table:table-cell[5]/text:p"/>
                </xsl:element>
                
                <xsl:call-template name="regleDeContenu">
                    <xsl:with-param name="j" select="6"/>
                </xsl:call-template>
                <xsl:variable name="repetition">
                    <xsl:value-of select="number(.//table:table-cell[6]/@table:number-columns-repeated)"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$repetition=4">
                        <xsl:call-template name="raffine">
                            <xsl:with-param name="j" select="6"/>
                        </xsl:call-template>
                        <xsl:call-template name="exemple">
                            <xsl:with-param name="j" select="6"/>
                        </xsl:call-template>
                        <xsl:call-template name="note">
                            <xsl:with-param name="j" select="6"/>
                        </xsl:call-template>
                        <xsl:call-template name="card_temp">
                            <xsl:with-param name="i" select="7"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$repetition=3">
                        <xsl:call-template name="raffine">
                            <xsl:with-param name="j" select="6"/>
                        </xsl:call-template>
                        <xsl:call-template name="exemple">
                            <xsl:with-param name="j" select="6"/>
                        </xsl:call-template>
                        <xsl:call-template name="note_temp">
                            <xsl:with-param name="i" select="7"/>
                        </xsl:call-template>                    
                    </xsl:when>
                    <xsl:when test="$repetition=2">
                        <xsl:call-template name="raffine">
                            <xsl:with-param name="j" select="6"/>
                        </xsl:call-template>
                        <xsl:call-template name="exemple_temp">
                            <xsl:with-param name="i" select="7"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="raffine_temp">
                            <xsl:with-param name="i" select="7"/>
                        </xsl:call-template>                    
                    </xsl:otherwise>
                </xsl:choose>



                <!-- <xsl:element name="regleDeContenu">
                    <xsl:value-of select=".//table:table-cell[6]/text:p"/>
                </xsl:element> -->

                <!-- <xsl:choose>
                    <xsl:when test=".//table:table-cell[6]/@table:number-columns-repeated">
                        <xsl:call-template name="iteration">
                            <xsl:with-param name="i" select=".//table:table-cell[6]/@table:number-columns-repeated"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="raffine">
                            <xsl:value-of select=".//table:table-cell[7]/text:p"/>
                        </xsl:element>
                        <xsl:choose>
                            <xsl:when test=".//table:table-cell[7][@table:number-columns-repeated='2']">
                                <xsl:element name="exemple">
                                    <xsl:value-of select=".//table:table-cell[7]/text:p"/>
                                </xsl:element>
                                <xsl:element name="note">
                                    <xsl:value-of select=".//table:table-cell[8]/text:p"/>
                                </xsl:element>
                                <xsl:element name="cardinaliteMinimale">
                                    <xsl:value-of select=".//table:table-cell[9]/text:p"/>
                                </xsl:element>
                                <xsl:element name="cardinaliteMaximale">
                                    <xsl:choose>
                                        <xsl:when test=".//table:table-cell[9][@table:number-columns-repeated='2']">
                                            <xsl:value-of select=".//table:table-cell[9]/text:p"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select=".//table:table-cell[10]/text:p"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="exemple">
                                    <xsl:value-of select=".//table:table-cell[8]/text:p"/>
                                </xsl:element>
                                <xsl:element name="note">
                                    <xsl:value-of select=".//table:table-cell[9]/text:p"/>
                                </xsl:element>
                                <xsl:element name="cardinaliteMinimale">
                                    <xsl:value-of select=".//table:table-cell[10]/text:p"/>
                                </xsl:element>
                                <xsl:element name="cardinaliteMaximale">
                                    <xsl:choose>
                                        <xsl:when test=".//table:table-cell[10][@table:number-columns-repeated='2']">
                                            <xsl:value-of select=".//table:table-cell[10]/text:p"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select=".//table:table-cell[11]/text:p"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose> -->

            </xsl:element>
        </xsl:for-each>        
    </xsl:template> 

    <!-- <xsl:template name="iteration">
        <xsl:param name="i"/>
        <xsl:choose>
            <xsl:when test="$i=4">
                <xsl:call-template name="raffine">
                    <xsl:with-param name="j" select="6"/>
                </xsl:call-template>
                <xsl:element name="exemple">
                    <xsl:value-of select=".//table:table-cell[6]/text:p"/>
                </xsl:element>
                <xsl:element name="note">
                    <xsl:value-of select=".//table:table-cell[6]/text:p"/>
                </xsl:element>
                <xsl:element name="cardinaliteMinimale">
                    <xsl:value-of select=".//table:table-cell[7]/text:p"/>
                </xsl:element>
                <xsl:element name="cardinaliteMaximale">
                    <xsl:choose>
                        <xsl:when test=".//table:table-cell[7][@table:number-columns-repeated='2']">
                            <xsl:value-of select=".//table:table-cell[7]/text:p"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select=".//table:table-cell[8]/text:p"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template> -->

    <!-- Template Raf+ -->

    <xsl:template name="raffine_temp">
        <xsl:param name="i"/>
        <xsl:variable name="repetition">
            <xsl:value-of select="number(.//table:table-cell[$i]/@table:number-columns-repeated)"/>
        </xsl:variable>
            <xsl:call-template name="raffine">
                <xsl:with-param name="j" select="$i"/>
            </xsl:call-template>            
        <xsl:choose>
            <xsl:when test="$repetition=3">
                <xsl:call-template name="exemple">
                    <xsl:with-param name="j" select="$i"/>
                </xsl:call-template> 
                <xsl:call-template name="note">
                    <xsl:with-param name="j" select="$i"/>
                </xsl:call-template> 
                <xsl:call-template name="card_temp">
                    <xsl:with-param name="i" select="$i+1"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$repetition=2">
                <xsl:call-template name="exemple">
                    <xsl:with-param name="j" select="$i"/>
                </xsl:call-template> 
                <xsl:call-template name="note_temp">
                    <xsl:with-param name="i" select="$i+1"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="exemple_temp">
                    <xsl:with-param name="i" select="$i+1"/>
                </xsl:call-template> 
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Template Ex+ -->

    <xsl:template name="exemple_temp">
        <xsl:param name="i"/>
        <xsl:variable name="repetition">
            <xsl:value-of select="number(.//table:table-cell[$i]/@table:number-columns-repeated)"/>
        </xsl:variable>
            <xsl:call-template name="exemple">
                <xsl:with-param name="j" select="$i"/>
            </xsl:call-template>            
        <xsl:choose>
            <xsl:when test="$repetition=2">
                <xsl:call-template name="note">
                    <xsl:with-param name="j" select="$i"/>
                </xsl:call-template> 
                <xsl:call-template name="card_temp">
                    <xsl:with-param name="i" select="$i+1"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="note_temp">
                    <xsl:with-param name="i" select="$i+1"/>
                </xsl:call-template> 
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Template Note+  -->
     
    <xsl:template name="note_temp">
        <xsl:param name="i"/>
        <xsl:variable name="repetition">
            <xsl:value-of select="number(.//table:table-cell[$i]/@table:number-columns-repeated)"/>
        </xsl:variable>
            <xsl:call-template name="note">
                <xsl:with-param name="j" select="$i"/>
            </xsl:call-template>            
        <xsl:choose>
            <xsl:when test="$repetition=3">
                <xsl:call-template name="cardinaliteMinimale">
                    <xsl:with-param name="j" select="$i"/>
                </xsl:call-template> 
                <xsl:call-template name="cardinaliteMaximale">
                    <xsl:with-param name="j" select="$i"/>
                </xsl:call-template> 
                <xsl:call-template name="raison">
                    <xsl:with-param name="j" select="$i+1"/>
                </xsl:call-template> 
            </xsl:when>
            <xsl:when test="$repetition=2">
                <xsl:call-template name="cardinaliteMinimale">
                    <xsl:with-param name="j" select="$i"/>
                </xsl:call-template> 
                <xsl:call-template name="cardinaliteMaximale">
                    <xsl:with-param name="j" select="$i+1"/>
                </xsl:call-template> 
                <xsl:call-template name="raison">
                    <xsl:with-param name="j" select="$i+2"/>
                </xsl:call-template> 
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="card_temp">
                    <xsl:with-param name="i" select="$i+1"/>
                </xsl:call-template> 
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Template Card+ -->
    
    <xsl:template name="card_temp">
        <xsl:param name="i"/>
        <xsl:variable name="repetition">
            <xsl:value-of select="number(.//table:table-cell[$i]/@table:number-columns-repeated)"/>
        </xsl:variable>
            <xsl:call-template name="cardinaliteMinimale">
                <xsl:with-param name="j" select="$i"/>
            </xsl:call-template>            
        <xsl:choose>
            <xsl:when test="$repetition=2">
                <xsl:call-template name="cardinaliteMaximale">
                    <xsl:with-param name="j" select="$i"/>
                </xsl:call-template>
                <xsl:call-template name="raison">
                    <xsl:with-param name="j" select="$i+1"/>
                </xsl:call-template>  
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="cardinaliteMaximale">
                    <xsl:with-param name="j" select="$i+1"/>
                </xsl:call-template> 
                <xsl:call-template name="raison">
                    <xsl:with-param name="j" select="$i+2"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--Création des balises peu importe le numéro de la cellule-->

    <xsl:template name="regleDeContenu">
        <xsl:param name="j"/>
            <xsl:element name="regleDeContenu">
                <xsl:value-of select=".//table:table-cell[$j]/text:p"/>
            </xsl:element>
    </xsl:template>

    <xsl:template name="raffine">
        <xsl:param name="j"/>
            <xsl:element name="raffine">
                <xsl:value-of select=".//table:table-cell[$j]/text:p"/>
            </xsl:element>
    </xsl:template>

    <xsl:template name="exemple">
        <xsl:param name="j"/>
            <xsl:element name="exemple">
                <xsl:value-of select=".//table:table-cell[$j]/text:p"/>
            </xsl:element>
    </xsl:template>

    <xsl:template name="note">
        <xsl:param name="j"/>
            <xsl:element name="note">
                <xsl:value-of select=".//table:table-cell[$j]/text:p"/>
            </xsl:element>
    </xsl:template>

    <xsl:template name="cardinaliteMinimale">
        <xsl:param name="j"/>
            <xsl:element name="cardinaliteMinimale">
                <xsl:value-of select=".//table:table-cell[$j]/text:p"/>
            </xsl:element>
    </xsl:template>

    <xsl:template name="cardinaliteMaximale">
        <xsl:param name="j"/>
            <xsl:element name="cardinaliteMaximale">
                <xsl:value-of select=".//table:table-cell[$j]/text:p"/>
            </xsl:element>
    </xsl:template>

    <xsl:template name="raison">
        <xsl:param name="j"/>
            <xsl:element name="raison">
                <xsl:value-of select=".//table:table-cell[$j]/text:p"/>
            </xsl:element>
    </xsl:template>

    <!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->

</xsl:stylesheet> 