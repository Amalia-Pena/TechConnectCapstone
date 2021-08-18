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
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
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
    public double getMemberAverageGymTime(Long user_id, LocalDate start, LocalDate end) {
        try {

            if (start != null && end != null) {
                String sql = "SELECT extract(epoch from(AVG(check_out - check_in)))/1440 AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= DATE(?) AND DATE(check_in) <= DATE(?);";
                return ((Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id, start, end)).getAverageGymTime();
            } else if (start != null) {
                String sql = "SELECT AVG(check_out - check_in) AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= ?;";
                return (double) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id, start);
            } else if (end != null) {
                String sql = "SELECT AVG(check_out - check_in) AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) <= ?;";
                return (double) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id, end);
            } else {
                String sql = "SELECT AVG(check_out - check_in) AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ?;";
                return (double) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id);
            }
        } catch (NullPointerException e) {
            return 0;
        }
    }

    @Override
    public List<Workout_Metric> getVisitMetricsDefaultWeek(Long user_id) {
        try {
            List<Workout_Metric> output = new ArrayList<>();
            LocalDate startDate = LocalDate.now();
            int currentDay = startDate.getDayOfWeek().getValue();
            int[] daysOfWeek = {1, 2, 3, 4, 5, 6, 7};
            for (int i = 0; i < daysOfWeek.length; i++) {
                if (daysOfWeek[i] == currentDay) {
                    startDate = startDate.minusDays(i);
                    break;
                }
            }

            for (int i = 0; i < 7; i++) {

                String sql = "SELECT extract(epoch from(SUM(check_out - check_in)))/60 AS total_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= DATE(?) AND DATE(check_in) <= DATE(?);";
                Workout_Metric newWorkout = (Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionTotalMetricRowMapper(), user_id, startDate, startDate);
                newWorkout.setDay(startDate.getDayOfWeek());
                newWorkout.setDayOfMonth(startDate.getDayOfMonth());
                output.add(newWorkout);
                startDate = startDate.plusDays(1);
            }

            return output;

        } catch (NullPointerException e) {
            return null;
        }
    }

    @Override
    public List<Workout_Metric> getVisitMetricsDefaultMonth(Long user_id, LocalDate startDate, LocalDate endDate) {
        try {
            List<Workout_Metric> output = new ArrayList<>();
            int currentDay = 1;
            for (int i = 1; i <= endDate.getDayOfMonth(); i++) {
                String sql = "SELECT extract(epoch from(SUM(check_out - check_in)))/60 AS total_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= DATE(?) AND DATE(check_in) <= DATE(?);";
                Workout_Metric newWorkout = (Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionTotalMetricRowMapper(), user_id, startDate, startDate);
                newWorkout.setDay(startDate.getDayOfWeek());
                newWorkout.setDayOfMonth(startDate.getDayOfMonth());
                System.out.println(newWorkout.getTotalGymTime() + ":" + newWorkout.getDayOfMonth());
                output.add(newWorkout);
                startDate = startDate.plusDays(1);
            }

            return output;

        } catch (NullPointerException e) {
            return null;
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
                workout_metric.setAverageGymTime(results.getDouble("average_gym_time"));
                return workout_metric;

            } catch (SQLException e) {
                return null;
            }
        }
    }
}
