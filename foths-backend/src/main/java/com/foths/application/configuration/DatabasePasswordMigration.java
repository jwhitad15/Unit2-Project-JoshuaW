// java
package com.foths.application.configuration;

import com.foths.application.models.User;
import com.foths.application.repositories.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.security.crypto.password.PasswordEncoder;

@Component
public class DatabasePasswordMigration implements CommandLineRunner {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public DatabasePasswordMigration(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) throws Exception {
        // Encode passwords that are not already BCrypt (simple heuristic)
        for (User user : userRepository.findAll()) {
            String pwd = user.getPassword();
            if (pwd == null) continue;
            // BCrypt hashes start with $2a$, $2b$ or $2y$
            if (!(pwd.startsWith("$2a$") || pwd.startsWith("$2b$") || pwd.startsWith("$2y$"))) {
                String encoded = passwordEncoder.encode(pwd);
                user.setPassword(encoded);
                userRepository.save(user);
                System.out.println("Re-encoded password for user: " + user.getUsername());
            }
        }
    }
}
