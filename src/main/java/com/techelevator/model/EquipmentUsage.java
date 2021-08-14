package com.techelevator.model;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class EquipmentUsage {
    private Long equipment_usage_id;
    private Long equipment_id;
    private Long session_id;

    @NotNull(message = "Cannot be blank")
    @Min(value = 1, message = "Do you even lift bro????")
    private int reps;

    @NotNull(message = "Cannot be blank")
    @Min(value = 1, message = "Do you even lift bro????")
    private int weight_per_rep;

    @NotNull
    @Min(value = 0, message = "Distance cannot be less than zero.")
    private double distance;


    private Timestamp check_in;
    private Timestamp check_out;

    public Long getEquipment_usage_id() {
        return equipment_usage_id;
    }

    public void setEquipment_usage_id(Long equipment_usage_id) {
        this.equipment_usage_id = equipment_usage_id;
    }

    public Long getEquipment_id() {
        return equipment_id;
    }

    public void setEquipment_id(Long equipment_id) {
        this.equipment_id = equipment_id;
    }

    public Long getSession_id() {
        return session_id;
    }

    public void setSession_id(Long session_id) {
        this.session_id = session_id;
    }

    public int getReps() {
        return reps;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }

    public int getWeight_per_rep() {
        return weight_per_rep;
    }

    public void setWeight_per_rep(int weight_per_rep) {
        this.weight_per_rep = weight_per_rep;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public Timestamp getCheck_in() {
        return check_in;
    }

    public void setCheck_in(Timestamp check_in) {
        this.check_in = check_in;
    }

    public Timestamp getCheck_out() {
        return check_out;
    }

    public void setCheck_out(Timestamp check_out) {
        this.check_out = check_out;
    }
}
