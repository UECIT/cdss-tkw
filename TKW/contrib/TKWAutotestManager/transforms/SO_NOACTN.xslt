<?xml version="1.0"?>
<!-- $Id: SO_NOACTN.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_NOACTN missing action element -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

	<xsl:template match="wsa:Action" xmlns:wsa="http://www.w3.org/2005/08/addressing">
		<xsl:comment>Action element removed by TKW AutotestManager</xsl:comment>
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
