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
    <xsl:text>&#10;&#10;</xsl:text>
    <xsl:variable name="definitionClasse">
      <xsl:value-of select="definition"/>
    </xsl:variable>
    noDEfr2:<xsl:value-of select="@identifiant"/> rdf:type owl:Class ;
    rdfs:label &quot;<xsl:value-of select="translate(nom, '&quot;', '')"/>&quot; ;
    rdfs:comment &quot;<xsl:value-of select="normalize-space(translate($definitionClasse, '&quot;', ''))"/>&quot; <xsl:if test="sousClasseDe = '' or contains(sousClasseDe, ',')"> .
  </xsl:if>
  <xsl:if test="sousClasseDe != '' and not(contains(sousClasseDe, ','))"> ;
  </xsl:if>
  <xsl:apply-templates select="sousClasseDe"/>
  <xsl:apply-templates select="relation"/>
  </xsl:template>

  <xsl:template match="sousClasseDe">
  <xsl:if test=". != ''">
    <xsl:if test="contains(., ',')">  _:anonyme<xsl:value-of select="../@identifiant"/> rdf:type owl:Class ;
    rdfs:intersectionOf (<xsl:for-each select="tokenize(.,',')">noDEfr2:<xsl:sequence select="normalize-space(.)"/><xsl:if test="not(position() eq last())"><xsl:text> </xsl:text></xsl:if><xsl:if test="position() eq last()">)</xsl:if></xsl:for-each> .
    noDEfr2:<xsl:value-of select="../@identifiant"/> rdfs:subClassOf _:anonyme<xsl:value-of select="../@identifiant"/> .
    </xsl:if>
    <xsl:if test="not(contains(., ','))">  rdfs:subClassOf noDEfr2:<xsl:value-of select="."/> .</xsl:if>
  </xsl:if>
  </xsl:template>
  
  <xsl:template match="relation">
    <xsl:text>&#10;&#10;</xsl:text>
    <xsl:variable name="definitionRelation">
      <xsl:value-of select="definition"/>
    </xsl:variable>
    noDEfr2:<xsl:value-of select="@identifiant"/> rdf:type  owl:<xsl:if test="regleDeContenu != ''">DataProperty ;</xsl:if><xsl:if test="regleDeContenu = ''">ObjectProperty ;</xsl:if>
    rdfs:label &quot;<xsl:value-of select="translate(nom, '&quot;', '')"/>&quot; ;
    rdfs:comment &quot;<xsl:value-of select="normalize-space(translate($definitionRelation, '&quot;', ''))"/>&quot; ;
    rdfs:domain noDEfr2:<xsl:value-of select="../@identifiant"/> ;
    rdfs:range <xsl:if test="regleDeContenu != ''"> &quot;<xsl:value-of select="regleDeContenu"/>&quot; .</xsl:if><xsl:if test="regleDeContenu = ''">noDEfr2:<xsl:value-of select="coDomaine"/> .</xsl:if>
    _:<xsl:value-of select="@identifiant"/>Restriction rdf:type owl:Restriction ;
    owl:onProperty noDEfr2:<xsl:value-of select="@identifiant"/> ;
    <xsl:if test="cardinaliteMinimale = cardinaliteMaximale">owl:cardinality &quot;<xsl:value-of select="cardinaliteMinimale"/>&quot; .</xsl:if>
    <xsl:if test="cardinaliteMinimale != cardinaliteMaximale">
      <xsl:if test="cardinaliteMaximale = 'n'">owl:minCardinality &quot;<xsl:value-of select="cardinaliteMinimale"/>&quot; .</xsl:if>
      <xsl:if test="cardinaliteMaximale != 'n'">owl:minCardinality &quot;<xsl:value-of select="cardinaliteMinimale"/>&quot; ;
    owl:maxCardinality &quot;<xsl:value-of select="cardinaliteMaximale"/>&quot; .</xsl:if></xsl:if>
  </xsl:template>

</xsl:stylesheet>
