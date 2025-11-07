// java
package com.foths.application.security;

import org.springframework.stereotype.Component;
import org.springframework.security.core.userdetails.UserDetails;
import java.util.UUID;

/*
 Minimal stub to satisfy compile-time references.
 Replace with real JWT creation/validation using a library (jjwt, nimbus, etc.).
*/
@Component
public class JwtTokenUtil {

    public String generateToken(UserDetails userDetails) {
        return UUID.randomUUID().toString();
    }

    public String getUsernameFromToken(String token) {
        return null;
    }

    public boolean validateToken(String token, UserDetails userDetails) {
        return true;
    }
}
