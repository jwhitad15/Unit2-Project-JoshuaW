//Question model class for the FOTHS application

// This Question class represents a question in the application, with fields for question, answer, level of difficulty
// translation, fruit, and category. It uses JPA annotations for persistence and Lombok for boilerplate code reduction.
// The Question class includes constructors, getters, setters, and overrides for toString, equals, and
// hashCode methods to ensure proper behavior in collections and for debugging purposes.

package com.foths.application.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Objects;

// The Question class is annotated with @Entity to indicate that it is a JPA entity and @Table to specify the table name in the database.
// The class uses Lombok annotations @Getter and @Setter to automatically generate getter and setter methods
// for all fields, reducing boilerplate code.
@Getter
@Setter
@Entity
@Table(name = "question")
public class Question {

    // The id field is annotated with @Id and @GeneratedValue to indicate that it is the primary key and its value will be generated automatically.
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // The fields are annotated with @Column to map them to the corresponding columns in the database table.
    @Column(name = "questions")
    private String questions;
    @Column(name = "answer")
    private String answer;
    @Column(name = "lod")
    private String lod;
    @Column(name = "translation")
    private String translation;
    @Column(name = "fruit")
    private String fruit;
    @Column(name = "category")
    private String category;


    public Question(String questions, String answer, String lod, String translation, String fruit, String category) {
        this.questions = questions;
        this.answer = answer;
        this.lod = lod;
        this.translation = translation;
        this.fruit = fruit;
        this.category = category;
    }
    public Question() {};

    // The class also overrides the toString method to provide a string representation of the question object,
    // which includes the id, questions, answer, level of difficulty (lod), translation, fruit, and category.
    @Override
    public String toString() { return fruit + "_" + id + " | " + category + " | " +
            questions + "[" + answer + "] | " +
            lod + " | " + translation + " | " + category; }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass())
            return false;
        Question question = (Question) o;
        return id == question.id;
    }

    // The equals and hashCode methods are overridden to ensure that two Question objects are considered equal
    // if they have the same id, which is important for proper functioning in collections like HashSet
    // and for database operations.
    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}

