package com.foths.application.repositories;

import com.foths.application.models.UserProfile;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.swing.text.html.Option;
import java.util.Optional;

public interface UserProfileRepository extends JpaRepository<UserProfile, Integer> {

    Optional<UserProfile> findByEmail(String email);

    Boolean existsByEmail(String email);
}
