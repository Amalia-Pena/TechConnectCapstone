package com.techelevator.dao;

import com.techelevator.model.Workout_Metric;

import java.util.List;

public interface WorkoutMetricDao {

    int getMemberTotalGymTime(Long user_id);
}
