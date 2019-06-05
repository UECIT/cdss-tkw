package com.answerdigital.tkw.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.answerdigital.tkw.pojo.ValidationRequest;
import com.answerdigital.tkw.service.ValidationService;

@Controller
public class ValidationController {

	@Value("${prevalidation.directory.111.v2}")
	private String preValidationDirectory111v2;
	@Value("${validation.report.directory.111.v2}")
	private String validationReportDirectory111v2;
	@Value("${validation.executable.args.111.v2}")
	private String validationArgs111v2;
	
	@Value("${prevalidation.directory.111.v3}")
	private String preValidationDirectory111v3;
	@Value("${validation.report.directory.111.v3}")
	private String validationReportDirectory111v3;
	@Value("${validation.executable.args.111.v3}")
	private String validationArgs111v3;
	
	@Value("${prevalidation.directory.ambulance.v2}")
	private String preValidationDirectoryAmbulancev2;
	@Value("${validation.report.directory.ambulance.v2}")
	private String validationReportDirectoryAmbulancev2;
	@Value("${validation.executable.args.ambulance.v2}")
	private String validationArgsAmbulancev2;
	
	@Value("${prevalidation.directory.ambulance.v3}")
	private String preValidationDirectoryAmbulancev3;
	@Value("${validation.report.directory.ambulance.v3}")
	private String validationReportDirectoryAmbulancev3;
	@Value("${validation.executable.args.ambulance.v3}")
	private String validationArgsAmbulancev3;
	
	private ValidationService validationService;
	
	@Autowired
	ValidationController(ValidationService validatorService) {
		this.validationService = validatorService;
	}

	@PostMapping("/validate/111v2")
    public @ResponseBody String validate111XmlV2(@RequestBody String xmlToValidate) throws IOException, InterruptedException {

        File xmlHeader111 = new ClassPathResource("templates/xml_header_111.xml").getFile();
        File xmlFooter111 = new ClassPathResource("templates/xml_footer_111.xml").getFile();
		return validationService.validateXml(new ValidationRequest(
				URLDecoder.decode(xmlToValidate, StandardCharsets.UTF_8.toString()), 
				preValidationDirectory111v2,
				validationReportDirectory111v2,
				validationArgs111v2,
				xmlHeader111,
				xmlFooter111));
	}
	
	@PostMapping("/validate/111v3")
    public @ResponseBody String validate111XmlV3(@RequestBody String xmlToValidate) throws IOException, InterruptedException {

        File xmlHeader111 = new ClassPathResource("templates/xml_header_111.xml").getFile();
        File xmlFooter111 = new ClassPathResource("templates/xml_footer_111.xml").getFile();
		return validationService.validateXml(new ValidationRequest(
				URLDecoder.decode(xmlToValidate, StandardCharsets.UTF_8.toString()), 
				preValidationDirectory111v3,
				validationReportDirectory111v3,
				validationArgs111v3,
				xmlHeader111,
				xmlFooter111));
	}
	
	@PostMapping("/validate/ambulancev2")
    public @ResponseBody String validateAmbulanceXmlV2(@RequestBody String xmlToValidate) throws IOException, InterruptedException {

        File xmlHeader111 = new ClassPathResource("templates/xml_header_111.xml").getFile();
        File xmlFooter111 = new ClassPathResource("templates/xml_footer_111.xml").getFile();
		return validationService.validateXml(new ValidationRequest(
				URLDecoder.decode(xmlToValidate, StandardCharsets.UTF_8.toString()), 
				preValidationDirectoryAmbulancev2,
				validationReportDirectoryAmbulancev2,
				validationArgsAmbulancev2,
				xmlHeader111,
				xmlFooter111));
	}

	@PostMapping("/validate/ambulancev3")
    public @ResponseBody String validateAmbulanceXmlV3(@RequestBody String xmlToValidate) throws IOException, InterruptedException {

        File xmlHeaderAmbulance = new ClassPathResource("templates/xml_header_ambulance.xml").getFile();
        File xmlFooterAmbulance = new ClassPathResource("templates/xml_footer_ambulance.xml").getFile();
		return validationService.validateXml(new ValidationRequest(
				URLDecoder.decode(xmlToValidate, StandardCharsets.UTF_8.toString()), 
				preValidationDirectoryAmbulancev3,
				validationReportDirectoryAmbulancev3,
				validationArgsAmbulancev3,
				xmlHeaderAmbulance,
				xmlFooterAmbulance));
	}
}
