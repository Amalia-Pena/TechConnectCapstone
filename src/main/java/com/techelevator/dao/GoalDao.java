package com.techelevator.dao;

import com.techelevator.model.Goal;

import java.util.List;

public interface GoalDao {

    public void addNewGoal(String description);
    public void getAllGoalsPerMember (String description);
}
