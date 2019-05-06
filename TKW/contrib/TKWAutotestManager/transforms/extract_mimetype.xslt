<?xml version="1.0"?>

<!--  extract the itk distribution envelope first manifest item mimetype -->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:itk="urn:nhs-itk:ns:201005" >
<xsl:output method="text" indent="no"/>

<!-- turn off default template -->
<xsl:template match="text()|@*"/>

<xsl:template match="itk:header/itk:manifest/itk:manifestitem[1]">
	<xsl:value-of  select="@mimetype"/>
</xsl:template>

</xsl:stylesheet>

