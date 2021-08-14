package com.techelevator.dao;

import com.techelevator.model.EquipmentUsage;
import com.techelevator.model.Gym_Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
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
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        gymSession.setCheck_in(ts);
        gymSession.setUser_id(user_id);
    }

    public void checkOut(Long user_id) {
        String sqlInsert = "INSERT into gym_session (user_id, check_in, check_out) VALUES (?, ?, ?);";
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        gymSession.setCheck_out(ts);
        jdbcTemplate.update(sqlInsert, user_id, gymSession.getCheck_in(), gymSession.getCheck_out());

        String sql = "SELECT * FROM gym_session WHERE check_in = '" + (gymSession.getCheck_in()) + "' AND user_id = " + gymSession.getUser_id();
        Gym_Session updatedSession = (Gym_Session) jdbcTemplate.queryForObject(sql, new GymSessionRowMapper());
        gymSession.setSession_id(updatedSession.getSession_id());

    }

    public Gym_Session getGymSession() {
        return gymSession;
    }

    public void resetGymSession() {
        gymSession = new Gym_Session();
    }

    private class GymSessionRowMapper implements RowMapper {
        @Override
        public Gym_Session mapRow(ResultSet results, int i) {
            try {
                Gym_Session gymSession = new Gym_Session();
                gymSession.setSession_id(results.getLong("session_id"));
                gymSession.setUser_id(results.getLong("user_id"));
                gymSession.setCheck_in(results.getTimestamp("check_in"));
                gymSession.setCheck_out(results.getTimestamp("check_out"));
                return gymSession;
            } catch (SQLException e) {
                return null;
            }
        }
    }
}
