// java
package com.foths.application.security;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthenticationRequest {
    @NotBlank
    private String username;
    @NotBlank
    private String password;

    public Object getEmail() {
        return null;
    }
}

//public class AuthenticationRequest {
//    private String email;
//    private String password;
//
//    public Object getUsername() {
//    }
//}
