package com.techelevator.model;

public class Equipment {
    // Instance variables
    private Long equipment_id;
    private String name;
    private double met_Value;

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
}
