package com.techelevator.model;

import java.time.LocalDateTime;

public class Gym_Session {
    // Instance variables
    private Long session_id;
    private Long profile_id;
    private LocalDateTime check_in;
    private LocalDateTime check_out;

    // Getters

    public Long getSession_id() {
        return session_id;
    }

    public Long getProfile_id() {
        return profile_id;
    }

    public LocalDateTime getCheck_in() {
        return check_in;
    }

    public LocalDateTime getCheck_out() {
        return check_out;
    }

    // Setters

    public void setSession_id(Long session_id) {
        this.session_id = session_id;
    }

    public void setProfile_id(Long profile_id) {
        this.profile_id = profile_id;
    }

    public void setCheck_in(LocalDateTime check_in) {
        this.check_in = check_in;
    }

    public void setCheck_out(LocalDateTime check_out) {
        this.check_out = check_out;
    }
}
