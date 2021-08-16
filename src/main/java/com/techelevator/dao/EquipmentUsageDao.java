package com.techelevator.dao;

import com.techelevator.model.EquipmentUsage;

import java.util.List;

public interface EquipmentUsageDao {
    public void logEquipmentUsage(EquipmentUsage equipmentUsage);

    public List<EquipmentUsage> getGymSessionEquipmentUsage(Long session_id);
}
