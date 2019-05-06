<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="DIP55">
			<headers>
				<header name="recordTargetUniversal_DIP55_POCD_MT150001UK06"/>
				<header name="authorUniversal"/>
				<header name="dataEntererUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="authenticatorUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
			</headers>
			<components>
				<component name="01FF5CFE-50AD-D07D-E050-950AE0731D36"/>
				<component name="01FF5CFE-50AE-D07D-E050-950AE0731D36"/>
				<component name="01FF5CFE-50AF-D07D-E050-950AE0731D36"/>
				<component name="01FF5CFE-50B0-D07D-E050-950AE0731D36"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>