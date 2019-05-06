<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="AMN2">
			<headers>
				<header name="recordTargetUniversal_AMN2_POCD_MT130001UK05"/>
				<header name="authorUniversal"/>
				<header name="dataEntererUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="informationRecipient1Universal"/>
				<header name="authenticatorUniversal"/>
				<header name="relatedDocumentUniversal"/>
				<!-- Encompassing encounter -->
				<!-- NB not as per spreadsheet -->
				<!--
			<header name="componentOfUniversal"/>
			-->
			</headers>
			<entries>
				<entry name="COCD_TP146049UK05Reason_a1136"/>
			</entries>
			<components>
				<component name="a1136_01FF5CFE-51E4-D07D-E050-950AE0731D36"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>