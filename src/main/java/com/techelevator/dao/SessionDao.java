package com.techelevator.dao;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface SessionDao {

    public void checkIn(Long user_id);
    public void checkOut(Long user_id);
}
