package com.techelevator.model;

public class Equipment {
    // Instance variables
    private Long equipment_id;
    private String name;
    private double met_Value;
    private Long category_id;


    // Getters

    public Long getEquipment_id() {
        return equipment_id;
    }

    public String getName() {
        return name;
    }

    public double getMet_Value() {
        return met_Value;
    }


// Setters

    public void setEquipment_id(Long equipment_id) {
        this.equipment_id = equipment_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMet_Value(double met_Value) {
        this.met_Value = met_Value;
    }

    public Long getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Long category_id) {
        this.category_id = category_id;
    }
}
