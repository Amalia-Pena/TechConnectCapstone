package com.techelevator.model;

public class Equipment_Metric {

    private String name;
    private String equipmentUsage;
    private double check_in;
    private double check_out;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEquipmentUsage() {
        return equipmentUsage;
    }

    public void setEquipmentUsage(String equipmentUsage) {
        this.equipmentUsage = equipmentUsage;
    }

    public double getCheck_in() {
        return check_in;
    }

    public void setCheck_in(double check_in) {
        this.check_in = check_in;
    }

    public double getCheck_out() {
        return check_out;
    }

    public void setCheck_out(double check_out) {
        this.check_out = check_out;
    }
}
