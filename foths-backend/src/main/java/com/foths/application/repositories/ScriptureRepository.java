// Scripture repository interface for managing Scripture entities in the database.
// It extends JpaRepository to provide CRUD operations and custom query methods for Scripture entities.
// The ScriptureRepository interface defines methods to find scripture by various attributes such as category, translation, verse, fruit, and level of difficulty (lod).
// It also includes methods to find scriptures by combinations of these attributes, such as category and translation, or category and verse.

package com.foths.application.repositories;

import com.foths.application.models.Scripture;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ScriptureRepository extends JpaRepository<Scripture, Integer> {

    // Custom query methods
    //    Scripture findByVerse(String verse);
    List<Scripture> findByCategory(String category);
    List<Scripture> findByTranslation(String translation);
    Scripture findByVerse(String verse);
    List<Scripture> findByFruit(String fruit);
    List<Scripture> findByLod(String lod);
    List<Scripture> findByScriptureContaining(String scriptureText);
    List<Scripture> findByCategoryAndTranslation(String category, String translation);
    List<Scripture> findByCategoryAndVerse(String category, String verse);

}
