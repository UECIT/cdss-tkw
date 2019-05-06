<?xml version="1.0"?>

<!-- $Id: SO_VMISRJ.xslt 557 2016-03-07 13:58:11Z sfarrow $ -->
<!-- SO_VIMSRJ soap version mismatch -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  version="1.0">

	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

	<!-- match all atts all nodes -->
	<xsl:template match="@*|node()">
	  <xsl:copy copy-namespaces="no" >
		<xsl:apply-templates select="@*|node()"/>
	  </xsl:copy>
	</xsl:template>

	<xsl:template match="oldsoap:*" xmlns:oldsoap="http://schemas.xmlsoap.org/soap/envelope/">
	  <xsl:element name="{name()}" namespace="www.w3.org/2003/05/soap-envelope">
		  <xsl:comment>soap namespace changed from http://schemas.xmlsoap.org/soap/envelope/ to www.w3.org/2003/05/soap-envelope by TKWAutotestManager </xsl:comment>
		<xsl:copy-of copy-namespaces="no" select="@*"/>
		<xsl:apply-templates/>
	  </xsl:element>
	</xsl:template>

</xsl:stylesheet>
