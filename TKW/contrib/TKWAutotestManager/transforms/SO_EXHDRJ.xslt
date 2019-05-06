<?xml version="1.0"?>
<!-- $Id: SO_EXHDRJ.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_EXHDRJ local header with mustUnderstand = 1 -->
<!-- Defect fix for Redmine 753 to include soap namespace JM -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <!-- match when there is already a local header elelemt -->
    <xsl:template match="local:LocalHeaderElement" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:local="local-namespace-uri">
        <xsl:comment>mustUnderstand attribute set to 1 by TKW AutotestManager</xsl:comment>
        <xsl:element name="local:LocalHeaderElement">
            <xsl:attribute name="soap:mustUnderstand">
                <xsl:value-of select="'1'" />
            </xsl:attribute>
            <xsl:value-of select="text()" />
        </xsl:element>
    </xsl:template>

    <!-- match when there is not already a local header elelemt -->
    <xsl:template match="soap:Header/*[last()]" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:local="local-namespace-uri">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
        <xsl:if test="not(../local:LocalHeaderElement)">
            <xsl:comment>LocalHeaderElement with mustUnderstand attribute set to 1 added by TKW AutotestManager</xsl:comment>
            <xsl:element name="local:LocalHeaderElement">
                <xsl:attribute name="soap:mustUnderstand">
                    <xsl:value-of select="'1'" />
                </xsl:attribute>
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
