package com.techelevator.model;

public class Workout_Profile {
    private Long profile_id;
    private Long person_id;
    private int weight;
    private double height;

    // Getters

    public Long getProfile_id() {
        return profile_id;
    }

    public Long getPerson_id() {
        return person_id;
    }

    public int getWeight() {
        return weight;
    }

    public double getHeight() {
        return height;
    }

    // Setters

    public void setProfile_id(Long profile_id) {
        this.profile_id = profile_id;
    }

    public void setPerson_id(Long person_id) {
        this.person_id = person_id;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public void setHeight(double height) {
        this.height = height;
    }
}
