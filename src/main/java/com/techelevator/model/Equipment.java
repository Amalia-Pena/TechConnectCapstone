package com.techelevator.model;

public class Equipment {
    // Instance variables
    private Long equipment_id;
    private String name;
    private double met_Value;
    private Assistance_Media assistance_media;

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

    public Assistance_Media getAssistance_media() {
        return assistance_media;
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

    public void setAssistance_media(Assistance_Media assistance_media) {
        this.assistance_media = assistance_media;
    }
}
