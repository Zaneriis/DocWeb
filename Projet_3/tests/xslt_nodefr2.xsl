<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:noDefr2="http://example.org/noDEfr2/">
<xsl:output method="text" indent="yes"/>

<xsl:template match="/">
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#>.
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#>.
@prefix nodefr2: &lt;http://example.org/noDEfr2/>.
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="classe">
    nodefr2:<xsl:value-of select="@identifiant"/>
        rdf:type rdfs:Class;
        rdfs:label "<xsl:value-of select="nom"/>";
        rdfs:comment "<xsl:call-template name="comment"/><xsl:text>
        </xsl:text><xsl:call-template name="subClassOf"/>
        <xsl:apply-templates select="relation"/>
</xsl:template>

<xsl:template name="comment">
    <xsl:value-of select="definition"/><xsl:choose><xsl:when test="sousClasseDe != '' and sousClasseDe">";</xsl:when><xsl:otherwise>".</xsl:otherwise></xsl:choose>
</xsl:template>

<xsl:template name="subClassOf">
    <xsl:if test="sousClasseDe != '' and sousClasseDe">
        <xsl:variable name="sousClasses" select="sousClasseDe"/>
        <xsl:choose>
            <xsl:when test="contains($sousClasses,',')">rdfs:subClassOf nodefr2:<xsl:value-of select="substring-before($sousClasses,',')"/>;
        rdfs:subClassOf nodefr2:<xsl:value-of select="substring-after($sousClasses,', ')"/>.</xsl:when>
            <xsl:otherwise>rdfs:subClassOf nodefr2:<xsl:value-of select="$sousClasses"/>.</xsl:otherwise>
        </xsl:choose>
    </xsl:if>
</xsl:template>

<xsl:template match="relation">

    nodefr2:<xsl:value-of select="@identifiant"/>
        rdf:type rdf:Property;
        rdfs:label "<xsl:value-of select="nom"/>";
        rdfs:comment "<xsl:value-of select="definition"/>";
        rdfs:domain nodefr2:<xsl:call-template name="domain"/><xsl:text>
        </xsl:text><xsl:call-template name="range"/>
</xsl:template>

<xsl:template name="domain">
    <xsl:value-of select="../@identifiant"/><xsl:choose><xsl:when test="regleDeContenu != '' and regleDeContenu">;</xsl:when><xsl:otherwise>.</xsl:otherwise></xsl:choose>
</xsl:template>

<xsl:template name="range">
    <xsl:if test="regleDeContenu != '' and regleDeContenu">rdfs:range "<xsl:value-of select="regleDeContenu"/>".</xsl:if>
</xsl:template>

</xsl:stylesheet>
