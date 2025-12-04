package com.foths.application.security;

import com.foths.application.models.AppRoles;
import com.foths.application.models.Roles;
import com.foths.application.models.User;
import com.foths.application.repositories.RolesRepository;
import com.foths.application.repositories.UserRepository;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Role;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import javax.sql.DataSource;
import java.time.LocalDate;
import java.util.List;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class CustomSecurityConfiguration {

    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests((requests) ->
                requests
                        .requestMatchers("/login", "/register", "/greet").permitAll()
                        .requestMatchers("/public/**").permitAll() /* this permits all requests with "/public" in it*/
                        .requestMatchers("/admin/**").denyAll() /* this denies anything with the endpoint with "/admin" in it */
                        .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll() /* this allows all OPTIONS requests */
                        .anyRequest().authenticated());
//        http.formLogin(withDefaults());
        http.sessionManagement(session ->
                session.sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        http.httpBasic(withDefaults());
        return http.build();
    }

//    @Bean
//    public UserDetailsService userDetailService(DataSource dataSource, PasswordEncoder passwordEncoder) {
//        JdbcUserDetailsManager manager = new JdbcUserDetailsManager(dataSource);
//
//        manager.setUsersByUsernameQuery("select username, password, enabled from `user` where username = ?");
//        manager.setAuthoritiesByUsernameQuery("select username, authority from `authorities` where username = ?");
//        manager.setUserExistsSql("select username from `user` where username = ?");
//        manager.setCreateUserSql("insert into `user` (username, password, enabled) values (?,?,?)");
//
//        if (!manager.userExists("user")) {
//            manager.createUser(
//                    User.withUsername("user")
//                            .password(passwordEncoder.encode("password"))
//                            .roles("USER")
//                            .build()
//            );
//        }
//        if (!manager.userExists("admin")) {
//            manager.createUser(
//                    User.withUsername("admin")
//                            .password(passwordEncoder.encode("password"))
//                            .roles("ADMIN")
//                            .build()
//            );
//        }
//        return manager;
//    }

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
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration config = new CorsConfiguration();
        // use the exact origin your frontend runs on; do NOT use "*" when allowCredentials is true
        config.setAllowedOriginPatterns(List.of("http://localhost:5173"));
        config.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        config.setAllowedHeaders(List.of("*"));
        config.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }
}
