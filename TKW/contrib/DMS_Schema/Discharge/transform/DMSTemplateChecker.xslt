<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/10/xpath-functions" xmlns:xdt="http://www.w3.org/2004/10/xpath-datatypes" xmlns:itk="urn:nhs-itk:ns:201005" exclude-result-prefixes="xsl xs fn xdt itk">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="itk_profile_reference" select="document('../Vocabulary/Reference/itk_profile.xml')"/>
		<xsl:variable name="CDA_SectionConstraints" select="document('../../../Common/transforms/CDA_sectionConstraintRef.xml')"/>
		<xsl:variable name="messageName" select="$itk_profile_reference/ProfileConfigs/ProfileConfig/messageType/@displayName"/>
		<xsl:variable name="messageType" select="$itk_profile_reference/ProfileConfigs/ProfileConfig/messageType/@code"/>
		<xsl:variable name="dmsName" select="$CDA_SectionConstraints/ProfileConfigs/configGroup/configItem[@messageType=$messageType]/@dmsName"/>
		<CDAReference>
			<dms>
				<xsl:attribute name="dmsName"><xsl:value-of select="$dmsName"/></xsl:attribute>
				<xsl:attribute name="messageName"><xsl:value-of select="$messageName"/></xsl:attribute>
				<xsl:attribute name="messageType"><xsl:value-of select="$messageType"/></xsl:attribute>
				<xsl:variable name="SectionChoice" select="$CDA_SectionConstraints/ProfileConfigs/configGroup/configItem[@messageType=$messageType]/@SectionChoice"/>
				<xsl:variable name="SectionChoiceRef" select="concat('../TemplateSchemas/',$SectionChoice,'.xsd')"/>
				<xsl:variable name="SectionChoiceConstraint" select="document($SectionChoiceRef)"/>

				<xsl:variable name="SectionTemplateChoice" select="$CDA_SectionConstraints/ProfileConfigs/configGroup/configItem[@messageType=$messageType]/@SectionTemplateChoice"/>
		


				<xsl:variable name="CodedEntry" select="$CDA_SectionConstraints/ProfileConfigs/configGroup/configItem[@messageType=$messageType]/@CodedEntry"/>
				<xsl:variable name="CodedEntryRef" select="concat('../TemplateSchemas/',$CodedEntry,'.xsd')"/>


				<xsl:variable name="CREListTypeChoice" select="$CDA_SectionConstraints/ProfileConfigs/configGroup/configItem[@messageType=$messageType]/@CRETypeListChoice"/>
				
				
				<!-- OUTPUTXML: Start the ClassificationSection-->
<BodyChoice>

<xsl:choose>
	<xsl:when test="string-length($SectionTemplateChoice)!=0">
			<xsl:variable name="SectionTemplateChoiceRef" select="concat('../TemplateSchemas/',$SectionTemplateChoice,'.xsd')"/>
			<xsl:variable name="SectionTemplateChoiceConstraint" select="document($SectionTemplateChoiceRef)"/>
			
		
		<SectionTemplateChoice>
						<constraintTemplate>
							<xsl:attribute name="includedTemplate"><xsl:value-of select="$SectionTemplateChoice"/></xsl:attribute>
							<xsl:attribute name="TemplateSchemaName"><xsl:value-of select="$SectionTemplateChoiceConstraint/xs:schema/xs:group/@name"/></xsl:attribute>
						
							<xsl:for-each select="$SectionTemplateChoiceConstraint/xs:schema/xs:group/xs:choice/xs:group">
								<xsl:variable name="SectionTemplateChoicechemaref" select="./@ref"/>
								<xsl:variable name="SectionTemplateSchema" select="concat('../Schemas/',$SectionTemplateChoicechemaref,'.xsd')"/>
								<xsl:variable name="SectionSchemaFile" select="document($SectionTemplateSchema)"/>
								<xsl:variable name="Sectionschemaname" select="$SectionSchemaFile/xs:schema/xs:group/@name"/>
								<xsl:variable name="CodedValue" select="$SectionSchemaFile/boolean(//*[contains(@name,$SectionTemplateChoicechemaref)]//*//*[@type='CV'][@minOccurs='1'][@maxOccurs='1']/@name)"/>
								<xsl:variable name="displayName" select="$itk_profile_reference/ProfileConfigs/ProfileConfig/configGroup[@type='Templates']/configItem[@code=$SectionTemplateChoicechemaref]/@displayName"/>
								<sectionitem>
								
									<xsl:attribute name="sectionName"><xsl:value-of select="$SectionTemplateChoicechemaref"/></xsl:attribute>
									<xsl:attribute name="codedValue"><xsl:value-of select="$CodedValue"/></xsl:attribute>
									<xsl:attribute name="displayName"><xsl:value-of select="$displayName"/></xsl:attribute>
								</sectionitem>
								<template>
									<!--							<xsl:for-each select="$SectionChoiceConstraint/xs:schema/xs:group/xs:choice/xs:group">
