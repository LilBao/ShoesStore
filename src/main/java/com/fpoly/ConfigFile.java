package com.fpoly;
import org.springframework.format.FormatterRegistry;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fpoly.Untils.UploadFile;

@Configuration
public class ConfigFile implements WebMvcConfigurer{
	@Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new UploadFile());
    }
}
