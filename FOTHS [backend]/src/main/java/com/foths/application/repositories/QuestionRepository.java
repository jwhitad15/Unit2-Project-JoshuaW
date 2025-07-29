package com.foths.application.repositories;

import com.foths.application.models.Question;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Integer> {

    // Custom query methods can be defined here if needed
    List<Question> findByQuestionsContaining(String questions);
    List<Question> findByAnswerContaining(String answer);
    List<Question> findByLod(String lod);
    List<Question> findByTranslation(String translation);
    List<Question> findByQuestionsAndAnswer(String questions, String answer);
    List<Question> findByQuestionsAndLod(String questions, String lod);
    List<Question> findByQuestionsAndTranslation(String questions, String translation);
    List<Question> findByAnswerAndLod(String answer, String lod);
    List<Question> findByAnswerAndTranslation(String answer, String translation);

}
