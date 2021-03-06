<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="DIP64">
			<headers>
				<header name="recordTargetUniversal_DIP64_POCD_MT150001UK06"/>
				<header name="authorUniversal"/>
				<header name="dataEntererUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="authenticatorUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
			</headers>
			<nonXMLBody name="image_png"/>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>