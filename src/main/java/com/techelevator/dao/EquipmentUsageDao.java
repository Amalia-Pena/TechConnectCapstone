package com.techelevator.dao;

import com.techelevator.model.EquipmentUsage;

import java.util.List;

public interface EquipmentUsageDao {
    public void logEquipmentUsage(List<EquipmentUsage> equipmentUsage);
}
