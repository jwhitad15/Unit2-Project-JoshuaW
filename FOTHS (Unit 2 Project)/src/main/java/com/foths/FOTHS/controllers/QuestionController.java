package com.foths.FOTHS.controllers;

import com.foths.FOTHS.models.Question;
import com.foths.FOTHS.repositories.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/questions")
public class QuestionController {

    @Autowired
    QuestionRepository questionRepository;

    // GET the full list of questions
    // Endpoint is http://localhost:8080/questions
    @GetMapping("")
    public ResponseEntity<?> getQuestions() {
        List<Question> allQuestions = questionRepository.findAll();
        return new ResponseEntity<>(allQuestions, HttpStatus.OK); // 200
    }

    // GET a single question using its id
    // Corresponds to http://localhost:8080/questions/details/3 (for example)
    @GetMapping(value="/details/{questionId}", produces= MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getQuestionById(@PathVariable(value="questionId") int questionId) {
        Question currentQuestion = questionRepository.findById(questionId).orElse(null);
        if (currentQuestion != null) {
            return new ResponseEntity<>(currentQuestion, HttpStatus.OK); // 200
        } else {
            String response = "Question with ID of " + questionId + " not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    // POST a new question
    // Endpoint http://localhost:8080/questions/add?type=login&timestamp=18:47:03 (for example)
    @PostMapping("/add")
    public ResponseEntity<?> createNewQuestion(@RequestParam(value="fruit") String fruit, @RequestParam(value="question") String question, @RequestParam(value="answer") String answer, @RequestParam(value="options") String options, @RequestParam(value="lod") String lod, @RequestParam(value="translation") String translation, @RequestParam(value="category") String category) {
        Question newQuestion = new Question(fruit, question, answer, options, lod, translation);
        questionRepository.save(newQuestion);
        return new ResponseEntity<>(newQuestion, HttpStatus.CREATED); // 201
    }

    // DELETE an existing question
    // Corresponds to http://localhost:8080/questions/delete/6 (for example)
    @DeleteMapping(value="/delete/{questionId}", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> deleteQuestion(@PathVariable(value="questionId") int questionId) {
        Question currentQuestion = questionRepository.findById(questionId).orElse(null);
        if (currentQuestion != null) {
            questionRepository.deleteById(questionId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT); // 204
        } else {
            String response = "Question with ID of " + questionId + " not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }
}
