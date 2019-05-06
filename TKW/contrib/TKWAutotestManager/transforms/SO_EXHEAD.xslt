<?xml version="1.0"?>
<!-- $Id: SO_EXHEAD.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_EXHEAD local header with no mustUnderstand -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <!-- match when there is already a local header elelemt -->
    <xsl:template match="local:LocalHeaderElement/@soap:mustUnderstand" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:local="local-namespace-uri">
        <xsl:comment>mustUnderstand attribute removed by TKW AutotestManager</xsl:comment>
    </xsl:template>

    <!-- match when there is not already a local header elelemt -->
    <xsl:template match="soap:Header/*[last()]" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:local="local-namespace-uri">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
        <xsl:if test="not(../local:LocalHeaderElement)">
            <xsl:comment>LocalHeaderElement with no mustUnderstand attribute added by TKW AutotestManager</xsl:comment>
            <xsl:element name="local:LocalHeaderElement">
                <xsl:text>Local_Data_To_Be_Ignored</xsl:text>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- match all atts all nodes -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
