package com.foths.application.security.services;

import com.foths.application.models.User;

import java.util.List;

public interface UserService {

    // Method to create a new user
    User createUser(User user);

    // Method to retrieve a user by their ID
    User getUserById(Integer id);

    // Method to update an existing user's information
    User updateUser(Integer id, User user);

    // Method to delete a user by their ID
    void deleteUser(Integer id);

    // Method to retrieve all users
    List<User> getAllUsers();
}
