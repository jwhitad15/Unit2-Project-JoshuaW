package com.foths.application.controllers;

import com.foths.application.security.AuthenticationRequest;
import com.foths.application.security.JwtTokenUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.foths.application.io.UserProfileRequest;
import com.foths.application.io.UserProfileResponse;
import com.foths.application.models.dto.UserProfileDTO;
import com.foths.application.security.*;
import jakarta.servlet.http.HttpServlet;
import com.foths.application.service.UserProfileService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Map;

//import static jdk.internal.org.jline.utils.Colors.s;

@RequiredArgsConstructor
@RestController
@RequestMapping("api/user")
public class AuthorizationController {

    private final ModelMapper modelMapper;
    private final UserProfileService userProfileService;
    private final AuthenticationManager authenticationManager;
    private final JwtTokenUtil jwtTokenUtil;
    private final TokenBlacklistService tokenBlacklistService;
    private CustomUserDetailService customUserDetailService = null;

    @Autowired
    public AuthorizationController(ModelMapper modelMapper, UserProfileService userProfileService, AuthenticationManager authenticationManager, JwtTokenUtil jwtTokenUtil, CustomUserDetailService userDetailService, TokenBlacklistService tokenBlacklistService) {
        this.modelMapper = modelMapper;
        this.userProfileService = userProfileService;
        this.authenticationManager = authenticationManager;
        this.jwtTokenUtil = jwtTokenUtil;
        this.customUserDetailService = customUserDetailService;
        this.tokenBlacklistService = tokenBlacklistService;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/register")
    public UserProfileResponse createUserProfile(@Valid @RequestBody UserProfileRequest userProfileRequest) {
        UserProfileDTO userProfileDTO = mapToUserProfileDTO(userProfileRequest);
        userProfileDTO = userProfileService.createUserProfile(userProfileDTO);
        return mapToUserProfileResponse(userProfileDTO);
    }

//    @PostMapping("/login")
//    public AuthenticationResponse authenticateUserProfile(@RequestBody AuthenticationRequest authenticationRequest) throws Exception {
//        authenticate(authenticationRequest);
//        final UserDetails userDetails = userDetailService.loadUserByUsername(authenticationRequest.getEmail());
//        final String token = jwtTokenUtil.generateToken(userDetails);
//        return new AuthenticationResponse(token, authenticationRequest.getEmail());
//    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthenticationRequest req, HttpServletRequest servletRequest) {
        try {
            var authToken = new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword());
            var auth = authenticationManager.authenticate(authToken);
            SecurityContextHolder.getContext().setAuthentication(auth);
            servletRequest.getSession(true); // ensure session created if needed
            authenticationManager.authenticate(authToken);
            String token = jwtTokenUtil.generateToken(req.getUsername());
            // create session if needed
            servletRequest.getSession(true);
            return ResponseEntity.ok(Map.of("token", token));
        } catch (BadCredentialsException ex) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("error", "Invalid credentials"));
        } catch (AuthenticationException ex) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("error", "Authentication failed"));
        }
    }

//    public ResponseEntity<?> login(@RequestBody AuthenticationRequest req, HttpServletRequest request) {
//        try {
//            UsernamePasswordAuthenticationToken token =
//                    new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword());
//            Authentication auth = authenticationManager.authenticate(token);
//
//            SecurityContextHolder.getContext().setAuthentication(auth);
//            request.getSession(true); // ensure session created for session-based auth
//
//            return ResponseEntity.ok(Map.of("username", auth.getName()));
//        } catch (AuthenticationException ex) {
//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
//                    .body(Map.of("error", "Invalid credentials"));
//        }
//    }

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
