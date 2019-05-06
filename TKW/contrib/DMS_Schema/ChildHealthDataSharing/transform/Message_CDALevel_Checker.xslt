<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2004/10/xpath-datatypes" xmlns:itk="urn:nhs-itk:ns:201005" exclude-result-prefixes="xsl xs fn xdt itk">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="CDA_Reference" select="document('../Vocabulary/Reference/CDA_Reference.xml')"/>
		<html>
			<head>
				<style>
table, th, td {
	color:#008000;
    <!--border: 1px dashed;-->
    border-collapse: collapse;
}
</style>
			</head>
			<body>
				<p>
					<b>The CDA Level of the validated document is the highest populated level in the table below</b>
				</p>
				<table border="1">
					<tr>
						<td>
							<b>Document Feature</b>
						</td>
						<td>
							<b>Detail</b>
						</td>
						<td>
							<b> Level 1 </b>
						</td>
						<td>
							<b> Level 2a </b>
						</td>
						<td>
							<b> Level 2b </b>
						</td>
						<td>
							<b> Level 3 </b>
						</td>
					</tr>
					<xsl:if test="boolean(//*[local-name()='structuredBody'])=false()">
						<tr>
							<td>StructuredText</td>
							<td>None present</td>
							<td align="center">Y</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</xsl:if>
					
					<xsl:if test="boolean(//*[local-name()='structuredBody'])=true()">
						<tr>
							<td>StructuredText</td>
							<td>Present</td>
							<td/>
							<td align="center">Y</td>
							<td/>
							<td/>
						</tr>
					</xsl:if>

					<xsl:variable name="SNOMEDCodedSections" select="boolean(//*[local-name()='structuredBody']//*[local-name()='section']/*[local-name()='code'][@codeSystem='2.16.840.1.113883.2.1.3.2.4.15']/../*[local-name()='templateId'])"/>
					<xsl:variable name="NonSNOMEDCodedSections" select="boolean(//*[local-name()='structuredBody']//*[local-name()='section']/*[local-name()='code'][not(@codeSystem='2.16.840.1.113883.2.1.3.2.4.15')]/../*[local-name()='templateId'])"/>
					<xsl:variable name="AnyCodedSections" select="boolean(//*[local-name()='structuredBody']//*[local-name()='section']/*[local-name()='code'])"/>

					<xsl:if test="boolean(//*[local-name()='structuredBody'])=false() ">
						<tr>
							<td>Section Headings</td>
							<td>None Present</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</xsl:if>

					<xsl:if test="boolean(//*[local-name()='structuredBody'])=true() and boolean(//*[local-name()='structuredBody']//*[local-name()='section'])=false()">
						<tr>
							<td>Section Headings</td>
							<td>None Present</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</xsl:if>
					<xsl:if test="boolean(//*[local-name()='structuredBody'])=true() and boolean(//*[local-name()='structuredBody']//*[local-name()='section'])=true()">
						<tr>
							<td>Section Headings</td>
							<td>Present</td>
							<xsl:if test="$AnyCodedSections=false()">
								<td/>
								<td align="center">Y</td>
								<td/>
								<td/>
							</xsl:if>
							<xsl:if test="$NonSNOMEDCodedSections=true()">
								<td/>
								<td/>
								<td align="center">Y</td>
								<td/>
							</xsl:if>
							<xsl:if test="$SNOMEDCodedSections=true()">
								<td/>
								<td/>
								<td align="center">Y</td>
								<td/>
							</xsl:if>
						</tr>
					</xsl:if>
	
	
					<xsl:if test="boolean(//*[local-name()='structuredBody'])=false()">
						<tr>
							<td>Entry</td>
							<td>None present</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</xsl:if>
					
					<xsl:if test="boolean(//*[local-name()='structuredBody']//*[local-name()='entry'])=false()">
						<tr>
							<td>Entry</td>
							<td>None present</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</xsl:if>

					<xsl:for-each select="//*[local-name()='structuredBody']//*[local-name()='entry']">
						<xsl:variable name="contentId" select="./*[local-name()='contentId']/@extension"/>
						
							<xsl:variable name="SNOMEDCOUNTcodeSystem" select="count(./*[local-name()='contentId'][@extension=$contentId]/..//*[@codeSystem='2.16.840.1.113883.2.1.3.2.4.15'])"/>
							<xsl:variable name="NonSNOMEDCOUNTcodeSystem" select="count(./*[local-name()='contentId'][@extension=$contentId]/..//*[@codeSystem !='2.16.840.1.113883.2.1.3.2.4.15'])"/>

							<tr>
							<td>Entry</td>		
							<td><xsl:value-of select="$contentId"/></td>
							
							
							
							<xsl:if test="boolean(//*[local-name()='structuredBody'])=true() and $SNOMEDCOUNTcodeSystem != 0 and $NonSNOMEDCOUNTcodeSystem = 0">
												
								
								<td/>
								<td/>
								<td/>
								<td align="center">Y</td>
						
							</xsl:if>
							<xsl:if test="$NonSNOMEDCOUNTcodeSystem != 0 and $SNOMEDCOUNTcodeSystem = 0 ">

								<td/>
								<td/>
								<td align="center">Y</td>
								<td/>
								
							</xsl:if>
							<xsl:if test="boolean(//*[local-name()='structuredBody'])=true() and $NonSNOMEDCOUNTcodeSystem != 0 and $SNOMEDCOUNTcodeSystem != 0 ">
								<td/>
								<td/>
								<td align="center">Y</td>
								<td align="center">Y</td>
								
							</xsl:if>
							
						</tr>
					</xsl:for-each>

	
	
						<xsl:if test="boolean(//*[local-name()='structuredBody'])=false()">
						<tr>
							<td>Template</td>
							<td>None present</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</xsl:if>

					<xsl:if test="boolean(//*[local-name()='structuredBody'])=true() and boolean(//*[local-name()='structuredBody']//*[local-name()='entry']//*[local-name()='templateId'])=false()">
						<tr>
							<td>Template</td>
							<td>None present</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</xsl:if>


				
					
					<xsl:for-each select="fn:distinct-values(//*[local-name()='structuredBody']//*[local-name()='entry']//*[local-name()='templateId']/substring-before(@extension, '#'))">
						<xsl:variable name="templateref" select="."/>
						<xsl:variable name="templatename" select="$CDA_Reference//*[local-name()='schema'][@Schema=$templateref]/@SchemaName"/>
						<xsl:variable name="SNOMEDrequiredtemplate" select="boolean($CDA_Reference//*[local-name()='schema'][@Schema=$templateref][@snomedOID='true'][@snomedOIDrequired='true'])"/>
						<xsl:variable name="SNOMEDoptionaltemplate" select="boolean($CDA_Reference//*[local-name()='schema'][@Schema=$templateref][@snomedOID='true'][@snomedOIDrequired='false'])"/>
						<xsl:variable name="NONSNOMEDtemplate" select="boolean($CDA_Reference//*[local-name()='schema'][@Schema=$templateref][@snomedOID='false'][@snomedOIDrequired='false'])"/>
						

						<xsl:if test="$SNOMEDrequiredtemplate=true()">
							<tr>
								<td>Template</td>
								<td>
									<xsl:value-of select="$templatename"/>
								</td>
								<td/>
								<td/>
								<td/>
								<td align="center">Y</td>
							</tr>
						</xsl:if>
						
						<xsl:if test="$SNOMEDoptionaltemplate=true()">
							<tr>
								<td>Template</td>
								<td>
									<xsl:value-of select="$templatename"/>
								</td>
								<td/>
								<td/>
								<td align="center">Y</td>
								<td/>
							</tr>
						</xsl:if>
						
						<xsl:if test="$NONSNOMEDtemplate=true()">
							<tr>
								<td>Template</td>
								<td>
									<xsl:value-of select="$templatename"/>
								</td>
								<td/>
								<td align="center">Y</td>
								<td/>
								<td/>
							</tr>
						</xsl:if>
				</xsl:for-each>

				</table>
				<p/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
