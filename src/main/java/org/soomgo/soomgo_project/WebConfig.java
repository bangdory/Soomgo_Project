package org.soomgo.soomgo_project;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 정적 리소스를 제공할 경로 설정
        registry.addResourceHandler("/img/**")
                .addResourceLocations("/resources/static/img/");
    }
}
