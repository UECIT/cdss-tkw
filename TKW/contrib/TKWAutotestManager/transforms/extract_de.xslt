<?xml version="1.0"?>

<!-- $Id: extract_de.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- extract the DistributionEvelope and rest of the payload from wherever you find it -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:itk="urn:nhs-itk:ns:201005" version="1.0">

<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

<!-- turn off default rules -->
<xsl:template match="text()"/>

<xsl:template match="itk:DistributionEnvelope">
	<xsl:copy-of select ="../*"/>
</xsl:template>

</xsl:stylesheet>
