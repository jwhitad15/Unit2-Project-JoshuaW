//User model class for the FOTHS application

// This User class represents a user in the application, with fields for first name, last name,
// email, username, and password. It uses JPA annotations for persistence and Lombok for
// boilerplate code reduction.
// The User class includes constructors, getters, setters, and overrides for toString, equals, and
// hashCode methods to ensure proper behavior in collections and for debugging purposes.

package com.foths.application.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.util.Objects;

// The User class is annotated with @Entity to indicate that it is a JPA entity and @Table to specify the table name in the database.
// The class uses Lombok annotations @Getter and @Setter to automatically generate getter and setter methods
// for all fields, reducing boilerplate code.
@Getter
@Setter
@Entity
@Table(name = "user")
public class User {

    // The id field is annotated with @Id and @GeneratedValue to indicate that it is the primary key and its value will be generated automatically.
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // The fields are annotated with @Column to map them to the corresponding columns in the database table.
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "email")
    private String email;
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;

    public User(String firstName, String lastName, String email, String username, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.username = username;
        this.password = password;
    }
    public User() {};

// The class also overrides the toString method to provide a string representation of the user object,
// which includes the user's id, first name, last name, email, username, and password.
    @Override
    public String toString() {
        return STR."\{id}) \{firstName} \{lastName} | \{email} | \{username}[\{password}]";
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass())
            return false;
        User user = (User) o;
        return id == user.id;
    }

// The equals and hashCode methods are overridden to ensure that two User objects are considered equal
// if they have the same id, which is important for proper functioning in collections like HashSet
// and for database operations.
    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}

