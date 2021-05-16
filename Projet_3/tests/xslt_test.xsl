<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xslt="http://xml.apache.org/xslt"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:noDefr2="http://example.org/noDEfr2/">
<xsl:output method="text" indent="yes" xslt:indent-amount="4"/>

<xsl:template match="/">
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#>.
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#>.
@prefix noDEfr2: &lt;http://example.org/noDEfr2/>.
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="classe">
    noDEfr2:<xsl:value-of select="identifiant"/>
        rdf:type rdfs:Class;
        rdfs:label <xsl:if test="nom != ''"><xsl:value-of select="nom"/></xsl:if>;
        rdfs:comment <xsl:value-of select="definition"/><xsl:choose><xsl:when test="sousClasseDe != '' and sousClasseDe">;&#xA;</xsl:when><xsl:otherwise>.&#xA;</xsl:otherwise></xsl:choose>
        <xsl:if test="sousClasseDe != '' and sousClasseDe">&#x09;&#x09;rdfs:subClassOf <xsl:value-of select="sousClasseDe"/>.</xsl:if>
        <xsl:apply-templates select="relation"/>

</xsl:template>

<xsl:template match="relation">

    noDEfr2:<xsl:value-of select="identifiant"/>
        rdf:type rdf:Property;
        rdfs:label <xsl:value-of select="nom"/>;
        rdfs:comment <xsl:value-of select="definition"/>;
        rdfs:domain <xsl:value-of select="../identifiant"/><xsl:if test="regleDeContenu != '' and regleDeContenu">;&#xA;</xsl:if>
        <xsl:if test="regleDeContenu != '' and regleDeContenu">&#x09;&#x09;rdfs:range <xsl:value-of select="regleDeContenu"/>.</xsl:if>
</xsl:template>

</xsl:stylesheet>
