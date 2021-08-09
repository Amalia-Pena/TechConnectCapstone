package com.techelevator.model;

public class Exercise_Class {
    // Instance variables
    private Long class_id;
    private Long instructor_id;
    private String class_name;
    private String class_description;
    private String class_start_date;
    private String class_end_date;

    // Getters

    public Long getClass_id() {
        return class_id;
    }

    public Long getInstructor_id() {
        return instructor_id;
    }

    public String getClass_name() {
        return class_name;
    }

    public String getClass_description() {
        return class_description;
    }

    public String getClass_start_date() {
        return class_start_date;
    }

    public String getClass_end_date() {
        return class_end_date;
    }

    // Setters

    public void setClass_id(Long class_id) {
        this.class_id = class_id;
    }

    public void setInstructor_id(Long instructor_id) {
        this.instructor_id = instructor_id;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public void setClass_description(String class_description) {
        this.class_description = class_description;
    }

    public void setClass_start_date(String class_start_date) {
        this.class_start_date = class_start_date;
    }

    public void setClass_end_date(String class_end_date) {
        this.class_end_date = class_end_date;
    }
}
