package com.foths.application.models.dto;

import com.foths.application.models.Roles;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserProfileDTO {

    private Long userId;
    private String username;
    private String password;
    private String email;
    private String name;
    private boolean accountNonLocked;
    private boolean accountNonExpired;
    private boolean credentialsNonExpired;
    private boolean enabled;
    private LocalDate credentialsExpiryDate;
    private LocalDate accountExpiryDate;
    private String twoFactorSecret;
    private boolean isTwoFactorEnabled;
    private String signUpMethod;
    private Roles roles;
    private LocalDate createdDate;
    private LocalDate updatedDate;
    private Timestamp createdAt;
    private Timestamp updatedAt;


}
