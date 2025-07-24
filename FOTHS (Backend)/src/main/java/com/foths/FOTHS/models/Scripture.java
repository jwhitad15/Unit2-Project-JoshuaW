package com.foths.FOTHS.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Objects;

@Getter
@Setter
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


    public Scripture(String verse, String scripture, String lod, String translation, String fruit, String category) {}
    public Scripture() {};



    @Override
    public String toString() {
        return STR."\{fruit}_\{id}) \{verse} - \{scripture} | \{lod} | \{translation} | \{category}";
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
