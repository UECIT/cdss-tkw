package com.answerdigital.tkw.service;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.answerdigital.tkw.pojo.ValidationRequest;

@Service
public class ValidationService {

	@Value("${validation.executable.path}")
	private String validationExecutablePath;
	
	@Value("${validation.executable}")
	private String validationExecutable;
	
	public String validateXml(ValidationRequest validationRequest) throws IOException, InterruptedException {
		addHeaderAndFooterToXmlForValidation(validationRequest);
		storeFileInValidateDirectory(validationRequest);
		clearOutputDirectory(validationRequest);
		validateFile(validationRequest);
		return retrieveValidationReport(validationRequest);
	}
	
	private void clearOutputDirectory(ValidationRequest validationRequest) throws IOException {
		FileUtils.cleanDirectory(new File(validationRequest.getValidationReportDirectory()));
	}
	
	private void storeFileInValidateDirectory(ValidationRequest validationRequest) throws IOException {
		FileUtils.cleanDirectory(new File(validationRequest.getPreValidationDirectory()));
        Path path = Paths.get(validationRequest.getPreValidationDirectory() + validationRequest.getFileName());
        Files.write(path, validationRequest.getXmlToValidate().getBytes());
	}
	
	private String retrieveValidationReport(ValidationRequest validationRequest) throws IOException, InterruptedException {
		File dir = new File(validationRequest.getValidationReportDirectory());
		FileFilter fileFilter = new WildcardFileFilter("*.html");
		File[] files = dir.listFiles(fileFilter);
		int retries = 15;
		while ((files == null || files.length == 0) && retries-- > 0) {
			Thread.sleep(2000);
			files = dir.listFiles(fileFilter);
		} 
		Path path = Paths.get(validationRequest.getValidationReportDirectory() + files[0].getName());
		return new String(Files.readAllBytes(path));
	}
	
	private void validateFile(ValidationRequest validationRequest) throws IOException, InterruptedException {
		String executionCmd = "java -jar " + validationExecutablePath
				+ validationExecutable + " -validate "
				+ validationRequest.getValidationExecutableArgs();
		Runtime.getRuntime().exec(executionCmd);
	}
	
	private void addHeaderAndFooterToXmlForValidation(ValidationRequest validationRequest) throws IOException {
		String header = FileUtils.readFileToString(validationRequest.getXmlHeader(), Charset.defaultCharset());
		String footer = FileUtils.readFileToString(validationRequest.getXmlFooter(), Charset.defaultCharset());
		validationRequest.setXmlToValidate(header + validationRequest.getXmlToValidate() + footer);
	}
}
