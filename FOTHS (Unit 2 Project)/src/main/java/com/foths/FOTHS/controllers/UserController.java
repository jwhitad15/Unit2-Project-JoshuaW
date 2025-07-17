package com.foths.FOTHS.controllers;

import com.foths.FOTHS.models.User;
import com.foths.FOTHS.models.User;
import com.foths.FOTHS.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    UserRepository userRepository;

    // GET the full list of users
    // Endpoint is http://localhost:8080/users
    @GetMapping("")
    public ResponseEntity<?> getUsers() {
        List<User> allUsers = UserRepository.findAll();
        return new ResponseEntity<>(allUsers, HttpStatus.OK); // 200
    }

    // GET a single user using its id
    // Corresponds to http://localhost:8080/activities/details/3 (for example)
    @GetMapping(value="/details/{userId}", produces= MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getUserById(@PathVariable(value="userId") int userId) {
        User currentUser = userRepository.findById(userId).orElse(null);
        if (currentUser != null) {
            return new ResponseEntity<>(currentUser, HttpStatus.OK); // 200
        } else {
            String response = "User with ID of " + userId + " not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    // POST a new user
    // Endpoint http://localhost:8080/activities/add?type=login&timestamp=18:47:03 (for example)
    @PostMapping("/add")
    public ResponseEntity<?> createNewUser(@RequestParam(value="firstName") String firstName, @RequestParam(value="lastName") String lastName, @RequestParam(value="email") String email, @RequestParam(value="username") String username, @RequestParam(value="password") String password) {
        User newUser = new User(firstName, lastName, email, username, password);
        userRepository.save(newUser);
        return new ResponseEntity<>(newUser, HttpStatus.CREATED); // 201
    }

    // DELETE an existing user
    // Corresponds to http://localhost:8080/activities/delete/6 (for example)
    @DeleteMapping(value="/delete/{userId}", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> deleteUser(@PathVariable(value="userId") int userId) {
        User currentUser = userRepository.findById(userId).orElse(null);
        if (currentUser != null) {
            userRepository.deleteById(userId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT); // 204
        } else {
            String response = "User with ID of " + userId + " not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }
}
