<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="Modele">
        <xsl:copy>
            <xsl:apply-templates select=".//classe"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="classe">
        <xsl:if test="string(@identifiant)">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:copy-of select="./*[name()!='relation']"/>
                <xsl:apply-templates select=".//relation"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>

    <xsl:template match="relation">
        <xsl:if test="string(@identifiant)">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:copy-of select="./*"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
