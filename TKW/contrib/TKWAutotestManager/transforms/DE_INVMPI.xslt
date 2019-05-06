<?xml version="1.0"?>

<!-- $Id: DE_INVMPI.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- DE_INVMPI DIST_BadPayloadIDManifestID ? -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="itk:payloads" xmlns:itk="urn:nhs-itk:ns:201005">
		<xsl:comment>payload item uuid altered by TKW AutotestManager</xsl:comment>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

	<xsl:template match="itk:payload/@id" xmlns:itk="urn:nhs-itk:ns:201005">
		<xsl:attribute name="id"> 
			<xsl:value-of select="'uuid_9999999-9999-9999-9999-999999999999'"/>
		</xsl:attribute> 
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
