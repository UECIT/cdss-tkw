<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="DIP5">
			<headers>
				<header name="recordTargetUniversal_DIP5_POCD_MT150001UK06"/>
				<header name="authorUniversal"/>
				<header name="dataEntererUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="authenticatorUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
				<!--
			<header name="legalAuthenticatorUniversal"/>
			-->
				<!-- -->
				<!-- Components of informationRecipientUniversal -->
				<!-- second nested informationRecipientUniversal is a person -->
				<!--
			<header name="informationRecipient1Universal" />
			<header name="receivedOrganizationUniversal"/>
			-->
				<!-- -->
				<!--  languageCommunicationUniversal is an element of recordTarget -->
				<!--
			<header name="languageCommunicationUniversal" />
			<header name="informantUniversal"/>
			<header name="participantUniversal"/>
			-->
				<!-- Components of Encompassing encounter -->
				<!--
			<header name="responsiblePartyUniversal"/>
			<header name="locationUniversal"/>
			<header name="encounterParticipantUniversal"/>
			-->
			</headers>
			<entries>
				<entry name="COCD_TP146333GB01SupplyMedication_a53" comment="component comes with 56 and 57"/>
				<entry name="COCD_TP146325GB01Allergy_a54" comment="component comes with 55"/>
				<entry name="COCD_TP146334GB01RequestMedicationAdministration_a55" comment="component comes with 54"/>
				<entry name="COCD_TP146330GB01MedicationAdministrationCourse_a56" comment="component comes with 53 and 57"/>
				<entry name="COCD_TP146329GB01MedicationAdministrationDose_a57" comment="component comes with 53 and 56"/>
				<entry name="COCD_TP146322GB01AllergyEvent_a58"/>
				<entry name="COCD_TP146332GB01RequestMedicationSupply_a59"/>
			</entries>
			<components>
				<component name="a54_a55_01FF5CFE-4FF2-D07D-E050-950AE0731D36"/>
				<component name="a59_01FF5CFE-4FF3-D07D-E050-950AE0731D36"/>
				<component name="a57_a56_a53_01FF5CFE-4FF4-D07D-E050-950AE0731D36"/>
				<component name="a58_01FF5CFE-4FF5-D07D-E050-950AE0731D36"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>