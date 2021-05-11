<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>

<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:noDefr2="http://example.org/noDEfr2/">
  <xsl:output method="text" indent="yes"/>
  
  <xsl:template match="/">
    <td></td>
    @prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#>.
    @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#>.
    @prefix noDEfr2: &lt;http://example.org/noDEfr2/>.
    @prefix owl: &lt;http://www.w3.org/2002/07/owl#> .
    @prefix owl2: &lt;http://www.w3.org/2006/12/owl2#> .
    <xsl:apply-templates/>
  </xsl:template>


  
  <xsl:template match="Modele">
    <xsl:apply-templates select="classe"/>
  </xsl:template>


  
  <xsl:template match="classe">    
    <xsl:variable name="idClasse">
      <xsl:value-of select="identifiant"/>
    </xsl:variable>
    <xsl:variable name="definitionClasse">
      <xsl:value-of select="definition"/>
    </xsl:variable>
    noDEfr2:<xsl:copy-of select="$idClasse"/> rdf:type owl:Class ;
    rdfs:label <xsl:value-of select="nom"/> ;
    rdfs:comment <xsl:value-of select="normalize-space($definitionClasse)"/> <xsl:if test="$idClasse = 'RC0000'"> .</xsl:if><xsl:if test="$idClasse != 'RC0000'"> ;
  </xsl:if>
  <xsl:if test="sousClasseDe">rdfs:subClassOf <xsl:value-of select="sousClasseDe"/> .
  </xsl:if>
  <xsl:apply-templates select="relation"/>
  </xsl:template>


  
  <xsl:template match="relation">
    
    noDEfr2:<xsl:value-of select="identifiant"/> rdf:type  owl:<xsl:if test="regleDeContenu">DataProperty ;</xsl:if><xsl:if test="not(regleDeContenu)">ObjectProperty ;</xsl:if>
    rdfs:label <xsl:value-of select="nom"/> ;
    rdfs:comment <xsl:value-of select="definition"/> ;
    rdfs:domain <xsl:value-of select="../identifiant"/> ;
    rdfs:range <xsl:if test="regleDeContenu"><xsl:value-of select="regleDeContenu"/> .</xsl:if><xsl:if test="not(regleDeContenu)"><xsl:value-of select="coDomaine"/> .</xsl:if>
    _:<xsl:value-of select="identifiant"/>Restriction rdf:type owl:Restriction ;
    owl:onProperty noDEfr2:<xsl:value-of select="identifiant"/> ;
    owl:minCardinality <xsl:value-of select="cardinaliteMin"/> ;
    owl:maxCardinality <xsl:value-of select="cardinaliteMax"/> .

  </xsl:template>

</xsl:stylesheet>