-->
									<xsl:variable name="ref" select="./@ref"/>
									<xsl:variable name="SectionSchema" select="concat('../Schemas/',$ref,'.xsd')"/>
									<xsl:variable name="SectionSchemaFile" select="document($SectionSchema)"/>
									<xsl:variable name="SectionSchemaName" select="$SectionSchemaFile/xs:schema/xs:group//xs:element/@name"/>
									<templateItem>
										<xsl:attribute name="SectionSchema"><xsl:value-of select="$ref"/></xsl:attribute>
										<xsl:attribute name="SectionSchemaName"><xsl:value-of select="$SectionSchemaName"/></xsl:attribute>
										<xsl:for-each select="$SectionSchemaFile/xs:schema/xs:include[contains(@schemaLocation, '/TemplateSchemas/')]">
											<xsl:variable name="IncludedTemplate" select="./@schemaLocation"/>
											<xsl:variable name="TemplateSchemaFile" select="document($IncludedTemplate)"/>
											<xsl:variable name="TemplateSchemaName" select="$TemplateSchemaFile/xs:schema//@name"/>
											<constraintTemplate>
												<xsl:attribute name="includedTemplate"><xsl:value-of select="$IncludedTemplate"/></xsl:attribute>
												<xsl:attribute name="TemplateSchemaName"><xsl:value-of select="$TemplateSchemaName"/></xsl:attribute>
												<xsl:for-each select="$TemplateSchemaFile/xs:schema/xs:include[contains(@schemaLocation, '/Schemas/')]">
													<xsl:variable name="IncludedSchema" select="./@schemaLocation"/>
													<xsl:variable name="SchemaFile" select="document($IncludedSchema)"/>
																										<xsl:variable name="Schema" select="$SchemaFile/xs:schema/xs:group/@name"/>
													<xsl:variable name="SchemaName" select="$SchemaFile/xs:schema/xs:group/xs:sequence/xs:element/@name"/>
													<xsl:variable name="SNOMEDOIDAttributePresent" select="$SchemaFile/boolean(//attribute::*[contains(., '2.16.840.1.113883.2.1.3.2.4.15')])"/>
													<xsl:variable name="RequiredCodedSchemaValue" select="$SchemaFile/boolean((//attribute::*[contains(., '2.16.840.1.113883.2.1.3.2.4.15')])/../@use='required')"/>
													<schema>
														<xsl:attribute name="Schema"><xsl:value-of select="$Schema"/></xsl:attribute>
														<xsl:attribute name="SchemaName"><xsl:value-of select="$SchemaName"/></xsl:attribute>
														<xsl:attribute name="snomedOID"><xsl:value-of select="$SNOMEDOIDAttributePresent"/></xsl:attribute>
														<xsl:attribute name="snomedOIDrequired"><xsl:value-of select="$RequiredCodedSchemaValue"/></xsl:attribute>
													</schema>
												</xsl:for-each>
											</constraintTemplate>
										</xsl:for-each>
									</templateItem>
									<!--</xsl:for-each>-->
								</template>
							</xsl:for-each>
						</constraintTemplate>
						<xsl:text>
</xsl:text>

	
		</SectionTemplateChoice>	
	</xsl:when>
