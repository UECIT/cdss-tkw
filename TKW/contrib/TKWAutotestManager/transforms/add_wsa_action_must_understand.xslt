<?xml version="1.0"?>

<!-- $Id: add_wsa_action_must_understand.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- wsa:Action with soap:mustUnderstand = 1 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

	<xsl:template match="wsa:Action" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		<xsl:comment>mustUnderstand attribute set to 1 by TKW AutotestManager</xsl:comment>
		<xsl:element name="wsa:Action">
		<xsl:attribute name="soap:mustUnderstand">
			<xsl:value-of select="'1'"/>
		</xsl:attribute>
		<xsl:value-of select="text()"/>
		</xsl:element>
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
	  <xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	  </xsl:copy>
	</xsl:template>

</xsl:stylesheet>
