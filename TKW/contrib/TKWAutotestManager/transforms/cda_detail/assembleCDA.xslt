<?xml version="1.0"?>
<!-- $Id: assembleCDA.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- assemble defined elements of a CDA document-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" version="2.0">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
	<!---  -->
	<xsl:variable name="extract_path" select="'extracted_xml/'"/>

	<!-- turn off default behaviour for elements to be replaced -->
	<xsl:template match="hl7:authenticator|hl7:legalAuthenticator|hl7:informationRecipient|hl7:receivedOrganization|hl7:author|hl7:custodian"/>
	<xsl:template match="hl7:dataEnterer|hl7:recordTarget|hl7:languageCommunication|hl7:informant|hl7:participant|hl7:componentOf"/>
	<xsl:template match="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry"/>
	<xsl:template match="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section//hl7:component"/>

	<xsl:template match="hl7:ClinicalDocument/hl7:relatedDocument"/>
	<!-- these appear in non coded CDA -->
	<xsl:template match="hl7:ClinicalDocument/hl7:documentationOf"/>
	<xsl:template match="hl7:ClinicalDocument/hl7:authorization"/>

	<!-- default is match all atts all nodes -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<!-- insert point for CDA headers -->
	<xsl:template match="hl7:ClinicalDocument/hl7:versionNumber">
		<!-- appends the version number -->
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
		<!-- append header elements -->
		<xsl:for-each select="$message/message/headers/header/@name">
			<xsl:comment><xsl:value-of select="."/> added by TKWAutotestManager</xsl:comment>
			<xsl:copy-of  copy-namespaces="no" select="document(concat($extract_path,.,'.xml'))"/>
		</xsl:for-each>
	</xsl:template>

	<!-- insert point for nonXMLBody/structuredBody -->
	<xsl:template match="hl7:ClinicalDocument/hl7:component" xmlns="urn:hl7-org:v3" exclude-result-prefixes="hl7">
		<xsl:choose>
			<xsl:when test="$message/message/nonXMLBody">
				<!-- append nonXMLBody -->
				<xsl:for-each select="$message/message/nonXMLBody/@name">
					<xsl:comment>nonXMLBody <xsl:value-of select="."/> added by TKWAutotestManager</xsl:comment>
						<component typeCode="COMP" contextConductionInd="true">
							<xsl:copy-of copy-namespaces="no" select="document(concat($extract_path,'nonXMLBody_',.,'.xml'))"/>
						</component>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<!-- append structuredBody -->
				<xsl:copy>
					<xsl:apply-templates select="@*|node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- handles coded entries and strcutured text for structuredBody -->
	<xsl:template match="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:id">
		<!-- append the id -->
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
		<!-- append entries -->
		<xsl:for-each select="$message/message/entries/entry/@name">
			<xsl:comment>entry <xsl:value-of select="."/> added by TKWAutotestManager</xsl:comment>
			<xsl:copy-of copy-namespaces="no" select="document(concat($extract_path,'entry_',.,'.xml'))"/>
		</xsl:for-each>
		<!-- append components -->
		<xsl:for-each select="$message/message/components/component/@name">
			<xsl:comment>component <xsl:value-of select="."/> added by TKWAutotestManager</xsl:comment>
			<xsl:copy-of  copy-namespaces="no" select="document(concat($extract_path,'component_',.,'.xml'))"/>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