</xsl:choose> 	
		







				<ClassificationSection>
					<!-- ClassificationSection CodedEntry START-->
					<xsl:choose>
						<xsl:when test="string-length($CodedEntry)!=0">
							<xsl:variable name="CodedEntrySchemaFile" select="document($CodedEntryRef)"/>
							<xsl:variable name="codedentryschemaname" select="$CodedEntrySchemaFile/xs:schema/xs:group/@name"/>
							<CodedEntry>
								<constraintTemplate>
									<xsl:attribute name="includedTemplate"><xsl:value-of select="$CodedEntry"/></xsl:attribute>
									<xsl:attribute name="TemplateSchemaName"><xsl:value-of select="$codedentryschemaname"/></xsl:attribute>
									<xsl:for-each select="$CodedEntrySchemaFile/xs:schema/xs:group/xs:choice/xs:group">
										<xsl:variable name="codedentryschemaref" select="./@ref"/>
										<xsl:variable name="SchemaFileName" select="concat('../Schemas/',$codedentryschemaref,'.xsd')"/>
										<xsl:variable name="SchemaFile" select="document($SchemaFileName)"/>
										<xsl:for-each select="$SchemaFile">
<xsl:variable name="Sectionschemaname" select="$SchemaFile//xs:schema/xs:group/@name"/>											
											<xsl:variable name="codedentryschemaname" select="$SchemaFile/xs:schema/xs:group/xs:sequence/xs:element/@name"/>
											<xsl:variable name="SNOMEDOIDAttributePresent" select="$SchemaFile/boolean(//attribute::*[contains(., '2.16.840.1.113883.2.1.3.2.4.15')])"/>
											<xsl:variable name="RequiredCodedSchemaValue" select="$SchemaFile/boolean((//attribute::*[contains(., '2.16.840.1.113883.2.1.3.2.4.15')])/../@use='required')"/>
											<xsl:for-each select="$codedentryschemaref">
												<schema>
	<xsl:attribute name="Schema"><xsl:value-of select="$Sectionschemaname"/></xsl:attribute>													
													<xsl:attribute name="SchemaName"><xsl:value-of select="$codedentryschemaname"/></xsl:attribute>
													<xsl:attribute name="snomedOID"><xsl:value-of select="$SNOMEDOIDAttributePresent"/></xsl:attribute>
													<xsl:attribute name="snomedOIDrequired"><xsl:value-of select="$RequiredCodedSchemaValue"/></xsl:attribute>
												</schema>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</constraintTemplate>
							</CodedEntry>
						</xsl:when>
					</xsl:choose>
					<!-- ClassificationSection CodedEntry END-->
					<!--



-->
					<!-- CLASSIFICATION SECTION CHOICE START -->
					<SectionChoice>
						<constraintTemplate>
							<xsl:attribute name="includedTemplate"><xsl:value-of select="$SectionChoice"/></xsl:attribute>
							<xsl:attribute name="TemplateSchemaName"><xsl:value-of select="$SectionChoice"/></xsl:attribute>
							<xsl:for-each select="$SectionChoiceConstraint/xs:schema/xs:group/xs:choice/xs:group">
								<xsl:variable name="ref" select="./@ref"/>
								<xsl:variable name="SectionSchema" select="concat('../Schemas/',$ref,'.xsd')"/>
								<xsl:variable name="SectionSchemaFile" select="document($SectionSchema)"/>
								<xsl:variable name="Sectionschemaname" select="$SectionSchemaFile/xs:schema/xs:group/@name"/>
								<xsl:variable name="CodedValue" select="$SectionSchemaFile/boolean(//*[contains(@name,$ref)]//*//*[@type='CV'][@minOccurs='1'][@maxOccurs='1']/@name)"/>
								<xsl:variable name="displayName" select="$itk_profile_reference/ProfileConfigs/ProfileConfig/configGroup[@type='Templates']/configItem[@code=$ref]/@displayName"/>
								<sectionitem>
								
									<xsl:attribute name="sectionName"><xsl:value-of select="$ref"/></xsl:attribute>
									<xsl:attribute name="codedValue"><xsl:value-of select="$CodedValue"/></xsl:attribute>
									<xsl:attribute name="displayName"><xsl:value-of select="$displayName"/></xsl:attribute>
								</sectionitem>
								<template>
									<!--							<xsl:for-each select="$SectionChoiceConstraint/xs:schema/xs:group/xs:choice/xs:group">
