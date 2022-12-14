package com.example.myshop.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class Config implements WebMvcConfigurer {
    @Value("${upload.path}")
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // ** - какой либо текст
        registry.addResourceHandler("/img/**", "/assets/**", "/css/**", "/js/**", "/resources/**", "/fonts/**")
                .addResourceLocations("file://" + uploadPath + "/", "classpath:/static/img/", "classpath:/static/assets/",
                        "classpath:/static/css/", "classpath:/static/fonts/", "classpath:/resources/",
                        "classpath:/static/js/");
    }
}
