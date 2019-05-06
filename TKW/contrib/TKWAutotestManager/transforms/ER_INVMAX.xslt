<?xml version="1.0"?>

<!-- $Id: ER_INVMAX.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- ER_INVMAX message too large  CDA add an attachment non CDA add an extra payload -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

	<!-- invoke the service with service name uuid -->
	<xsl:variable name="guid" select="document('http://localhost:8000/getuuid')"/>
	<!-- get another with the uuid_ prefix -->
	<xsl:variable name="uuid" select="concat('uuid_',document('http://localhost:8000/getuuid'))"/>

	<!-- get the b64 file -->
	<!-- Fix for Redmine 1752 to change location due to folder structure changes in TKW, added contrib/TKWAutotestManager -->
	<xsl:variable name="file" select="'contrib/TKWAutotestManager/tstp/bigfile.b64'"/>


	<xsl:template match="/">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

    <xsl:template match="itk:manifest" xmlns:itk="urn:nhs-itk:ns:201005">
			<xsl:comment>manifest count attribute incremented by 1 by TKW AutotestManager</xsl:comment>
        <xsl:copy>
			<xsl:apply-templates select="@*|node()" />
				<xsl:comment>manifest item added by TKW AutotestManager</xsl:comment>
				<itk:manifestitem id="{$uuid}" mimetype="application/base64" base64="true" compressed="false"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="itk:payloads" xmlns:itk="urn:nhs-itk:ns:201005">
			<xsl:comment>payloads count attribute incremented by 1 by TKW AutotestManager</xsl:comment>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
				<xsl:comment>payload added by TKW AutotestManager</xsl:comment>
				<itk:payload id="{$uuid}">
						<!-- expects base64 content to be wrapped with an xml element which is immediately discarded -->
						<xsl:value-of select="document($file)"/>
				</itk:payload>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="itk:manifest/@count" xmlns:itk="urn:nhs-itk:ns:201005">
		<xsl:attribute name="count"> 
						<xsl:value-of select=". + 1"/>
		</xsl:attribute> 
	</xsl:template>

	<xsl:template match="itk:payloads/@count" xmlns:itk="urn:nhs-itk:ns:201005">
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
