package com.arexe.bgames.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${spring.mvc.view.prefix}")
    private String prefix;
    @Value("${spring.mvc.view.suffix}")
    private String suffix;

    @Bean
    public BCryptPasswordEncoder pwdEncrypt() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        internalResourceViewResolver.setViewClass(JstlView.class);
        internalResourceViewResolver.setPrefix(prefix);
        internalResourceViewResolver.setSuffix(suffix);
        registry.viewResolver(internalResourceViewResolver);
    }

}
