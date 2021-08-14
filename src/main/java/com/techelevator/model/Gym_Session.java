package com.techelevator.model;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Gym_Session {
    // Instance variables
    private Long session_id;
    private Long user_id;
    private Timestamp check_in;
    private Timestamp check_out;

    // Getters

    public Long getSession_id() {
        return session_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public Timestamp getCheck_in() {
        return check_in;
    }

    public Timestamp getCheck_out() {
        return check_out;
    }

    // Setters

    public void setSession_id(Long session_id) {
        this.session_id = session_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public void setCheck_in(Timestamp check_in) {
        this.check_in = check_in;
    }

    public void setCheck_out(Timestamp check_out) {
        this.check_out = check_out;
    }
}
