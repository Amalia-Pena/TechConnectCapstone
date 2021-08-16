package com.techelevator.model;

public class Workout_Metric {

    private String totalGymTime;
    private double check_in;
    private double check_out;

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

    public String getTotalGymTime() {
        return totalGymTime;
    }

    public void setTotalGymTime(String totalGymTime) {
        this.totalGymTime = totalGymTime;
    }
}
