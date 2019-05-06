<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="DIN5">
			<headers>
				<header name="recordTargetUniversal_DIN5_POCD_MT130001UK05"/>
				<header name="authorUniversal"/>
				<header name="dataEntererUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="authenticatorUniversal"/>
				<header name="relatedDocumentUniversal"/>
				<!-- Encompassing encounter -->
				<!-- NB not as per spreadsheet -->
				<!--
			<header name="componentOfUniversal"/>
			-->
			</headers>
			<entries>
				<entry name="COCD_TP146049UK05Reason_a915"/>
			</entries>
			<components>
				<component name="a915_01FF5CFE-51F8-D07D-E050-950AE0731D36"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>