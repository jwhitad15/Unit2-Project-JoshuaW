package com.foths.FOTHS.controllers;

import com.foths.FOTHS.models.Scripture;
import com.foths.FOTHS.repositories.ScriptureRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/scripture")
public class ScriptureController {

    @Autowired
    private final ScriptureRepository scriptureRepository;

    public ScriptureController(ScriptureRepository scriptureRepository) {this.scriptureRepository = scriptureRepository;}

    // GET the full list of scripture - Endpoint is http://localhost:8080/scripture
    @GetMapping("")
    public ResponseEntity<?> getScripture() {
        List<Scripture> allScripture = scriptureRepository.findAll();
        return ResponseEntity.ok(allScripture); // 200
    }

    // GET a single scripture using its id
    // Corresponds to http://localhost:8080/scripture/details/3 (for example)
    @GetMapping(value="/{scriptureId}", produces= MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getScriptureById(@PathVariable(value="scriptureId") int scriptureId) {
        Scripture currentScripture = (Scripture) scriptureRepository.findById(scriptureId).orElse(null);
        if (currentScripture != null) {
            return new ResponseEntity<>(currentScripture, HttpStatus.OK); // 200
        } else {
            String response = STR."The scripture with ID of \{scriptureId} was not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    // POST a new scripture - Endpoint http://localhost:8080/scriptures/add
    @PostMapping("/add")
    public ResponseEntity<?> createNewScripture(@RequestBody Scripture scripture) {
        Scripture newScripture = new Scripture();
        scriptureRepository.save(newScripture);
        return new ResponseEntity<>(newScripture, HttpStatus.CREATED); // 201
    }

    // DELETE an existing scripture
    // Corresponds to http://localhost:8080/scriptures/delete/6 (for example)
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
}
