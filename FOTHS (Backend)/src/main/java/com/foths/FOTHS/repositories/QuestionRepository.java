
package com.foths.FOTHS.repositories;

import com.foths.FOTHS.models.Question;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepository extends JpaRepository<Question, Integer> {
}