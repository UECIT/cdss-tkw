<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="NHN1">
			<headers>
				<header name="recordTargetUniversal_NHN1_POCD_MT130001UK05"/>
				<header name="authorUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="relatedDocumentUniversal"/>
				<!-- Encompassing encounter -->
				<!-- NB not as per spreadsheet -->
				<!--
			<header name="componentOfUniversal"/>
			-->
			</headers>
			<entries>
				<entry name="COCD_TP146049UK05Reason_a1349"/>
			</entries>
			<components>
				<component name="a1349_FEE0ECF4-AE89-A902-E040-950AE0737DEC"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>