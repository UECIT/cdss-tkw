<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/10/xpath-functions" xmlns:xdt="http://www.w3.org/2004/10/xpath-datatypes" xmlns:itk="urn:nhs-itk:ns:201005">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="profileReference" select="document('./Reference/itk_profile.xml')"/>
		<xsl:for-each select="//itk:DistributionEnvelope/itk:header/itk:manifest/itk:manifestitem">
			<xsl:variable name="profileid" select="./@profileid"/>
			<xsl:if test="$profileid ne ''">
				<xsl:variable name="payloadid" select="./@id"/>
				<xsl:variable name="payload" select="//itk:DistributionEnvelope/itk:payloads/itk:payload[@id=$payloadid]/*[1]"/>
				<xsl:variable name="configuration" select="$profileReference//ProfileConfig/profileId[@extension=$profileid]/.."/>
				<xsl:for-each select="$configuration//configGroup[@type='Vocabularies']//configItem">
					<xsl:variable name="codesystem" select="./@codeSystem"/>
					<xsl:variable name="csroot" select="./@codeSystemName"/>
					<xsl:variable name="version" select="./@codeSystemVersion"/>
					<xsl:variable name="csname" select="concat('./Reference/', $csroot)"/>
					<xsl:variable name="csfile" select="concat($csname,'.xml')"/>
					<xsl:variable name="codeSystemFile" select="document($csfile)"/>
					
					<xsl:choose>
						<xsl:when test="$codesystem !='2.16.840.1.113883.2.1.3.2.4.15'">
						
						<xsl:for-each select="$payload//*[@codeSystem = $codesystem]">
						<xsl:variable name="vocab" select="$codeSystemFile//itk:vocabulary[@id = $codesystem][@version = $version]"/>
						<!--
							There MAY be no "concept" elements in the vocabulary... only try to apply the check if there is
							anything to apply it with...
						-->
						<xsl:if test="$vocab/itk:concept">
							<xsl:variable name="code" select="./@code"/>
								<!--<xsl:value-of select="$code"/>-->
							<xsl:variable name="displayName" select="./@displayName"/>
							<!--
									First see if the code is known to the vocabulary, then if the displayName matches
								-->
							<xsl:variable name="vocabConcept" select="$vocab/itk:concept[@code = $code]"/>
							<xsl:choose>
								<xsl:when test="$vocabConcept">
									<!--
										The @displayName is optional - so we only check it if it is present
									-->
									<xsl:if test="$displayName">
										<xsl:choose>
											<xsl:when test="$vocabConcept/itk:displayName = $displayName"/>
											<xsl:otherwise>
												<xsl:variable name="location">
													<xsl:call-template name="plotPath">
														<xsl:with-param name="forNode" select="."/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:text>Error: Invalid displayName at </xsl:text>
												<xsl:value-of select="$location"/>
												<xsl:text> displayName </xsl:text>
												<xsl:value-of select="$displayName"/>
												<xsl:text> not valid for code </xsl:text>
												<xsl:value-of select="$code"/>
												<xsl:text> in vocabulary </xsl:text>
												<xsl:value-of select="$csroot"/>
												<xsl:text>/</xsl:text>
												<xsl:value-of select="$version"/>
												<br/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="location">
										<xsl:call-template name="plotPath">
											<xsl:with-param name="forNode" select="."/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:text>Error: Invalid code at </xsl:text>
									<xsl:value-of select="$location"/>
									<xsl:text> code </xsl:text>
									<xsl:value-of select="$code"/>
									<xsl:text> not found in vocabulary </xsl:text>
									<xsl:value-of select="$csroot"/>
									<xsl:text> OID/version: </xsl:text>
									<xsl:value-of select="$codesystem"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="$version"/>
									<br/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
							<!--SNOMED OID is ignored-->
					</xsl:otherwise>
				</xsl:choose>
				</xsl:for-each>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="plotPath">
		<xsl:param name="forNode"/>
		<xsl:if test="name($forNode)">
			<xsl:call-template name="plotPath">
				<xsl:with-param name="forNode" select="$forNode/.."/>
			</xsl:call-template>
			<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:value-of select="name($forNode)"/>
	</xsl:template>
</xsl:stylesheet>
