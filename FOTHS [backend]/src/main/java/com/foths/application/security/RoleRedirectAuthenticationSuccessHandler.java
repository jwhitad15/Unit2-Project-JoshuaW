// java
package com.foths.application.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import java.io.IOException;

public class RoleRedirectAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private final String adminTargetUrl;
    private final String userTargetUrl;

    public RoleRedirectAuthenticationSuccessHandler(String adminTargetUrl, String userTargetUrl) {
        this.adminTargetUrl = adminTargetUrl;
        this.userTargetUrl = userTargetUrl;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        String username = authentication.getName();
        String target = (username != null && username.toLowerCase().contains("admin_"))
                ? adminTargetUrl
                : userTargetUrl;
        response.sendRedirect(target);
    }
}
