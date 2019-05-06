<?xml version="1.0"?>

<!-- $Id: SO_AANRPL.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_AANRPL anonymous ReplyTo address in async request -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

	<xsl:template match="wsa:ReplyTo/wsa:Address" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		<xsl:comment>Anonymous ReplyTo added by TKW AutotestManager</xsl:comment>
		<wsa:Address>http://www.w3.org/2005/08/addressing/anonymous</wsa:Address>
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
	  <xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	  </xsl:copy>
	</xsl:template>

</xsl:stylesheet>
