<?xml version="1.0"?>
<!-- $Id: SO_EXHDMU_1.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_EXHDMU_1 wsa header with mustUnderstand = 1 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />

    <!-- add a mustUnderstand = 1 to wsa:MessageID -->
    <xsl:template match="wsa:MessageID" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <xsl:comment>wsa:MessageID with mustUnderstand attribute set to 1 added by TKW AutotestManager</xsl:comment>
				<xsl:copy>
					<xsl:attribute name="soap:mustUnderstand">
						<xsl:value-of select="'1'" />
					</xsl:attribute>
					<xsl:apply-templates select="@*|node()" />
				</xsl:copy>
    </xsl:template>

    <!-- match all atts all nodes -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
