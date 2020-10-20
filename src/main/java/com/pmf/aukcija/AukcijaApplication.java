package com.pmf.aukcija;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(exclude =
{ SecurityAutoConfiguration.class })
@EntityScan("com.pmf.aukcija.model")
@ComponentScan("com.pmf.aukcija")
public class AukcijaApplication { 

	public static void main(String[] args) {
		SpringApplication.run(AukcijaApplication.class, args); 
	}

}
