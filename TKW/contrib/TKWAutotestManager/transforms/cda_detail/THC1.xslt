<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="THC1">
			<headers>
				<header name="recordTargetUniversal_THC1_POCD_MT190001UK03"/>
				<header name="authorUniversal"/>
				<header name="informantUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="informationRecipient1Universal"/>
				<header name="participantUniversal"/>
				<header name="documentationOfUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
			</headers>
			<entries>
				<entry name="COCD_TP146273GB01BodyTemperatureSeries_a1339"/>
				<entry name="COCD_TP146286GB02BodyTemperatureThreshold"/>
				<entry name="COCD_TP146279GB01DeviceDefinition"/>
			</entries>
			<components>
				<component name="a1339_FEE0ECF4-AE81-A902-E040-950AE0737DEC"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>