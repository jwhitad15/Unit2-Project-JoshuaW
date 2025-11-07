package com.foths.application.controllers;

import com.foths.application.io.UserProfileRequest;
import com.foths.application.io.UserProfileResponse;
import com.foths.application.models.dto.UserProfileDTO;
import com.foths.application.security.*;
//import jakarta.servlet.http.HttpServlet;
import com.foths.application.service.UserProfileService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

//import static jdk.internal.org.jline.utils.Colors.s;

@RequiredArgsConstructor
@RestController
@RequestMapping("api/user")
public class AuthorizationController {

    private final ModelMapper modelMapper;
    private final UserProfileService userProfileService;
    private final AuthenticationManager authenticationManager;
    private final JwtTokenUtil jwtTokenUtil;
    private final CustomUserDetailService userDetailService;
    private final TokenBlacklistService tokenBlacklistService;

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/register")
    public UserProfileResponse createUserProfile(@Valid @RequestBody UserProfileRequest userProfileRequest) {
        UserProfileDTO userProfileDTO = mapToUserProfileDTO(userProfileRequest);
        userProfileDTO = userProfileService.createUserProfile(userProfileDTO);
        return mapToUserProfileResponse(userProfileDTO);
    }

    @PostMapping("/login")
    public AuthenticationResponse authenticateUserProfile(@RequestBody AuthenticationRequest authenticationRequest) throws Exception {
        authenticate(authenticationRequest);
        final UserDetails userDetails = userDetailService.loadUserByUsername(authenticationRequest.getEmail());
        final String token = jwtTokenUtil.generateToken(userDetails);
        return new AuthenticationResponse(token, authenticationRequest.getEmail());
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @PostMapping("/logout")
    public void logOut(HttpServletRequest request) {
        String jwtToken = extractJwtTokenFromRequest(request);
        if (jwtToken != null) {
            tokenBlacklistService.addTokenToBlacklist(jwtToken);
        }
    }

    private String extractJwtTokenFromRequest(HttpServletRequest request) {
        String bearerToken = request.getHeader("Authorization");
        if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }

    private void authenticate(AuthenticationRequest authenticationRequest) throws Exception {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            authenticationRequest.getEmail(),
                            authenticationRequest.getPassword()
                    )
            );
        } catch (DisabledException ex) {
            throw new Exception("Profile disabled");
        }
    }

    private UserProfileDTO mapToUserProfileDTO(UserProfileRequest userProfileRequest) {
        return modelMapper.map(userProfileRequest, UserProfileDTO.class);
    }

    private UserProfileResponse mapToUserProfileResponse(UserProfileDTO userProfileDTO) {
        return modelMapper.map(userProfileDTO, UserProfileResponse.class);
    }
}
