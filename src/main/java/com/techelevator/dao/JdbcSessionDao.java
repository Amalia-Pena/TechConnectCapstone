package com.techelevator.dao;

import com.techelevator.model.Gym_Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcSessionDao implements SessionDao {

    private JdbcTemplate jdbcTemplate;
    private Gym_Session gymSession = new Gym_Session();

    @Autowired
    public JdbcSessionDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void checkIn(Long user_id) {
        gymSession.setCheck_in(LocalDateTime.now());
    }

    public void checkOut(Long user_id) {
        String sqlInsert = "INSERT into gym_session (user_id, check_in, check_out) VALUES (?, ?, ?);";
        gymSession.setCheck_out(LocalDateTime.now());
        jdbcTemplate.update(sqlInsert, user_id, gymSession.getCheck_in(), gymSession.getCheck_out());
    }
    public Gym_Session getGymSession() {
        return gymSession;
    }

    public void resetGymSession() {
        gymSession = new Gym_Session();
    }
}
