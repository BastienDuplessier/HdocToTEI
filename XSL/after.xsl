<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:html="http://www.w3.org/1999/xhtml" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- Add schema instruction -->
    <xsl:template match="/">
        <xsl:processing-instruction name="oxygen" select="('RNGSchema=&quot;../tei_lite.rnc&quot;', 'type=&quot;xml&quot;')"/>
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
        FOO
    </xsl:template>

</xsl:stylesheet>
