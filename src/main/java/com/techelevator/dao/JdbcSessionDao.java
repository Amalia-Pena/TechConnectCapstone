package com.techelevator.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcSessionDao implements SessionDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcSessionDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<gymSession> getGymSessionData(String username) {
        List<gymSession> getGymSessionData = new ArrayList<gymSession>();
        String data = "SELECT check"

    }
}
