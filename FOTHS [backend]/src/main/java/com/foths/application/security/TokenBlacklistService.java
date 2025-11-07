// java
package com.foths.application.security;

import org.springframework.stereotype.Service;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
/*
 Minimal stub for token blacklist storage.
 Replace with persistence (DB/Redis) as needed.
*/
@Service
public class TokenBlacklistService {

    private final Set<String> blacklisted = ConcurrentHashMap.newKeySet();

    public boolean isTokenBlacklisted(String token) {
        return token != null && blacklisted.contains(token);
    }

    public void blacklistToken(String token) {
        if (token != null) blacklisted.add(token);
    }

    public void unblacklistToken(String token) {
        if (token != null) blacklisted.remove(token);
    }

    public void addTokenToBlacklist(String jwtToken) {
        if (jwtToken != null) {
            blacklisted.add(jwtToken);
        }
    }
}
