<?xml version="1.0"?>

<!--  extract the distribution envelope itk header service attribute failing that use the SOAPaction  -->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:itk="urn:nhs-itk:ns:201005" >
<xsl:output method="text" indent="no"/>

<!-- turn off default template -->
<xsl:template match="text()|@*"/>

<xsl:template match="itk:header">
	<xsl:choose>
		<xsl:when test="@service">
			<xsl:value-of select="@service"/>
		</xsl:when>
		<xsl:when test="/soap:Envelope/soap:Header/wsa:Action" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
			<xsl:value-of select="text()"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:message terminate ="no">Failed to extract service</xsl:message>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


</xsl:stylesheet>

