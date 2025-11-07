// java
package com.foths.application.security;

import com.foths.application.models.dto.UserProfileDTO;
import com.foths.application.service.UserProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/*
 Minimal stub. Implement actual lookup (from DB) and return a proper UserDetails.
*/
@RequiredArgsConstructor
@Service
public class CustomUserDetailService implements UserDetailsService {

    private final UserProfileService userProfileService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserProfileDTO dto = userProfileService.findByEmail(username);
        if (dto == null) {
            throw new UsernameNotFoundException("User not found: " + username);
        }

        // dto.getPassword() must be the encoded password stored in DB
        return User.builder()
                .username(dto.getEmail())
                .password(dto.getPassword())
                .roles("USER") // adjust roles/authorities as needed
                .build();
    }
}
