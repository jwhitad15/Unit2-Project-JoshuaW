package com.foths.application.repositories;

import com.foths.application.models.AppRoles;
import com.foths.application.models.Roles;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RolesRepository extends JpaRepository<Roles, Long> {
    Optional<Roles> findByRoleName(AppRoles roleName);
}
