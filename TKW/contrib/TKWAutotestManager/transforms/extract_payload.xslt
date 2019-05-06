<?xml version="1.0"?>

<!-- $Id: extract_payload.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- extract the itk payload from inside the distribution envelope -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:itk="urn:nhs-itk:ns:201005" version="1.0">

<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

<!-- turn off default rules -->
<xsl:template match="text()"/>

<xsl:template match="itk:payload[1]">
	<xsl:choose>
		<xsl:when test="count(*)">
			<xsl:copy-of select ="*"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:copy-of select ="text()"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
