<?xml version="1.0"?>

<!-- $Id: SO_USRSUB.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_USRSUB Username changed to Known -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" version="1.0">

<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

<xsl:template match="wsse:Username">
	<xsl:comment>Username element set to Known by TKW AutotestManager</xsl:comment>
	<xsl:copy>
		<xsl:apply-templates select="@*|node()" />
	</xsl:copy>
</xsl:template>

<xsl:template match="wsse:Username/text()">
	<xsl:text>Known</xsl:text>
</xsl:template>

<!-- match all atts all nodes -->
<xsl:template match="@*|node()">
  <xsl:copy>
	<xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
