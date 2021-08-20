package com.techelevator.dao;

import com.techelevator.model.Gym_Session;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Component
public interface SessionDao {

    public void checkIn(Long user_id);

    public void checkOut(Long user_id);

    public Gym_Session getGymSession();

    public void resetGymSession();

    public List<Gym_Session> getAllGymSessions(Long user_id);

    public void createGymSession(Long user_id, Timestamp check_in, Timestamp check_out);

    public List<Gym_Session> getGymSessionsByMonth(Long user_id, String yearValue, String monthValue);

    public List<Gym_Session> getGymSessionsByMonthDay(Long user_id, String yearValue, String monthValue, String dayValue);

    public Long getSessionByDay(Long user_id, String yearValue, String monthValue, String dayValue);

}
