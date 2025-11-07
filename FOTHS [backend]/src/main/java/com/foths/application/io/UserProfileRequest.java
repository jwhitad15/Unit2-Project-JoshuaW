package com.foths.application.io;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserProfileRequest {

    @NotBlank(message = "INVALID: Name is required")
    @Size(min = 3, message = "INVALID: Name length should be three characters or more")
    private String name;

    @NotNull(message = "INVALID: Email is required")
    @Email(message = "Please provide a valid email address")
    private String email;

    @NotNull(message = "Password is required")
    @Size(min = 5, message = "INVALID: Password length should be eight characters or more")
    private String password;
}
