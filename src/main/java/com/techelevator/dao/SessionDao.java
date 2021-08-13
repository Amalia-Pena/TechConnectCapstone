package com.techelevator.dao;

import com.techelevator.model.Gym_Session;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface SessionDao {

    public void checkIn(Long user_id);
    public void checkOut(Long user_id);
    public Gym_Session getGymSession();
}
