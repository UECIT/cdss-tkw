<?xml version="1.0"?>

<!-- $Id: SO_RPLYTO.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_RPLYTO invalid non anonymous ReplyTo address in *sync* request -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

	<xsl:template match="wsa:From" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
		<xsl:comment>ReplyTo element added by TKW AutotestManager</xsl:comment>
		<xsl:element name="wsa:ReplyTo">
			<xsl:element name="wsa:Address">
				<xsl:text>http://www.w3.org/2005/08/addressing/NOTanonymous</xsl:text>
			</xsl:element>
		</xsl:element>
		<xsl:comment>FaultTo element added by TKW AutotestManager</xsl:comment>
		<xsl:element name="wsa:FaultTo">
			<xsl:element name="wsa:Address">
				<xsl:text>__FAULTTO__</xsl:text>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
	  <xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	  </xsl:copy>
	</xsl:template>

</xsl:stylesheet>
