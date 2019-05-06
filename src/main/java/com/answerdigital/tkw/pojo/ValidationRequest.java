package com.answerdigital.tkw.pojo;

import java.io.File;
import java.time.Instant;

public class ValidationRequest {
	
	private String xmlToValidate, preValidationDirectory, validationReportDirectory, 
		validationExecutableArgs, fileName;
	private File xmlHeader, xmlFooter;
	
	public ValidationRequest(String xmlToValidate, String preValidationDirectory, String validationReportDirectory,
			String validationExecutableArgs, File xmlHeader, File xmlFooter) {
		super();
		this.xmlToValidate = xmlToValidate;
		this.preValidationDirectory = preValidationDirectory;
		this.validationReportDirectory = validationReportDirectory;
		this.validationExecutableArgs = validationExecutableArgs;
		this.xmlHeader = xmlHeader;
		this.xmlFooter = xmlFooter;
		this.fileName = "to_be_validated_" + Instant.now().toEpochMilli() + ".xml";
	}

	public String getXmlToValidate() {
		return xmlToValidate;
	}
	
	public void setXmlToValidate(String xmlToValidate) {
		this.xmlToValidate = xmlToValidate;
	}

	public String getPreValidationDirectory() {
		return preValidationDirectory;
	}

	public String getValidationReportDirectory() {
		return validationReportDirectory;
	}

	public String getValidationExecutableArgs() {
		return validationExecutableArgs;
	}

	public File getXmlHeader() {
		return xmlHeader;
	}

	public File getXmlFooter() {
		return xmlFooter;
	}

	public String getFileName() {
		return this.fileName;
	}
}
