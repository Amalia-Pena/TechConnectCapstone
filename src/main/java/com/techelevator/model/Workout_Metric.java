package com.techelevator.model;

import java.time.DayOfWeek;

public class Workout_Metric {
    private String totalGymTime;
    private double averageGymTime;
    private DayOfWeek day;
    private int dayOfMonth;
    private String month;

    public String getTotalGymTime() {
        return totalGymTime;
    }

    public void setTotalGymTime(String totalGymTime) {
        this.totalGymTime = totalGymTime;
    }

    public double getAverageGymTime() {
        return averageGymTime;
    }

    public void setAverageGymTime(double averageGymTime) {
        this.averageGymTime = averageGymTime;
    }

    public DayOfWeek getDay() {
        return day;
    }

    public void setDay(DayOfWeek day) {
        this.day = day;
    }

    public int getDayOfMonth() {
        return dayOfMonth;
    }

    public void setDayOfMonth(int dayOfMonth) {
        this.dayOfMonth = dayOfMonth;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
}
