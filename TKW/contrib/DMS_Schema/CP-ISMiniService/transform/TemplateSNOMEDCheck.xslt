<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xdt="http://www.w3.org/2004/10/xpath-datatypes" xmlns:itk="urn:nhs-itk:ns:201005">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="CDA_Reference" select="document('../Vocabulary/Reference/CDA_Reference.xml')"/>
		<xsl:for-each select="fn:distinct-values(//*[local-name()='structuredBody']//*[local-name()='entry']//*[local-name()='templateId']/substring-before(@extension, '#'))">
			<xsl:variable name="templateId" select="."/>
			<xsl:variable name="reftemplate" select="$CDA_Reference//CDAReference/dms/BodyChoice/ClassificationSection//schema[@Schema=$templateId]"/>
			<xsl:variable name="reftemplatename" select="$CDA_Reference//CDAReference/dms/BodyChoice/ClassificationSection//schema[@Schema=$templateId]/@SchemaName"/>
			<xsl:variable name="SnomedReq" select="$CDA_Reference/boolean(/CDAReference/dms/BodyChoice/ClassificationSection//schema[@Schema=$templateId][@snomedOID='true'][@snomedOIDrequired='true'])"/>
			<xsl:variable name="SnomedOpt" select="$CDA_Reference/boolean(/CDAReference/dms/BodyChoice/ClassificationSection//schema[@Schema=$templateId][@snomedOID='true'][@snomedOIDrequired='false'])"/>
			<xsl:variable name="SnomedNone" select="$CDA_Reference/boolean(/CDAReference/dms/BodyChoice/ClassificationSection//schema[@Schema=$templateId][@snomedOID='false'][@snomedOIDrequired='false'])"/>
			<xsl:choose>
				<xsl:when test="$SnomedNone = true()">
					<xsl:text>ERROR: </xsl:text>
					<xsl:value-of select="$reftemplatename"/>
					<xsl:text> When the native coding system is SNOMEDCT the system MUST use the equivalent SNOMEDCT template (see DMS)</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
