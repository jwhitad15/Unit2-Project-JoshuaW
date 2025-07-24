package com.foths.FOTHS.repositories;

import com.foths.FOTHS.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
}
