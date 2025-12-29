//User model class for the FOTHS application

// This User class represents a user in the application, with fields for first name, last name,
// email, username, and password. It uses JPA annotations for persistence and Lombok for
// boilerplate code reduction.
// The User class includes constructors, getters, setters, and overrides for toString, equals, and
// hashCode methods to ensure proper behavior in collections and for debugging purposes.

package com.foths.application.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.foths.application.UserDetails;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.core.SpringSecurityCoreVersion;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

// The User class is annotated with @Entity to indicate that it is a JPA entity and @Table to specify the table name in the database.
// The class uses Lombok annotations @Getter and @Setter to automatically generate getter and setter methods
// for all fields, reducing boilerplate code.
@Getter
@Setter
@Entity
@Data
@Table(name = "user", uniqueConstraints =  {@UniqueConstraint(columnNames = "username"), @UniqueConstraint(columnNames = "email")})
public class User {

    private boolean accountNonLocked = true;
    private boolean accountNonExpired = true;
    private boolean credentialsNonExpired = true;
    private boolean enabled = true;

    private LocalDate credentialsExpiryDate;
    private LocalDate accountExpiryDate;

    private String twoFactorSecret;
    private boolean isTwoFactorEnabled = false;
    private String signUpMethod;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE})
    @JoinColumn(name = "role_id", referencedColumnName = "role_id")
    @JsonBackReference
    @ToString.Exclude
    private Roles roles;

    @CreationTimestamp
    @Column(updatable = false)
    private LocalDateTime createDate;

    @UpdateTimestamp
    private LocalDateTime updatedDate;

    // The id field is annotated with @Id and @GeneratedValue to indicate that it is the primary key and its value will be generated automatically.
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // The fields are annotated with @Column to map them to the corresponding columns in the database table.
    @NotBlank
    @Size(max = 310)
    @Column(name = "first_name")
    private String firstName;
    @NotBlank
    @Size(max = 310)
    @Column(name = "last_name")
    private String lastName;
    @NotBlank
    @Size(max = 520)
    @Column(name = "email")
    private String email;
    @NotBlank
    @Size(max = 310)
    @Column(name = "username")
    private String username;
    @NotBlank
    @Size(max = 310)
    @Column(name = "password")
    private String password;


    public User(String firstName, String lastName, String email, String username, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.username = username;
        this.password = password;
    }

// No-argument constructor for JPA that creates instances of the User class.
    public User() {};

    public User(String username) {
        this.username = username;
    }

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

    public User orElseThrow(Object o) {
        return null;
    }

    public User orElse(Object o) {
        return null;
    }

    public User get() {
        return null;
    }

    public boolean isEmpty() {
        return false;
    }
}

