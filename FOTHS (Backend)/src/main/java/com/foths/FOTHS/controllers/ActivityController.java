package com.foths.FOTHS.controllers;

import com.foths.FOTHS.models.Activity;
import com.foths.FOTHS.repositories.ActivityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/activities")
public class ActivityController {

    @Autowired
    ActivityRepository activityRepository;

    // GET the full list of activities
    // Endpoint is http://localhost:8080/activities
    @GetMapping("")
    public ResponseEntity<?> getAllActivities() {
        List<Activity> allActivities = activityRepository.findAll();
        return new ResponseEntity<>(allActivities, HttpStatus.OK); // 200
    }

    // GET a single activity using its id
    // Corresponds to http://localhost:8080/activities/details/3 (for example)
    @GetMapping(value="/activity-{activityId}", produces= MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getActivityById(@PathVariable(value="activityId") int activityId) {
        Activity currentActivity = (Activity) activityRepository.findById(activityId).orElse(null);
        if (currentActivity != null) {
            return new ResponseEntity<>(currentActivity, HttpStatus.OK); // 200
        } else {
            String response = STR."Activity with ID of \{activityId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }

    // POST a new activity
    // Endpoint http://localhost:8080/activities/add?type=login&timestamp=18:47:03 (for example)
    @PostMapping("/create-activity")
    public ResponseEntity<?> createNewActivity(@RequestParam(value="type") String type, @RequestParam(value="timestamp") String timestamp) {
        Activity newActivity = new Activity(type, timestamp);
        activityRepository.save(newActivity);
        return new ResponseEntity<>(newActivity, HttpStatus.CREATED); // 201
    }

    // DELETE an existing activity
    // Corresponds to http://localhost:8080/activities/delete/6 (for example)
    @DeleteMapping(value="/delete/activity-{activityId}", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> deleteActivity(@PathVariable(value="activityId") int activityId) {
        Activity currentActivity = (Activity) activityRepository.findById(activityId).orElse(null);
        if (currentActivity != null) {
            activityRepository.deleteById(activityId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT); // 204
        } else {
            String response = STR."Activity with ID of \{activityId} not found.";
            return new ResponseEntity<>(Collections.singletonMap("response", response), HttpStatus.NOT_FOUND); // 404
        }
    }
}
