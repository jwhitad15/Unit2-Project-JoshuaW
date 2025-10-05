package com.foths.application.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

public class CorsConfiguration {

    @Bean
    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    CorsConfiguration configuration = new CorsConfiguration();
    configuration.setAllowCredentials(true);
        configuration.setAllowedOriginPatterns(List.of("http://localhost:5173"))
                configuration.addAllowedMethod("*");
                configuration.addAllowedHeader("*");
                source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);

}
