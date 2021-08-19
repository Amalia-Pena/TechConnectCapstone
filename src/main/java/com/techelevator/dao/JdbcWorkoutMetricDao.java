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
        String sql = "SELECT sum(check_out - check_in) AS total_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ?;";
        try {
            return (Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionTotalMetricRowMapper(), user_id);

        } catch (NullPointerException e) {
            return null;
        }
    }

    @Override
    public String getMemberAverageGymTime(Long user_id, LocalDate start, LocalDate end) {
        try {

            if (start != null && end != null) {
                String sql = "SELECT extract(epoch from(AVG(check_out - check_in)))/60 AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= DATE(?) AND DATE(check_in) <= DATE(?);";
                return String.format("%.2f", ((Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id, start, end)).getAverageGymTime());
            } else if (start != null) {
                String sql = "SELECT extract(epoch from(AVG(check_out - check_in)))/60 AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= ?;";
                return String.format("%.2f", ((Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id, start)).getAverageGymTime());
            } else if (end != null) {
                String sql = "SELECT extract(epoch from(AVG(check_out - check_in)))/60 AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) <= ?;";
                return String.format("%.2f", ((Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id, end)).getAverageGymTime());
            } else {
                String sql = "SELECT extract(epoch from(AVG(check_out - check_in)))/60 AS average_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ?;";
                return String.format("%.2f", ((Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionAverageMetricRowMapper(), user_id)).getAverageGymTime());
            }
        } catch (NullPointerException e) {
            return "";
        }
    }

    @Override
    public Workout_Metric getVisitMetricDefaultDay(Long user_id, LocalDate startDate) {
        try {
            String sql = "SELECT extract(epoch from(SUM(check_out - check_in)))/60 AS total_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= DATE(?) AND DATE(check_in) <= DATE(?);";
            Workout_Metric newWorkout = (Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionTotalMetricRowMapper(), user_id, startDate, startDate);
            newWorkout.setDay(startDate.getDayOfWeek());
            return newWorkout;
        } catch (NullPointerException e) {
            return null;
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
                output.add(newWorkout);
                startDate = startDate.plusDays(1);
            }

            return output;

        } catch (NullPointerException e) {
            return null;
        }
    }

    @Override
    public List<Workout_Metric> getVisitMetricsDefaultYear(Long user_id, LocalDate startDate, LocalDate endDate) {
        try {
            List<Workout_Metric> output = new ArrayList<>();
            for (int i = 1; i <= 12; i++) {
                String sql = "SELECT extract(epoch from(SUM(check_out - check_in)))/60 AS total_gym_time FROM gym_session JOIN app_user ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND DATE(check_in) >= DATE(?) AND DATE(check_in) <= DATE(?);";
                Workout_Metric newWorkout = (Workout_Metric) jdbcTemplate.queryForObject(sql, new GymSessionTotalMetricRowMapper(), user_id, startDate, startDate.plusMonths(1));
                newWorkout.setMonth(startDate.getMonth().toString());
                output.add(newWorkout);
                System.out.println(newWorkout.getMonth() + ":" + newWorkout.getTotalGymTime());
                startDate = startDate.plusMonths(1);
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
                workout_metric.setTotalGymTime(results.getString("total_gym_time"));
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
