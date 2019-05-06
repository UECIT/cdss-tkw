<?xml version="1.0"?>

<!--  extract from the itk distribution envelope the interaction id -->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:itk="urn:nhs-itk:ns:201005" >
<xsl:output method="text" indent="no"/>

<!-- turn off default template -->
<xsl:template match="text()|@*"/>

<xsl:template match="itk:header/itk:handlingSpecification/itk:spec[@key='urn:nhs-itk:ns:201005:interaction']">
	<xsl:value-of  select="@value"/>
</xsl:template>

</xsl:stylesheet>

