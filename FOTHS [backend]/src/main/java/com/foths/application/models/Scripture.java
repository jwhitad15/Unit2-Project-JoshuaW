//Scripture model class for the FOTHS application

// This Scripture class represents a scripture in the application, with fields for fruit, category, level
// of difficulty (lod), translation, scripture text, and verse. It uses JPA annotations for persistence and Lombok for
// boilerplate code reduction.
// The Scripture class includes constructors, getters, setters, and overrides for toString, equals, and
// hashCode methods to ensure proper behavior in collections and for debugging purposes.

package com.foths.application.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Objects;

// The Scripture class is annotated with @Entity to indicate that it is a JPA entity and @Table to specify the table name in the database.
// The class uses Lombok annotations @Getter and @Setter to automatically generate getter and setter methods
// for all fields, reducing boilerplate code.
@Table(name = "scripture")
@Getter
@Setter
@Entity
public class Scripture {

    // The id field is annotated with @Id and @GeneratedValue to indicate that it is the primary key and its value will be generated automatically.
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // The fields are annotated with @Column to map them to the corresponding columns in the database table.
    @Column(name = "category")
    private String category;
    @Column(name = "fruit")
    private String fruit;
    @Column(name = "lod")
    private String lod;
    @Column(name = "translation")
    private String translation;
    @Column(name = "scripture")
    private String scripture;
    @Column(name = "verse")
    private String verse;


    public Scripture(String category, String fruit, String lod, String translation, String scripture, String verse) {
        this.category = category;
        this.fruit = fruit;
        this.lod = lod;
        this.translation = translation;
        this.scripture = scripture;
        this.verse = verse;
    }

    public Scripture() {}

    // The class also overrides the toString method to provide a string representation of the scripture object,
    // which includes the id, fruit, verse, scripture text, translation, level of difficulty (lod), and category.
    @Override
    public String toString() {return STR."\{id} \{fruit} | \{verse} \{scripture} | \{translation} | \{lod} | \{category}";}
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass())
            return false;
        Scripture scripture = (Scripture) o;
        return id == scripture.id;
    }

    // The equals and hashCode methods are overridden to ensure that two Scripture objects are considered equal
    // if they have the same id, which is important for proper functioning in collections like HashSet
    // and for database operations.
    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}


