package com.foths.application.security.services;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.foths.application.models.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serial;
import java.util.Collection;
import java.util.List;

public class UserDetailsImplementation implements UserDetails{

    @Serial
    private static final long serialVersionUID = 1L;
    private final String username;
    private final String email;
    private Long id;

    @JsonIgnore
    private String password;

    private final boolean is2FAEnabled;

    private final Collection<? extends GrantedAuthority> authorities;

    public UserDetailsImplementation(Long id, String username, String email, String password, boolean is2FAEnabled,
                                     Collection<? extends GrantedAuthority> authorities) {


        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.is2FAEnabled = is2FAEnabled;
        this.authorities = authorities;
    }

    public static UserDetailsImplementation build(User user) {
        Long id = Long.valueOf(user.getId()); // convert int/Integer -> Long

        Collection<GrantedAuthority> authorities;
        Object rolesObj = user.getRoles();


        if (rolesObj instanceof java.util.Collection) {
            authorities = ((java.util.Collection<?>) rolesObj).stream()
                    .map(r -> {
                        if (r instanceof Enum) return new SimpleGrantedAuthority(((Enum<?>) r).name());
                        if (r instanceof String) return new SimpleGrantedAuthority((String) r);
                        try {
                            var m = r.getClass().getMethod("getName");
                            return new SimpleGrantedAuthority(String.valueOf(m.invoke(r)));
                        } catch (Exception e) {
                            return new SimpleGrantedAuthority(r.toString());
                        }
                    })
                    .collect(java.util.stream.Collectors.toList());
        } else {
            String roleName;
            if (rolesObj instanceof Enum) roleName = ((Enum<?>) rolesObj).name();
            else if (rolesObj instanceof String) roleName = (String) rolesObj;
            else {
                try {
                    var m = rolesObj.getClass().getMethod("getName");
                    roleName = String.valueOf(m.invoke(rolesObj));
                } catch (Exception e) {
                    roleName = String.valueOf(rolesObj);
                }
            }
            authorities = List.of(new SimpleGrantedAuthority(roleName));
        }

        return new UserDetailsImplementation(
                id,
                user.getUsername(),
                user.getEmail(),
                user.getPassword(),
                user.isTwoFactorEnabled(),
                authorities
        );
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    public Long getId() {
        return id;
    }

    @Override
    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    };

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public boolean isTwoFactorEnabled() {
        return is2FAEnabled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        UserDetailsImplementation user = (UserDetailsImplementation) o;
        return id.equals(user.id);
    }
}

