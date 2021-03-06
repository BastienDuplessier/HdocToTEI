<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:html="http://www.w3.org/1999/xhtml" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- Add schema instruction -->
    <xsl:template match="/">
        <xsl:processing-instruction name="oxygen" select="('RNGSchema=&quot;schema.rnc&quot;', 'type=&quot;xml&quot;')"/>
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Identity transformation -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    
    <!-- Fix captions -->
    <xsl:template match="tei:table/html:caption">
      <xsl:element name="head" namespace="http://www.tei-c.org/ns/1.0">
	<xsl:apply-templates />
      </xsl:element>
    </xsl:template>

    <!-- Fix objects -->
    <xsl:template match="html:object">
      <xsl:element name="figure" namespace="http://www.tei-c.org/ns/1.0">
	<xsl:element name="graphic" namespace="http://www.tei-c.org/ns/1.0">
	  <xsl:attribute name="url"><xsl:value-of select="./@data"/></xsl:attribute>
	</xsl:element>
      </xsl:element>
    </xsl:template>

</xsl:stylesheet>
