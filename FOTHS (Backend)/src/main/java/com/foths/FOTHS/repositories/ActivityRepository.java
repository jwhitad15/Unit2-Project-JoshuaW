package com.foths.FOTHS.repositories;

import com.foths.FOTHS.models.Activity;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.List;


@SpringBootApplication
public class ActivityRepository {

    public static void main(String[] args) {
        SpringApplication.run(ActivityRepository.class, args);
    }

    public List<Activity> findAll() {
        return null;
    }

    public ScopedValue<Object> findById(int activityId) {
        return null;
    }

    public void save(Activity newActivity) {

    }

    public void deleteById(int activityId) {

    }
}