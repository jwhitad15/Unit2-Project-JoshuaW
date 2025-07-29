package com.foths.application.controllers;

import com.foths.application.models.Question;
import com.foths.application.repositories.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/questions")
public class QuestionController {

    @Autowired
    private final QuestionRepository questionRepository;

    public QuestionController(QuestionRepository questionRepository) {this.questionRepository = questionRepository; }

    @GetMapping("")
    public ResponseEntity<?> getQuestions() {
        List<Question> allQuestions = questionRepository.findAll();
        return ResponseEntity.ok(allQuestions);
//        return new ResponseEntity<>(allQuestions, HttpStatus.OK); // 200
    }

    @GetMapping(value="/{questionId}", produces= MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getQuestionById(@PathVariable(value="questionId") int questionId) {
        Question currentQuestion = (Question) questionRepository.findById(questionId).orElse(null);
        if (currentQuestion != null) {
            return new ResponseEntity<>(currentQuestion, HttpStatus.OK); // 200
        } else {
            String response = STR."Question with ID of \{questionId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    @PostMapping("/add")
    public ResponseEntity<?> createNewQuestion(@RequestBody Question question) {
        questionRepository.save(question);
        return new ResponseEntity<>(question, HttpStatus.CREATED); // 201
    }

    @PutMapping("/update/{questionId}")
    public ResponseEntity<?> updateQuestion(@PathVariable(value="questionId") int questionId, @RequestBody Question question) {
        Question currentQuestion = (Question) questionRepository.findById(questionId).orElse(null);
        if (currentQuestion != null) {
            currentQuestion.setQuestions(question.getQuestions());
            currentQuestion.setAnswer(question.getAnswer());
            currentQuestion.setLod(question.getLod());
            currentQuestion.setTranslation(question.getTranslation());
            currentQuestion.setFruit(question.getFruit());
            currentQuestion.setCategory(question.getCategory());

            questionRepository.save(currentQuestion);
            return new ResponseEntity<>(currentQuestion, HttpStatus.OK); // 200
        } else {
            String response = STR."User with ID of \{questionId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    @DeleteMapping(value="/delete/{questionId}", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> deleteQuestion(@PathVariable(value="questionId") int questionId) {
        Question currentQuestion = (Question) questionRepository.findById(questionId).orElse(null);
        if (currentQuestion != null) {
            questionRepository.deleteById(questionId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT); // 204
        } else {
            String response = STR."Question with ID of \{questionId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }
}
