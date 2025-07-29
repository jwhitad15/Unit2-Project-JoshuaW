package com.foths.application.controllers;

import com.foths.application.models.Scripture;
import com.foths.application.repositories.ScriptureRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/scriptures")
public class ScriptureController {

    @Autowired
    private final ScriptureRepository scriptureRepository;

    public ScriptureController(ScriptureRepository scriptureRepository) {this.scriptureRepository = scriptureRepository;}

    @GetMapping("")
    public ResponseEntity<?> getAllScriptures() {
        List<Scripture> allScriptures = scriptureRepository.findAll();
        return ResponseEntity.ok(allScriptures);
    }

    @GetMapping(value="/{scriptureId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getScriptureById(@PathVariable(value="scriptureId") int scriptureId) {
        Scripture currentScripture = (Scripture) scriptureRepository.findById(scriptureId).orElse(null);
        if (currentScripture != null) {
            return new ResponseEntity<>(currentScripture, HttpStatus.OK); // 200
        } else {
            String response = STR."User with ID of \{scriptureId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
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
            String response = STR."User with ID of \{scriptureId} not found.";
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
            String response = STR."Question with ID of \{scriptureId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

}