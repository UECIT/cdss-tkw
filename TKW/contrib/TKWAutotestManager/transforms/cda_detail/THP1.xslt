<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:include href="contrib/TKWAutotestManager/transforms/cda_detail/assembleCDA.xslt"/>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="message">
		<message name="THP1">
			<headers>
				<header name="recordTargetUniversal_THP1_POCD_MT190001UK03"/>
				<header name="authorUniversal"/>
				<header name="informantUniversal"/>
				<header name="custodianUniversal"/>
				<header name="informationRecipientUniversal"/>
				<header name="participantUniversal"/>
				<header name="documentationOfUniversal"/>
				<!-- Encompassing encounter -->
				<header name="componentOfUniversal"/>
			</headers>
			<entries>
				<entry name="COCD_TP146423GB01AlertEvent_a1332"/>
				<entry name="COCD_TP146262GB01BloodGlucoseSeries_a1333"/>
				<entry name="COCD_TP146283GB02BloodGlucoseThreshold_a1334"/>
				<entry name="COCD_TP146271GB01BloodPressureSeries_a1335"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1323"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1331"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1330"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1329"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1328"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1327"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1326"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1325"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1324"/>
				<entry name="COCD_TP146279GB01DeviceDefinition"/>
				<entry name="COCD_TP146423GB01AlertEvent_a1322"/>
			</entries>
			<components>
				<component name="a1322_a1324_a1325_a1326_a1327_a1328_a1329_a1330_a1331_a1323_a1332_FEE0ECF4-AE78-A902-E040-950AE0737DEC"/>
				<component name="a1334_FEE0ECF4-AE79-A902-E040-950AE0737DEC"/>
				<component name="a1335_FEE0ECF4-AE7A-A902-E040-950AE0737DEC"/>
				<component name="a1333_FEE0ECF4-AE7B-A902-E040-950AE0737DEC"/>
			</components>
		</message>
	</xsl:param>
	<xsl:template match="/">
		<xsl:apply-imports/>
	</xsl:template>
</xsl:stylesheet>