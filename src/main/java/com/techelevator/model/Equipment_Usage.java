package com.techelevator.model;

import java.time.LocalDateTime;

public class Equipment_Usage {
    // Instance variables
    private Long equipment_usage_id;
    private Long equipment_id;
    private String distance;
    private boolean incline;
    private boolean decline;
    private int reps;
    private int weight_per_rep;
    private LocalDateTime check_in;
    private LocalDateTime check_out;

    // Getters

    public Long getEquipment_usage_id() {
        return equipment_usage_id;
    }

    public Long getEquipment_id() {
        return equipment_id;
    }

    public String getDistance() {
        return distance;
    }

    public boolean isIncline() {
        return incline;
    }

    public boolean isDecline() {
        return decline;
    }

    public int getReps() {
        return reps;
    }

    public int getWeight_per_rep() {
        return weight_per_rep;
    }

    public LocalDateTime getCheck_in() {
        return check_in;
    }

    public LocalDateTime getCheck_out() {
        return check_out;
    }

    // Setters
}
