package com.techelevator.model;

public class Person {
    // Instance variables
    private Long person_id;
    private Long user_id;
    private String first_name;
    private String last_name;
    private String email;
    private String photo_path;

    // Getters

    public Long getPerson_id() {
        return person_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoto_path() {
        return photo_path;
    }

    // Setters

    public void setPerson_id(Long person_id) {
        this.person_id = person_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoto_path(String photo_path) {
        this.photo_path = photo_path;
    }
}
