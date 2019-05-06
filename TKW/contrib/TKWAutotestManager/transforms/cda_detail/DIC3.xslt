<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="DIC3">
			<headers>
				<header name="recordTargetUniversal_DIC3_POCD_MT150001UK06"/>
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
				<entry name="COCD_TP146333GB01SupplyMedication_a865" comment="component comes with 56 and 57"/>
				<entry name="COCD_TP146325GB01Allergy_a866" comment="component comes with 55"/>
				<entry name="COCD_TP146334GB01RequestMedicationAdministration_a867" comment="component comes with 54"/>
				<entry name="COCD_TP146330GB01MedicationAdministrationCourse_a868" comment="component comes with 53 and 57"/>
				<entry name="COCD_TP146329GB01MedicationAdministrationDose_a869" comment="component comes with 53 and 56"/>
				<entry name="COCD_TP146322GB01AllergyEvent_a870"/>
				<entry name="COCD_TP146332GB01RequestMedicationSupply_a871"/>
			</entries>
			<components>
				<component name="a866_a867_01FF5CFE-518F-D07D-E050-950AE0731D36"/>
				<component name="a871_01FF5CFE-5190-D07D-E050-950AE0731D36"/>
				<component name="a869_a868_a865_01FF5CFE-5191-D07D-E050-950AE0731D36"/>
				<component name="a870_01FF5CFE-5192-D07D-E050-950AE0731D36"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>