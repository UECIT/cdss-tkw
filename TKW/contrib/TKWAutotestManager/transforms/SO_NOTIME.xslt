<?xml version="1.0"?>
<!-- $Id: SO_NOTIME.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_NOTIME missing timestamp -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

    <xsl:template match="wsu:Timestamp" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
        <xsl:comment>Timestamp element removed by TKW AutotestManager</xsl:comment>
	</xsl:template>

	<!--
    <xsl:template match="wsu:Created" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
        <xsl:comment>Created element set to empty by TKW AutotestManager</xsl:comment>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

	<xsl:template match="wsu:Created/text()" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
		<xsl:value-of select="''"/>
	</xsl:template>
	-->

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
	  <xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	  </xsl:copy>
	</xsl:template>

</xsl:stylesheet>
