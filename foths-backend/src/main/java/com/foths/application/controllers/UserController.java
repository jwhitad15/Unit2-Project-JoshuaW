//Controller for managing user-related operations

// It provides endpoints to create, read, update, and delete users in the application.
// The controller uses the UserRepository to interact with the database and perform CRUD operations on User entities
// It also handles HTTP requests and responses, returning appropriate status codes and messages based on the operation
// performed.
// The UserController class is annotated with @RestController to indicate that it is a Spring MVC controller
// and @RequestMapping to specify the base URL for all endpoints in this controller.

package com.foths.application.controllers;

import com.foths.application.models.User;
import com.foths.application.models.dto.LoginRequest;
import com.foths.application.models.dto.UserProfileDTO;
import com.foths.application.repositories.UserRepository;
import com.foths.application.security.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import com.foths.application.security.JwtUtil;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;


@RestController
@RequestMapping("/users")
//@PreAuthorize("hasRole('ADMIN')")
public class UserController {

    @Autowired
    private final UserRepository userRepository;
    private final UserService userService;
    private final AuthenticationManager authenticationManager;
    @Autowired
    private final PasswordEncoder passwordEncoder;
    @Autowired
    private JwtUtil jwtUtil;

    public UserController(UserRepository userRepository, UserService userService, AuthenticationManager authenticationManager, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.authenticationManager = authenticationManager;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<User>> getAllUsers() {
        return new ResponseEntity<>(userService.getAllUsers(), HttpStatus.OK);
    }

    @GetMapping("/{userId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<UserProfileDTO> getUser(@PathVariable Long userId) {
        return new ResponseEntity<>(userService.getUserById(userId), HttpStatus.OK);
    }

    @PostMapping("/create")
    public ResponseEntity<?> createNewUser(@RequestBody User user, @AuthenticationPrincipal UserDetails userDetails) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        user.setPassword(null);
        System.out.println("User created: " + user);
        return new ResponseEntity<>(user, HttpStatus.CREATED); // 201
    }

//    @PostMapping("/login")
//    public ResponseEntity<?> loginUser(@RequestBody LoginRequest loginRequest) {
//        System.out.println("Login endpoint hit");
//        User user = userRepository.findByUsername(loginRequest.getUsername()).orElse(null);
//        if (user != null && passwordEncoder.matches(loginRequest.getPassword(), user.getPassword())) {
//            user.setPassword(null);
//            return ResponseEntity.ok(user);
//        } else {
//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
//                    .body(Collections.singletonMap("error", "Invalid username or password"));
//        }
//    }

    // Renamed to avoid colliding with application login page (/login)
//    @PostMapping("/authenticate")
//    public ResponseEntity<?> authenticateUser(@RequestBody LoginRequest loginRequest) {
//        User user = userRepository.findByUsername(loginRequest.getUsername());
//        if (user != null && Objects.equals(user.getPassword(), loginRequest.getPassword())) {
//            return ResponseEntity.ok(user);
//        } else {
//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
//                    .body(Collections.singletonMap("error", "Invalid username or password"));
//        }
//    }

    @PostMapping("/authenticate")
    public ResponseEntity<?> authenticate(@RequestBody LoginRequest request) {

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );

        String token = jwtUtil.generateToken(request.getUsername());

        return ResponseEntity.ok(
                Map.of("token", token)
        );
    }


//    @PostMapping("/authenticate")
//    public ResponseEntity<?> authenticate(@RequestBody LoginRequest request) {
//        String username = request.getUsername();
//        System.out.println("Authenticate attempt for username: " + username);
//
//        var user = userRepository.findByUsername(request.getUsername());
//        if (user == null) {
//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
//                    .body(Map.of("message", "Invalid username or password"));
//        }
//
//        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
//                    .body(Map.of("message", "Invalid username or password"));
//        }
//
//        // check user exists first
//        var userOpt = userRepository.findByUsername(username);
//        if (userOpt.isEmpty()) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND)
//                    .contentType(MediaType.APPLICATION_JSON)
//                    .body(Map.of("error", "User not found"));
//        }
//
////        User user = userOpt.get();
//        String stored = user.getPassword();
//        boolean looksLikeBCrypt = stored != null && (stored.startsWith("$2a$") || stored.startsWith("$2b$") || stored.startsWith("$2y$"));
//        System.out.println("Stored password present=" + (stored != null) + " looksLikeBCrypt=" + looksLikeBCrypt + " length=" + (stored == null ? 0 : stored.length()));
//
//        try {
//            Authentication auth = authenticationManager.authenticate(
//                    new UsernamePasswordAuthenticationToken(username, request.getPassword())
//            );
//            user.setPassword(null); // don't return password
//            return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(user);
//        } catch (BadCredentialsException ex) {
//            // Local-dev fallback: if stored password is not BCrypt and equals raw, accept (remove for prod)
//            if (!looksLikeBCrypt && stored != null && Objects.equals(stored, request.getPassword())) {
//                user.setPassword(null);
//                return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(user);
//            }
//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
//                    .contentType(MediaType.APPLICATION_JSON)
//                    .body(Map.of("error", "Invalid credentials"));
//        }
//    }


//    public ResponseEntity<?> authenticate(@RequestBody LoginRequest request) {
//        try {
//            assert authenticationManager != null;
//            Authentication auth = authenticationManager.authenticate(
//                    new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
//            );
//            // Authentication success: return user info (omit sensitive fields in production)
//            User user = userRepository.findByUsername(request.getUsername()).orElse(null);
//            if (user == null) {
//                return ResponseEntity.status(404).body("User not found");
//            }
//            // Optionally null out password before returning
//            user.setPassword(null);
//            return ResponseEntity.ok(user);
//        } catch (BadCredentialsException ex) {
//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
//                    .body(Collections.singletonMap("error", "Invalid credentials"));
//        }
//    }

    @PutMapping("/update/{userId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> updateUser(@PathVariable(value="userId") int userId, @RequestBody User user, @AuthenticationPrincipal UserDetails userDetails) {
        User currentUser = userRepository.findById(userId).orElse(null);
        if (currentUser != null) {
            currentUser.setFirstName(user.getFirstName());
            currentUser.setLastName(user.getLastName());
            currentUser.setEmail(user.getEmail());
            currentUser.setUsername(user.getUsername());
            currentUser.setPassword(user.getPassword());

            userRepository.save(currentUser);
            return new ResponseEntity<>(currentUser, HttpStatus.OK); // 200
        } else {
            String response = String.format("User with ID of %d not found.", userId);
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    @PutMapping("/update-role/{userId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> updateUserRole(@RequestParam Long userId, @RequestParam String roleName) {
        userService.updateUserRole(userId, roleName);
        return ResponseEntity.ok(String.format("User role updated to %s for user ID %d", roleName, userId));
    }

    @DeleteMapping(value="/delete/{userId}", produces=MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> deleteById(@PathVariable(value="userId") int userId) {
        User currentUser = (User) userRepository.findById(userId).orElse(null);
        if (currentUser != null) {
            userRepository.deleteById(userId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT); // 204
        } else {
            String response = String.format("User with ID of %d not found.", userId);
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

}
