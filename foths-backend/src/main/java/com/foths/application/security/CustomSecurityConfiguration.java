package com.foths.application.security;

import com.foths.application.models.AppRoles;
import com.foths.application.models.Roles;
import com.foths.application.models.User;
import com.foths.application.repositories.RolesRepository;
import com.foths.application.repositories.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true, jsr250Enabled = true)
public class CustomSecurityConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        // Use BCrypt for production; stronger and standard for Spring Security
        return new BCryptPasswordEncoder();
    }

    // Expose AuthenticationManager for the controller
    @Bean
    public AuthenticationManager authenticationManager(UserDetailsService userDetailsService, PasswordEncoder passwordEncoder) {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder);
        return new ProviderManager(List.of(provider));
    }

@Bean
public SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
    http
            .cors(Customizer.withDefaults()) // use the new Cors(Customizer) API instead of cors().and()
            .csrf(AbstractHttpConfigurer::disable)
            .sessionManagement(session ->
                    session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED))
            .authorizeHttpRequests(auth -> auth
//                    .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()
                    .requestMatchers("/", "/login", "/users/authenticate", "/scriptures", "/scriptures/**").permitAll()
                    .anyRequest().authenticated()
            )
            .formLogin(AbstractHttpConfigurer::disable)
            .logout(logout -> logout
                    .logoutUrl("/logout")
                    .invalidateHttpSession(true)
                    .deleteCookies("JSESSIONID")
            );

    return http.build();
}


@Bean
public CommandLineRunner initData(RolesRepository rolesRepository, UserRepository userRepository, PasswordEncoder passwordEncoder) {
    return args -> {
        // Initialize roles
        Roles userRole = rolesRepository.findByRoleName(AppRoles.ROLES_USER)
                .orElseGet(() -> rolesRepository.save(new Roles(AppRoles.ROLES_USER)));

        Roles adminRole = rolesRepository.findByRoleName(AppRoles.ROLES_ADMIN)
                .orElseGet(() -> rolesRepository.save(new Roles(AppRoles.ROLES_ADMIN)));

        // Initialize an admin user if not present
        if (!userRepository.existsByUsername("user1")) {
            User user1 = new User();
            user1.setUsername("user1");
            user1.setPassword(passwordEncoder.encode("password"));
            user1.setFirstName("User");
            user1.setLastName("One");
            user1.setEmail("user1@example.com");
            user1.setAccountNonLocked(false);
            user1.setAccountNonExpired(true);
            user1.setCredentialsNonExpired(true);
            user1.setEnabled(true);
            user1.setAccountExpiryDate(LocalDate.now().plusYears(1));
            user1.setCredentialsExpiryDate(LocalDate.now().plusYears(1));
            user1.setRoles(userRole);
            userRepository.save(user1);
        }

        if (!userRepository.existsByUsername("admin1")) {
            User admin = new User();
            admin.setUsername("admin1");
            admin.setPassword(passwordEncoder.encode("adminpassword"));
            admin.setFirstName("Admin");
            admin.setLastName("One");
            admin.setEmail("admin1@example.com");
            admin.setAccountNonLocked(true);
            admin.setAccountNonExpired(true);
            admin.setCredentialsNonExpired(true);
            admin.setEnabled(true);
            admin.setAccountExpiryDate(LocalDate.now().plusYears(1));
            admin.setCredentialsExpiryDate(LocalDate.now().plusYears(1));
            admin.setRoles(adminRole);
            userRepository.save(admin);
        }
    };
}

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowedOriginPatterns(List.of("https://foths-frontend-production.up.railway.app"));
        config.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        config.setAllowedHeaders(List.of("*"));
        config.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }
}

//Deployment URL Frontend: https://foths-frontend-production.up.railway.app
//Deployment URL Backend: https://foths-backend-production.up.railway.app