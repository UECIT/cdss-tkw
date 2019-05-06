<?xml version="1.0"?>
<!-- $Id: DE_INVPID.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- DE_INVPID invalid profileid -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

    <xsl:template match="itk:manifestitem" xmlns:itk="urn:nhs-itk:ns:201005">
		<xsl:choose>
			<xsl:when test="@profileid">
				<xsl:comment>profileid attribute modified by TKW AutotestManager</xsl:comment>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message terminate="no">profileid attribute not found in source</xsl:message>
			</xsl:otherwise>
		</xsl:choose>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

	<xsl:template match="itk:manifestitem/@profileid" xmlns:itk="urn:nhs-itk:ns:201005">
		<xsl:attribute name="profileid"> 
			<xsl:value-of select="concat(.,'invalid')"/>
		</xsl:attribute> 
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
	  <xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	  </xsl:copy>
	</xsl:template>

</xsl:stylesheet>
