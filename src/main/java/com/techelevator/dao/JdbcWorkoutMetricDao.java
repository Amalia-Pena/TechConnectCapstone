package com.techelevator.dao;

import com.techelevator.model.Category;
import com.techelevator.model.Workout_Metric;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class JdbcWorkoutMetricDao implements WorkoutMetricDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcWorkoutMetricDao(DataSource datasource) {
        this.jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public int getMemberTotalGymTime(Long user_id) {
        String sql = "SELECT SUM(check_out - check_in) AS total_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ?;";
        try {
            return (int) jdbcTemplate.queryForObject(sql, new GymSessionMetricRowMapper(), user_id);
        } catch (NullPointerException e) {
            return 0;
        }
    }


    private class GymSessionMetricRowMapper implements RowMapper {
        @Override
        public Workout_Metric mapRow(ResultSet results, int i) {
            try {
                Workout_Metric workout_metric = new Workout_Metric();
                workout_metric.setTotalGymTime(results.getInt("total_gym_time"));
                return workout_metric;

            } catch (SQLException e) {
                return null;
            }
        }
    }
}
