package com.foths.application.repositories;

import com.foths.application.models.Question;

import java.util.List;

public interface QuestionRepository {
    List<Question> findAll();

    ScopedValue<Object> findById(int questionId);

    void save(Question question);

    void deleteById(int questionId);
}
