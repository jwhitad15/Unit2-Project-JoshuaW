package com.foths.FOTHS.models;

import jakarta.persistence.*;
import java.util.Objects;

@Entity
public class Scripture {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "verse")
    private String verse;
    @Column(name = "scripture")
    private String scripture;
    @Column(name = "lod")
    private String lod;
    @Column(name = "translation")
    private String translation;
    @Column(name = "fruit")
    private String fruit;
    @Column(name = "category")
    private String category;


    public Scripture(String verse, String scripture, String lod, String translation, String fruit, String category) {
        this.verse = verse;
        this.scripture = scripture;
        this.lod = lod;
        this.translation = translation;
        this.fruit = fruit;
        this.category = category;
    }
    public Scripture() {};

    public int getId() { return id; }
    public String getVerse() { return verse; }
    public void setVerse(String verse) { this.verse = verse; }
    public String getScripture() { return scripture; }
    public void setScripture(String scripture) { this.scripture = scripture; }
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
                + ") " +
                verse + " - " + scripture
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
        Scripture scripture = (Scripture) o;
        return id == scripture.id;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
