package com.foths.application.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class ResetUserPasswords {

    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String hash = encoder.encode("LaunchCodeFounder!");
        System.out.println(hash);
    }
}