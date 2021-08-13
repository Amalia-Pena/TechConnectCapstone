package com.techelevator.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class StrengthEquipmentUsage {
    private Long strength_id;
    private Long equipment_id;
    private Long session_id;

    @NotBlank(message = "Cannot be blank")
    @Size(min = 1, message = "Do you even lift bro????")
    private int reps;

    @NotBlank(message = "Cannot be blank")
    @Size(min = 1, message = "Do you even lift bro????")
    private int weight_per_rep;

    private LocalDate check_in;
    private LocalDate check_out;

    public Long getStrength_id() {
        return strength_id;
    }

    public void setStrength_id(Long strength_id) {
        this.strength_id = strength_id;
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

    public LocalDate getCheck_in() {
        return check_in;
    }

    public void setCheck_in(LocalDate check_in) {
        this.check_in = check_in;
    }

    public LocalDate getCheck_out() {
        return check_out;
    }

    public void setCheck_out(LocalDate check_out) {
        this.check_out = check_out;
    }
}
