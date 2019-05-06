<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="OPC2">
			<headers>
				<header name="recordTargetUniversal_OPC2_POCD_MT170001UK06"/>
				<header name="authorUniversal"/>
				<header name="dataEntererUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="informationRecipient1Universal"/>
				<header name="authenticatorUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
			</headers>
			<entries>
				<entry name="COCD_TP146325GB01Allergy_a1026" comment="component comes with 55"/>
				<entry name="COCD_TP146329GB01MedicationAdministrationDose_a1027" comment="component comes with 53 and 56"/>
			</entries>
			<components>
				<component name="a1026_01FF5CFE-51A1-D07D-E050-950AE0731D36"/>
				<component name="a1027_01FF5CFE-51A2-D07D-E050-950AE0731D36"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>