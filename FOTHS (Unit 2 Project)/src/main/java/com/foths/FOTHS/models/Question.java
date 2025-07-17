package com.foths.FOTHS.models;

import jakarta.persistence.*;
import java.util.Objects;

@Entity
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

    public int getId() { return id; }
    public String getVerse() { return questions; }
    public void setVerse(String verse) { this.questions = questions; }
    public String getScripture() { return answer; }
    public void setScripture(String scripture) { this.answer = answer; }
    public String getLod() { return lod; }
    public void setLod(String lod) { this.lod = lod; }
    public String getTranslation() { return translation; }
    public void setTranslation(String translation) { this.translation = translation; }
    public String getFruit() { return fruit; }
    public void setFruit(String fruit) { this.fruit = fruit; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }


    @Override
    public String toString() {
        return fruit + "_" + id
                + " | " +
                category
                + " | " +
                questions + "[" + answer + "]"
                + " | " +
                lod
                + " | " +
                translation
                + " | " +
                category ;
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
