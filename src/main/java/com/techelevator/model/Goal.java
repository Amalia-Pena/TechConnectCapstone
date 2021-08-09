package com.techelevator.model;

public class Goal {
    private Long goal_id;
    private Long person_id;
    private String description;

    // Getters

    public Long getGoal_id() {
        return goal_id;
    }

    public Long getPerson_id() {
        return person_id;
    }

    public String getDescription() {
        return description;
    }

    // Setters

    public void setGoal_id(Long goal_id) {
        this.goal_id = goal_id;
    }

    public void setPerson_id(Long person_id) {
        this.person_id = person_id;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
