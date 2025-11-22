package com.foths.application;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfigurations {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable) // if needed
                .authorizeHttpRequests(auth -> auth
//                        .requestMatchers("/login", "perform_login", "/error", "/register", "logout", "/css/**", "/js/**").permitAll() // public endpoints
                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/login")          // your custom login page
//                        .loginProcessingUrl("/perform_login")       // form action must post here
//                        .defaultSuccessUrl("/", true)
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
//                        .logoutSuccessUrl("/login?logout")
                        .permitAll()
                )
                .httpBasic(AbstractHttpConfigurer::disable);  // 🚫 disable Basic Auth

        return http.build();
    }
}

