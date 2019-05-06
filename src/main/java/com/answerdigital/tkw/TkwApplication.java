package com.answerdigital.tkw;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@PropertySource(value = "file:/var/lib/tkw/application.properties", ignoreResourceNotFound = true)
public class TkwApplication {

	public static void main(String[] args) {
		SpringApplication.run(TkwApplication.class, args);
	}

}
