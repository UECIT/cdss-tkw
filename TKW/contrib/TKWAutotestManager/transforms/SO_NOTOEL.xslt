<?xml version="1.0"?>
<!-- $Id: SO_NOTOEL.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_NOTOEL missing SOAP To element, NB examples are actually *empty* To element not missing to element -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

    <xsl:template match="wsa:To" xmlns:wsa="http://www.w3.org/2005/08/addressing">
		<!--
        <xsl:comment>To element set to empty by TKW AutotestManager</xsl:comment>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
		</xsl:copy>
		-->
        <xsl:comment>To element removed by TKW AutotestManager</xsl:comment>
    </xsl:template>

	<xsl:template match="wsa:To/text()" xmlns:wsa="http://www.w3.org/2005/08/addressing">
			<xsl:value-of select="''"/>
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
