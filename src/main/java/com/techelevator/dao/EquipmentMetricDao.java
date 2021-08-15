package com.techelevator.dao;

import com.techelevator.model.Equipment_Metric;

import java.util.List;

public interface EquipmentMetricDao {

    public List<Equipment_Metric> getAllEquipmentMetricForEmployee(double check_in, double check_out);
}
