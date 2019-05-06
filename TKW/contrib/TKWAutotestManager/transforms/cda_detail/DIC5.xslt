<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="DIC5">
			<headers>
				<header name="recordTargetUniversal_DIC5_POCD_MT150001UK06"/>
				<header name="authorUniversal"/>
				<header name="dataEntererUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="informationRecipient1Universal"/>
				<header name="authenticatorUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
			</headers>
			<nonXMLBody name="application_msword"/>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>