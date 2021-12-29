package com.arexe.bgames.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.info.BuildProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Value("${springdoc.contact.name}")
    private String name;
    @Value("${springdoc.contact.url}")
    private String url;
    @Value("${springdoc.contact.email}")
    private String email;

    @Bean
    public OpenAPI api(BuildProperties buildProperties) {
        return new OpenAPI().info(new Info()
                .title("Senet Board Games")
                .description("Explore and share your favourite Board Games")
                .version(buildProperties.getVersion())
                .contact(new Contact().name(name).url(url).email(email)));
    }

}