-->
									<xsl:variable name="ref" select="./@ref"/>
									<xsl:variable name="SectionSchema" select="concat('../Schemas/',$ref,'.xsd')"/>
									<xsl:variable name="SectionSchemaFile" select="document($SectionSchema)"/>
									<xsl:variable name="SectionSchemaName" select="$SectionSchemaFile/xs:schema/xs:group//xs:element/@name"/>
									<templateItem>
										<xsl:attribute name="SectionSchema"><xsl:value-of select="$ref"/></xsl:attribute>
										<xsl:attribute name="SectionSchemaName"><xsl:value-of select="$SectionSchemaName"/></xsl:attribute>
										<xsl:for-each select="$SectionSchemaFile/xs:schema/xs:include[contains(@schemaLocation, '/TemplateSchemas/')]">
											<xsl:variable name="IncludedTemplate" select="./@schemaLocation"/>
											<xsl:variable name="TemplateSchemaFile" select="document($IncludedTemplate)"/>
											<xsl:variable name="TemplateSchemaName" select="$TemplateSchemaFile/xs:schema//@name"/>
											<constraintTemplate>
												<xsl:attribute name="includedTemplate"><xsl:value-of select="$IncludedTemplate"/></xsl:attribute>
												<xsl:attribute name="TemplateSchemaName"><xsl:value-of select="$TemplateSchemaName"/></xsl:attribute>
												<xsl:for-each select="$TemplateSchemaFile/xs:schema/xs:include[contains(@schemaLocation, '/Schemas/')]">
													<xsl:variable name="IncludedSchema" select="./@schemaLocation"/>
													<xsl:variable name="SchemaFile" select="document($IncludedSchema)"/>
																										<xsl:variable name="Schema" select="$SchemaFile/xs:schema/xs:group/@name"/>
													<xsl:variable name="SchemaName" select="$SchemaFile/xs:schema/xs:group/xs:sequence/xs:element/@name"/>
													<xsl:variable name="SNOMEDOIDAttributePresent" select="$SchemaFile/boolean(//attribute::*[contains(., '2.16.840.1.113883.2.1.3.2.4.15')])"/>
													<xsl:variable name="RequiredCodedSchemaValue" select="$SchemaFile/boolean((//attribute::*[contains(., '2.16.840.1.113883.2.1.3.2.4.15')])/../@use='required')"/>
													<schema>
														<xsl:attribute name="Schema"><xsl:value-of select="$Schema"/></xsl:attribute>
														<xsl:attribute name="SchemaName"><xsl:value-of select="$SchemaName"/></xsl:attribute>
														<xsl:attribute name="snomedOID"><xsl:value-of select="$SNOMEDOIDAttributePresent"/></xsl:attribute>
														<xsl:attribute name="snomedOIDrequired"><xsl:value-of select="$RequiredCodedSchemaValue"/></xsl:attribute>
													</schema>
												</xsl:for-each>
											</constraintTemplate>
										</xsl:for-each>
									</templateItem>
									<!--</xsl:for-each>-->
								</template>
							</xsl:for-each>
						</constraintTemplate>
						<xsl:text>
</xsl:text>
					</SectionChoice>
					<!-- CLASSIFICATION SECTION CHOICE END -->
					
</ClassificationSection>					
</BodyChoice>



				<Vocabularies>
						<xsl:for-each select="$itk_profile_reference/ProfileConfigs/ProfileConfig/configGroup[@type='Vocabularies']/configItem">
							<xsl:variable name="codeSystem" select="./@codeSystem"/>
							<xsl:variable name="codeSystemName" select="./@codeSystemName"/>
							<xsl:variable name="SNOMEDOIDAttributePresent" select="boolean(.[@codeSystem='2.16.840.1.113883.2.1.3.2.4.15'])"/>
							<Vocabulary>
								<xsl:attribute name="codeSystem"><xsl:value-of select="$codeSystem"/></xsl:attribute>
								<xsl:attribute name="codeSystemName"><xsl:value-of select="$codeSystemName"/></xsl:attribute>
								<xsl:attribute name="snomedOID"><xsl:value-of select="$SNOMEDOIDAttributePresent"/></xsl:attribute>
							</Vocabulary>
						</xsl:for-each>
					</Vocabularies>

			</dms>
		</CDAReference>
	</xsl:template>
</xsl:stylesheet>
