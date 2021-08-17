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
import java.time.LocalDate;
import java.util.List;

@Component
public class JdbcWorkoutMetricDao implements WorkoutMetricDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcWorkoutMetricDao(DataSource datasource) {
        this.jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public Workout_Metric getMemberTotalGymTime(Long user_id) {
        String sql = "SELECT extract(epoch from sum(check_out - check_in))/86400 AS total_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ?;";
        try {
            return (Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionTotalMetricRowMapper(), user_id);

        } catch (NullPointerException e) {
            return null;
        }
    }

    @Override
    public int getMemberAverageGymTime(Long user_id, LocalDate start, LocalDate end) {
        try {

            if (start != null && end != null) {
                String sql = "SELECT AVG(check_out - check_in) AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= ? AND DATE(check_in) <= ?;";
                return (int) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id, start, end);
            } else if (start != null) {
                String sql = "SELECT AVG(check_out - check_in) AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= ?;";
                return (int) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id, start);
            } else if (end != null) {
                String sql = "SELECT AVG(check_out - check_in) AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) <= ?;";
                return (int) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id, end);
            } else {
                String sql = "SELECT AVG(check_out - check_in) AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ?;";
                return (int) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id);
            }
        } catch (NullPointerException e) {
            return 0;
        }
    }


    private class GymSessionTotalMetricRowMapper implements RowMapper {
        @Override
        public Workout_Metric mapRow(ResultSet results, int i) {
            try {
                Workout_Metric workout_metric = new Workout_Metric();
                workout_metric.setTotalGymTime(results.getDouble("total_gym_time"));
                return workout_metric;

            } catch (SQLException e) {
                return null;
            }
        }
    }

    private class GymSessionAverageMetricRowMapper implements RowMapper {
        @Override
        public Workout_Metric mapRow(ResultSet results, int i) {
            try {
                Workout_Metric workout_metric = new Workout_Metric();
                workout_metric.setAverageGymTime(results.getInt("average_gym_time"));
                return workout_metric;

            } catch (SQLException e) {
                return null;
            }
        }
    }
}
