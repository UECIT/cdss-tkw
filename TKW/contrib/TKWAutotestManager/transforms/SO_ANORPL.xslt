<?xml version="1.0"?>

<!-- $Id: SO_ANORPL.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_ANORPL no reply to in async request -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

	<xsl:template match="wsa:ReplyTo" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		<xsl:comment>ReplyTo element removed by TKW AutotestManager</xsl:comment>
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
	  <xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	  </xsl:copy>
	</xsl:template>

</xsl:stylesheet>
