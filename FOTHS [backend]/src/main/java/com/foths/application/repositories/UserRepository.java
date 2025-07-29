package com.foths.application.repositories;

import com.foths.application.models.User;

import java.util.List;

public interface UserRepository {
    void deleteById(int userId);

    ScopedValue<Object> findById(int userId);

    void save(User currentUser);

    List<User> findAll();
}
