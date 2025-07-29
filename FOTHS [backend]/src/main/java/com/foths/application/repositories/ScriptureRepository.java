package com.foths.application.repositories;

import com.foths.application.models.Scripture;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ScriptureRepository extends JpaRepository<Scripture, Integer> {

    // Custom query methods can be defined here if needed
    List<Scripture> findByCategory(String category);
    List<Scripture> findByTranslation(String translation);
    List<Scripture> findByVerse(String verse);
    List<Scripture> findByFruit(String fruit);
    List<Scripture> findByLod(String lod);
    List<Scripture> findByScriptureContaining(String scriptureText);
    List<Scripture> findByCategoryAndTranslation(String category, String translation);
    List<Scripture> findByCategoryAndVerse(String category, String verse);

}
