<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="DIP26">
			<headers>
				<header name="recordTargetUniversal_DIP26_POCD_MT150001UK06"/>
				<header name="authorUniversal"/>
				<header name="dataEntererUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="authenticatorUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
			</headers>
			<entries>
				<entry name="COCD_TP146334GB01RequestMedicationAdministration_a136"/>
				<entry name="COCD_TP146325GB01Allergy_a138"/>
			</entries>
			<components>
				<component name="a138_a136_01FF5CFE-5057-D07D-E050-950AE0731D36"/>
				<component name="01FF5CFE-5058-D07D-E050-950AE0731D36"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>