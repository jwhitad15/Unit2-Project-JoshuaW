// Question repository interface for managing Question entities in the database.
// It extends JpaRepository to provide CRUD operations and custom query methods for Question entities.
// The QuestionRepository interface defines methods to find users by various attributes such as questions, answer, level of difficulty (lod), and translation.
// It also includes methods to find questions by combinations of these attributes, such as questions and answer, or questions and level of difficulty (lod).

package com.foths.application.repositories;

import com.foths.application.models.Question;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Integer> {

    // Custom query methods
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
