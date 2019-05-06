<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="OPP5">
			<headers>
				<header name="recordTargetUniversal_OPP5_POCD_MT170001UK06"/>
				<header name="authorUniversal"/>
				<header name="dataEntererUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="authenticatorUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
			</headers>
			<entries>
				<entry name="COCD_TP146333GB01SupplyMedication_a975" comment="component comes with 56 and 57"/>
				<entry name="COCD_TP146330GB01MedicationAdministrationCourse_a976" comment="component comes with 53 and 57"/>
				<entry name="COCD_TP146322GB01AllergyEvent_a977"/>
			</entries>
			<components>
				<component name="a976_a975_01FF5CFE-5164-D07D-E050-950AE0731D36"/>
				<component name="a977_01FF5CFE-5165-D07D-E050-950AE0731D36"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>