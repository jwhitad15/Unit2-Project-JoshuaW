//Controller for managing scripture-related operations

// It provides endpoints to create, read, update, and delete scriptures in the application.
// The controller uses the ScriptureRepository to interact with the database and perform CRUD operations on Scripture entities
// It also handles HTTP requests and responses, returning appropriate status codes and messages based on the operation
// performed.
// The ScriptureController class is annotated with @RestController to indicate that it is a Spring MVC controller
// and @RequestMapping to specify the base URL for all endpoints in this controller.

package com.foths.application.controllers;

import com.foths.application.models.User;
import com.foths.application.models.dto.ValidateAnswerRequest;
import com.foths.application.models.Scripture;
import com.foths.application.repositories.ScriptureRepository;
import com.foths.application.repositories.UserRepository;
import com.foths.application.security.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/scriptures")
public class ScriptureController {

    private final ScriptureRepository scriptureRepository;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private UserRepository userRepository;

    public ScriptureController(ScriptureRepository scriptureRepository, JwtUtil jwtUtil, UserRepository userRepository) {
        this.scriptureRepository = scriptureRepository;
        this.jwtUtil = jwtUtil;
        this.userRepository = userRepository;}

    @GetMapping("")
    public ResponseEntity<?> getAllScriptures(@RequestHeader("Authorization") String authHeader) {
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Collections.singletonMap("error", "Unauthorized"));
        }

        String token = authHeader.substring(7);
        String username;
        try {
            username = jwtUtil.extractUsername(token);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Collections.singletonMap("error", "Invalid token"));
        }

        User user = userRepository.findByUsername(username).orElse(null);
        if (user == null) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Collections.singletonMap("error", "Invalid user"));
        }

        List<Scripture> allScriptures = scriptureRepository.findAll();
        return ResponseEntity.ok(allScriptures);
    }

    @GetMapping(value="/{scriptureId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getScriptureById(@RequestHeader("Authorization") String authHeader,
                                              @PathVariable(value="scriptureId") int scriptureId) {
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Collections.singletonMap("error", "Unauthorized"));
        }

        String token = authHeader.substring(7);
        String username;
        try {
            username = jwtUtil.extractUsername(token);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Collections.singletonMap("error", "Invalid token"));
        }

        User user = userRepository.findByUsername(username).orElse(null);
        if (user == null) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Collections.singletonMap("error", "Invalid user"));
        }

        Scripture currentScripture = scriptureRepository.findById(scriptureId).orElse(null);
        if (currentScripture != null) {
            return new ResponseEntity<>(currentScripture, HttpStatus.OK);
        } else {
            String response = "Scripture with ID of " + scriptureId + " not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/add")
    public ResponseEntity<?> createNewScripture(@RequestBody Scripture scripture) {
        scriptureRepository.save(scripture);
        return new ResponseEntity<>(scripture, HttpStatus.CREATED); // 201
    }

    @PutMapping("/update/{scriptureId}")
    public ResponseEntity<?> updateScripture(@PathVariable(value="scriptureId") int scriptureId, @RequestBody Scripture scripture) {
        Scripture currentScripture = (Scripture) scriptureRepository.findById(scriptureId).orElse(null);
        if (currentScripture != null) {
            currentScripture.setCategory(scripture.getCategory());
            currentScripture.setFruit(scripture.getFruit());
            currentScripture.setLod(scripture.getLod());
            currentScripture.setTranslation(scripture.getTranslation());
            currentScripture.setScripture(scripture.getScripture());
            currentScripture.setVerse(scripture.getVerse());

            scriptureRepository.save(currentScripture);
            return new ResponseEntity<>(currentScripture, HttpStatus.OK); // 200
        } else {
            String response = STR."Scripture with ID of \{scriptureId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    @DeleteMapping(value="/delete/{scriptureId}", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> deleteScripture(@PathVariable(value="scriptureId") int scriptureId) {
        Scripture currentScripture = (Scripture) scriptureRepository.findById(scriptureId).orElse(null);
        if (currentScripture != null) {
            scriptureRepository.deleteById(scriptureId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT); // 204
        } else {
            String response = STR."Scripture with ID of \{scriptureId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    @PostMapping("/validate")
    public ResponseEntity<?> validateAnswer(@RequestBody ValidateAnswerRequest request) {
        Scripture scripture = scriptureRepository.findByVerse(request.getVerse());
        if (scripture == null) {
            return ResponseEntity.status(404)
                    .body(Collections.singletonMap("error", "Scripture not found"));
        }
        boolean isCorrect = scripture.getVerse().trim().equalsIgnoreCase(request.getUserAnswer().trim());
        return ResponseEntity.ok(Collections.singletonMap("isCorrect", isCorrect));
    }

}