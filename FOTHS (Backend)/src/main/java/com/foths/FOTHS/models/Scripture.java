package com.foths.FOTHS.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Objects;

@Table(name = "scripture")
@Getter
@Setter
@Entity
public class Scripture {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

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

    @Override
    public String toString() {
        return STR."\{id} \{fruit} | \{verse} \{scripture} | \{translation} | \{lod} | \{category}";
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


