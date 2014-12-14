<?xml version="1.0" encoding="UTF-8"?>
<!-- Also from hdoc_to_opale, mainly -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:c="urn:utc.fr:ics:hdoc:container"
    >
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="c:container">
    <project name="getContentFileAndTransformIt" basedir="." default="start">
      <property file="build.properties"/>
      <xsl:apply-templates select="./c:rootfiles"/>
    </project>
  </xsl:template>
  
  <xsl:template match="c:rootfiles">
    <target name="start">
      <xslt
          in="${output_dir}/temp/unzipped/{c:rootfile/@full-path}"
          out="${output_dir}/temp/past_before.xml"
          style="${xsl_dir}/before.xsl"
	  classpath="{$lib_dir}/saxon9he.jar">
        <factory name="net.sf.saxon.TransformerFactoryImpl"/>
      </xslt>
    </target>
  </xsl:template>
</xsl:stylesheet>
