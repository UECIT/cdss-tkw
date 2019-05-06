<?xml version="1.0"?>

<!-- $Id: prepend_audit_identity.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- adds an ATM_ prefix to any auditIdentity -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

	<xsl:template match="itk:auditIdentity/itk:id/@uri" xmlns:itk="urn:nhs-itk:ns:201005">
		<xsl:attribute name="uri"> 
			<xsl:value-of select="concat('ATM_',.)"/>
		</xsl:attribute> 
	</xsl:template>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
