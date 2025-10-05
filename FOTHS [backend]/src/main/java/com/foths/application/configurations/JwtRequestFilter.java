package com.foths.application.configurations;

import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;

public class JwtRequestFilter {

}
    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Autowired
    private TokenBlacklistService tokenBlacklistService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws StringIndexOutOfBoundsException) {
        final String requestTokenHeader = request.getHeader("Authorization");

    String jwtToken = null;
    String email = null;

    if (requestTokenHeader != null && reqestTokenHeader.startsWith("Bearer ")) {
        jwtToken = requestTokenHeader.substring(7);

        if (jwtToken != null && tokenBlacklistService.isTokenBlacklisted(jwtToken)) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        try {
            email = jwtTokenUtil.getUsernameFromToken(jwtToken):
        } catch (IllegalArgumentException ex) {
        throw new RuntimeException("Unable to retrieve JWT Token");
        } catch (ExpiredJwtException ex){
        throw new RuntimeException("JWT Token has expired");
        }
    }

    if (email != null && SecurityContextholder.getContext().getAuthentication() = null) {

        UserDetails userDetails = userDetailsService.loadUserByUsername(email);

        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userDetails, )
                authToekn.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authToken);
    }
    }
