<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:itk="urn:nhs-itk:ns:201005">

	<xsl:output method="xml" indent="yes" omit-xml-declaration = "yes"/>
    <xsl:template match="/">
    
	<xsl:variable name="soap_action" select="/itk:DistributionEnvelope/itk:header/@service"/>
    
	<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:itk="urn:nhs-itk:ns:201005">
	<soap:Header>
		<wsa:MessageID>__MESSAGEID__</wsa:MessageID>
		<wsa:Action>
		<xsl:value-of select="$soap_action"/>
		</wsa:Action>
		<wsa:To>__SENDTO__</wsa:To>
		<wsa:From>
			<wsa:Address>http://localhost:4000</wsa:Address>
		</wsa:From>
		<wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
			<wsu:Timestamp xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" wsu:Id="D6CD5232-14CF-11DF-9423-1F9A910D4703">
				<wsu:Created>__TIMESTAMP__</wsu:Created>
				<wsu:Expires>__EXPIRES__</wsu:Expires>
			</wsu:Timestamp>
			<wsse:UsernameToken>
				<wsse:Username>TKS Server test</wsse:Username>
			</wsse:UsernameToken>
		</wsse:Security>
	</soap:Header>
	<soap:Body>




					<xsl:for-each select="/*">
						<xsl:copy-of select="."/>
					</xsl:for-each>
	

</soap:Body>
</soap:Envelope>

</xsl:template>
</xsl:stylesheet>
