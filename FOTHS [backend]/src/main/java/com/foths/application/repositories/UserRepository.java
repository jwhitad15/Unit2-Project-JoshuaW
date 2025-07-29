package com.foths.application.repositories;

import com.foths.application.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository< User, Integer> {

    // Custom query methods can be defined here if needed
    List<User> findByFirstName(String firstName);
    List<User> findByLastName(String lastName);
    List<User> findByEmail(String email);
    List<User> findByUsername(String username);
    List<User> findByPassword(String password);
    User findByUsernameAndPassword(String username, String password);
    List<User> findByFirstNameAndLastName(String firstName, String lastName);
    List<User> findByEmailAndUsername(String email, String username);
    List<User> findByEmailAndPassword(String email, String password);
    List<User> findByFirstNameAndEmail(String firstName, String email);

}
