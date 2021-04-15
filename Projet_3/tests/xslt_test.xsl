<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:noDefr2="http://example.org/noDEfr2/">
<xsl:output method="text" indent="yes"/>

<xsl:template match="/" disable-output-escaping="yes">
<td></td>
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#>.
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#>.
@prefix noDEfr2: &lt;http://example.org/noDEfr2/>.
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="EntiteDuMondeDeLaFormation/*">
    <xsl:text>
        noDEfr2:Nom
            rdf:type rdfs:Class
            rdfs:comment Description
            rdfs:subClassOf Autre classe
    </xsl:text>
</xsl:template>

<xsl:variable name="slash">
/
</xsl:variable>

</xsl:stylesheet>
