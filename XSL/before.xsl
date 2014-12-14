<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:hdoc="http://www.utc.fr/ics/hdoc/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- Identity transformation -->
    <xsl:template match="node()|@*" priority="1">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>        
    </xsl:template>    

    <!-- Namespace substitution for hdoc elements -->                        
    <xsl:template match="*" priority="1">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Match header and replace with div class="header" -->
    <xsl:template match="hdoc:header" priority="2">
        <xsl:element name="div">
            <xsl:attribute name="class">header</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Match footer and replace with div class="header" -->
    <xsl:template match="hdoc:footer" priority="2">
        <xsl:element name="div">
            <xsl:attribute name="class">footer</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Suppress processing-instructions -->
    <xsl:template match="processing-instruction()" priority="1"/>
    
</xsl:stylesheet>