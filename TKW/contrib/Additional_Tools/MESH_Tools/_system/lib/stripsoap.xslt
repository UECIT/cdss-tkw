<?xml version="1.0"?>

<!-- $Id: prepend_audit_identity.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- adds an ATM_ prefix to any auditIdentity -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:itk="urn:nhs-itk:ns:201005">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>

    <xsl:template match="/">
					<xsl:for-each select="/soap:Envelope/soap:Body/*">
						<xsl:copy-of select="."/>
					</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
