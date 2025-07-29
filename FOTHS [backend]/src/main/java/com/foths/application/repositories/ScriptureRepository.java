package com.foths.application.repositories;

import com.foths.application.models.Scripture;

import java.util.List;

public interface ScriptureRepository {
    List<Scripture> findAll();

    ScopedValue<Object> findById(int scriptureId);

    void save(Scripture scripture);

    void deleteById(int scriptureId);
}
