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

	@Value("${prevalidation.directory.111}")
	private String preValidationDirectory111;

	@Value("${validation.report.directory.111}")
	private String validationReportDirectory111;
	
	@Value("${validation.executable.args.111}")
	private String validationArgs111;
	
	private ValidationService validationService;
	
	@Autowired
	ValidationController(ValidationService validatorService) {
		this.validationService = validatorService;
	}

	@PostMapping("/validate/111")
    public @ResponseBody String validate111Xml(@RequestBody String xmlToValidate) throws IOException, InterruptedException {

        File xmlHeader111 = new ClassPathResource("templates/xml_header_111.xml").getFile();
        File xmlFooter111 = new ClassPathResource("templates/xml_footer_111.xml").getFile();
		return validationService.validateXml(new ValidationRequest(
				URLDecoder.decode(xmlToValidate, StandardCharsets.UTF_8.toString()), 
				preValidationDirectory111,
				validationReportDirectory111,
				validationArgs111,
				xmlHeader111,
				xmlFooter111));
	}

	@PostMapping("/validate/ambulance")
    public @ResponseBody String validateAmbulanceXml(@RequestBody String xmlToValidate) throws IOException, InterruptedException {

        File xmlHeaderAmbulance = new ClassPathResource("templates/xml_header_ambulance.xml").getFile();
        File xmlFooterAmbulance = new ClassPathResource("templates/xml_footer_ambulance.xml").getFile();
		return validationService.validateXml(new ValidationRequest(
				URLDecoder.decode(xmlToValidate, StandardCharsets.UTF_8.toString()), 
				preValidationDirectory111,
				validationReportDirectory111,
				validationArgs111,
				xmlHeaderAmbulance,
				xmlFooterAmbulance));
	}
}
