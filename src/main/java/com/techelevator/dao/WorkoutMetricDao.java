package com.techelevator.dao;

import com.techelevator.model.Workout_Metric;

import java.time.LocalDate;
import java.util.List;

public interface WorkoutMetricDao {

    Workout_Metric getMemberTotalGymTime(Long user_id);

    int getMemberAverageGymTime(Long user_id, LocalDate start, LocalDate end);

}
