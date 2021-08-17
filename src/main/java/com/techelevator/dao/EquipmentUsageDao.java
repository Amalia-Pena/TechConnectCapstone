package com.techelevator.dao;

import com.techelevator.model.EquipmentUsage;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface EquipmentUsageDao {
    public void logEquipmentUsage(EquipmentUsage equipmentUsage);

    public List<EquipmentUsage> getGymSessionEquipmentUsage(Long session_id);
}
