<?xml version="1.0"?>

<!-- $Id: ER_INVSCH.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- ER_INVSCH itk schema invalid element -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

	<xsl:template match="itk:manifest" xmlns:itk="urn:nhs-itk:ns:201005">
	  <xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	  </xsl:copy>
		<xsl:comment>breakschema element added by TKW AutotestManager</xsl:comment>
		<xsl:element name="itk:breakSchema"> 
			<xsl:value-of select="'BreakSchema'"/>
		</xsl:element> 
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
