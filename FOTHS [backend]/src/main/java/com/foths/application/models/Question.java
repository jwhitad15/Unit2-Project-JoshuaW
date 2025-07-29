package com.foths.application.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Objects;

@Getter
@Setter
@Entity
@Table(name = "question")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

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


    @Override
    public String toString() {
        return STR."\{fruit}_\{id} | \{category} | \{questions}[\{answer}] | \{lod} | \{translation} | \{category}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass())
            return false;
        Question question = (Question) o;
        return id == question.id;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}

