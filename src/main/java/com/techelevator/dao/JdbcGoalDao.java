package com.techelevator.dao;

import com.techelevator.model.Goal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import javax.swing.tree.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class JdbcGoalDao implements GoalDao {

    private final JdbcTemplate jdbcTemplate;
    private final String getAllSql = "SELECT * FROM goal";


    @Autowired
    public JdbcGoalDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public void getAllGoalsPerMember (String description) {
        String sqlAllGoals = "SELECT * FROM goal WHERE description = ?;";
        jdbcTemplate.update(sqlAllGoals, description);
    }


    @Override
    public void addNewGoal(String description) {
        String sqlUpdateGoal = "UPDATE goal SET description = ? WHERE user_id = ?;";
        jdbcTemplate.update(sqlUpdateGoal, description);
    }
}
