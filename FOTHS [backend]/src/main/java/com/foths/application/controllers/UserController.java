//Controller for managing user-related operations

// It provides endpoints to create, read, update, and delete users in the application.
// The controller uses the UserRepository to interact with the database and perform CRUD operations on User entities
// It also handles HTTP requests and responses, returning appropriate status codes and messages based on the operation
// performed.
// The UserController class is annotated with @RestController to indicate that it is a Spring MVC controller
// and @RequestMapping to specify the base URL for all endpoints in this controller.

package com.foths.application.controllers;

import com.foths.application.models.User;
import com.foths.application.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("")
    public ResponseEntity<?> getUsers() {
        List<User> allUsers = userRepository.findAll();
        return ResponseEntity.ok(allUsers);
//        return new ResponseEntity<>(allUsers, HttpStatus.OK); // 200
    }

    @GetMapping(value="/{userId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getUserById(@PathVariable(value="userId") int userId) {
        User currentUser = (User) userRepository.findById(userId).orElse(null);
        if (currentUser != null) {
            return new ResponseEntity<>(currentUser, HttpStatus.OK); // 200
        } else {
            String response = STR."User with ID of \{userId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    @PostMapping("/create")
    public ResponseEntity<?> createNewUser(@RequestBody User user) {
        userRepository.save(user);
        return new ResponseEntity<>(user, HttpStatus.CREATED); // 201
    }

    @PutMapping("/update/{userId}")
    public ResponseEntity<?> updateUser(@PathVariable(value="userId") int userId, @RequestBody User user) {
        User currentUser = (User) userRepository.findById(userId).orElse(null);
        if (currentUser != null) {
            currentUser.setFirstName(user.getFirstName());
            currentUser.setLastName(user.getLastName());
            currentUser.setEmail(user.getEmail());
            currentUser.setUsername(user.getUsername());
            currentUser.setPassword(user.getPassword());

            userRepository.save(currentUser);
            return new ResponseEntity<>(currentUser, HttpStatus.OK); // 200
        } else {
            String response = STR."User with ID of \{userId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    @DeleteMapping(value="/delete/{userId}", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> deleteById(@PathVariable(value="userId") int userId) {
        User currentUser = (User) userRepository.findById(userId).orElse(null);
        if (currentUser != null) {
            userRepository.deleteById(userId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT); // 204
        } else {
            String response = STR."User with ID of \{userId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }
}
