package com.foths.FOTHS.models;

import jakarta.persistence.*;
import java.util.Objects;

@Entity
public class Activity {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;
        @Column(name = "type")
        private String type;
        @Column(name = "timestamp")
        private String timestamp;



        public Activity(String type, String timestamp) {
            this.type = type;
            this.timestamp = timestamp;
        }
        public Activity() {};

        public int getId() { return id; }
            public String getType() { return type; }
            public void setType(String verse) { this.type = type; }
            public String getTimestamp() { return timestamp; }
            public void setTimestamp(String scripture) { this.timestamp = timestamp; }



        @Override
        public String toString() {
            return type
                    + " | " +
                    id
                    + " | " +
                    timestamp;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass())
                return false;
            Activity activity = (Activity) o;
            return id == activity.id;
        }

        @Override
        public int hashCode() {
            return Objects.hashCode(id);
        }
    }


