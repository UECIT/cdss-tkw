<?xml version="1.0"?>

<!-- $Id: DE_INVMCT_2.2.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- DE_INVMCT DIST_BadManifestCount increment manifest count by one -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="itk:manifest" xmlns:itk="urn:nhs-itk:ns:201005">
		<xsl:comment>Manifest count attribute incremented by 1 by TKW AutotestManager</xsl:comment>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

	<xsl:template match="itk:manifest/@count" xmlns:itk="urn:nhs-itk:ns:201005">
		<xsl:attribute name="count"> 
			<xsl:value-of select=". + 1"/>
		</xsl:attribute> 
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
