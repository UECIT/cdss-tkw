<?xml version="1.0"?>
<!-- $Id: SO_INVTIM.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_INVTIM invalid timestamp created before expires -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

    <xsl:template match="wsu:Created" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
        <xsl:comment>Created element set to expire timestamp by TKW AutotestManager</xsl:comment>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="wsu:Expires" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
        <xsl:comment>Expires element set to created timestamp by TKW AutotestManager</xsl:comment>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

	<xsl:template match="wsu:Created/text()" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
		<xsl:value-of select="'__EXPIRES__'"/>
	</xsl:template>

	<xsl:template match="wsu:Expires/text()" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
		<xsl:value-of select="'__TIMESTAMP__'"/>
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
	  <xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	  </xsl:copy>
	</xsl:template>

</xsl:stylesheet>
