package com.techelevator.dao;

import com.techelevator.model.Workout_Metric;

import java.time.LocalDate;
import java.util.List;

public interface WorkoutMetricDao {

    Workout_Metric getMemberTotalGymTime(Long user_id);

    String getMemberAverageGymTime(Long user_id, LocalDate start, LocalDate end);

    Workout_Metric getVisitMetricDefaultDay(Long user_id, LocalDate startDate);

    List<Workout_Metric> getVisitMetricsDefaultWeek(Long user_id);

    List<Workout_Metric> getVisitMetricsDefaultMonth(Long user_id, LocalDate startDate, LocalDate endDate);

    List<Workout_Metric> getVisitMetricsDefaultYear(Long user_id, LocalDate startDate, LocalDate endDate);

}
