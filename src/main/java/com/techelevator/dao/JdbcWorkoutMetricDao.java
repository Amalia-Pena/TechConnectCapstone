package com.techelevator.dao;

import com.techelevator.model.Workout_Metric;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcWorkoutMetricDao implements WorkoutMetricDao{

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcWorkoutMetricDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Workout_Metric> getAllTimeSpentForMember(Long user_id) {
        List<Workout_Metric> allTimeSpentForMember = new ArrayList<>();
        String sql = "SELECT SUM(check_out - check_in) AS total_gym_time FROM GYM_SESSION JOIN APP_USER ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, user_id);
        while(results.next()){
            allTimeSpentForMember.add(mapRowToWorkoutMetric(results));
        }
        return allTimeSpentForMember;
    }

    private Workout_Metric mapRowToWorkoutMetric(SqlRowSet results) {
        Workout_Metric workout_metric = new Workout_Metric();
        workout_metric.setTotalGymTime(results.getString("total_gym_time"));
        return workout_metric;
    }

    @Override
    public List<Workout_Metric> getAllGymTimePerMemberByYear(Long user_id, double check_in, double check_out) {
        List<Workout_Metric> allGymTimePerMemberByYear = new ArrayList<>();
        String sql = "SELECT SUM(check_out - check_in) AS total_gym_time FROM GYM_SESSION JOIN APP_USER ON gym_session.user_id = app_user.user_id WHERE app_user.user_id = ? AND EXTRACT(YEAR FROM check_in) = ? AND EXTRACT(YEAR FROM check_out) = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql,user_id, check_in, check_out);
        while (results.next()) {
            allGymTimePerMemberByYear.add(mapRowToWorkoutMetric(results));
        }
        return allGymTimePerMemberByYear;
    }

    private Workout_Metric mapRowToGymTimePerMemberPerYear(SqlRowSet results) {
        Workout_Metric workout_metric = new Workout_Metric();
        workout_metric.setCheck_in(results.getDouble("check_in"));
        workout_metric.setCheck_out(results.getDouble("check_out"));
        workout_metric.setTotalGymTime(results.getString("total_gym_time"));
        return workout_metric;
    }


}
