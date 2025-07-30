// User repository interface for managing User entities in the database.
// It extends JpaRepository to provide CRUD operations and custom query methods for User entities.
// The UserRepository interface defines methods to find users by various attributes such as first name, last name, email, username, and password.
// It also includes methods to find users by combinations of these attributes, such as username and password, or first name and last name.


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
