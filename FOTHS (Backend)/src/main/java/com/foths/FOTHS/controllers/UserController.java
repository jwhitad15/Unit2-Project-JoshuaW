package com.foths.FOTHS.controllers;

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
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // GET the full list of users - Endpoint is http://localhost:8080/users
    @GetMapping("")
    public ResponseEntity<?> getUsers() {
        List<User> allUsers = userRepository.findAll();
        return ResponseEntity.ok(allUsers);
//        return new ResponseEntity<>(allUsers, HttpStatus.OK); // 200
    }

    // GET a single user using its id - Corresponds to http://localhost:8080/activities/details/3 (for example)
    @GetMapping(value="/{userId}", produces= MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getUserById(@PathVariable(value="userId") int userId) {
        User currentUser = (User) userRepository.findById(userId).orElse(null);
        if (currentUser != null) {
            return new ResponseEntity<>(currentUser, HttpStatus.OK); // 200
        } else {
            String response = STR."User with ID of \{userId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    // POST a new user - Endpoint http://localhost:8080/users/create
    @PostMapping("/create")
    public ResponseEntity<?> createNewUser(@RequestBody User user) {
        userRepository.save(user);
        return new ResponseEntity<>(user, HttpStatus.CREATED); // 201
    }

    @PutMapping("/update/{userId}")
    public ResponseEntity<?> updateUser(@PathVariable(value="userId") int userId, @RequestBody User userDetails) {
        User currentUser = userRepository.findById(userId).orElse(null);
        if (currentUser != null) {
            currentUser.setFirstName(userDetails.getFirstName());
            currentUser.setLastName(userDetails.getLastName());
            currentUser.setUsername(userDetails.getUsername());
            currentUser.setEmail(userDetails.getEmail());
            currentUser.setPassword(userDetails.getPassword());

            userRepository.save(currentUser);
            return new ResponseEntity<>(currentUser, HttpStatus.OK); // 200
        } else {
            String response = STR."User with ID of \{userId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    // DELETE an existing user - Corresponds to http://localhost:8080/users/delete/6 (for example)
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
