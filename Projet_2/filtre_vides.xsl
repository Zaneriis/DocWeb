<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    
    <xsl:strip-space elements="*"/>

    <!--<xsl:template match="node()|@*">
        <xsl:if test=".//classe[string(@identifiant)]">
            <xsl:copy>
                <xsl:apply-templates select="node()[boolean(normalize-space())]|@*"/>
            </xsl:copy>
        <xsl:if>
    </xsl:template>-->

    <xsl:template match="/">
        <xsl:apply-templates/>
        <!--<xsl:apply-templates select=".//classe"/>-->
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

    <!-- <xsl:template match="classe">
        <xsl:if test="string(@identifiant)">
            <xsl:copy-of select=".[not(relation)]"/>                 -->
         <!--<xsl:apply-templates select="node()[boolean(normalize-space())]|@*"/>
            </xsl:copy>-->
            <!-- <xsl:apply-templates select="relation"/>
        </xsl:if>
    </xsl:template> -->

    <!-- <xsl:template match="relation">
        <xsl:if test="string(@identifiant)">
            <xsl:copy-of select="."/>                
        </xsl:if>
    </xsl:template> -->

</xsl:stylesheet>