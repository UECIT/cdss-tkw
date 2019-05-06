<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="NHR1">
			<headers>
				<header name="recordTargetUniversal_NHR1_POCD_MT200001GB02"/>
				<header name="authorUniversal"/>
				<header name="informantUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="participantUniversal"/>
				<header name="relatedDocumentUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
			</headers>
			<components>
				<component name="FEE0ECF4-AE83-A902-E040-950AE0737DEC"/>
				<component name="FEE0ECF4-AE84-A902-E040-950AE0737DEC"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>