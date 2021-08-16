package com.techelevator.dao;

import com.techelevator.model.Workout_Metric;

import java.util.List;

public interface WorkoutMetricDao {

    public List<Workout_Metric> getAllTimeSpentForMember(Long user_id);

    public List<Workout_Metric> getAllGymTimePerMemberByYear(Long user_id, double check_in, double check_out);
}


