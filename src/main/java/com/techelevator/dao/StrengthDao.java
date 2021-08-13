package com.techelevator.dao;

import com.techelevator.model.StrengthEquipmentUsage;

import java.util.List;

public interface StrengthDao {
    public List<StrengthEquipmentUsage> getAllStrengthEquipmentUsage ();

    public void logStrengthEquipmentUsage(List<StrengthEquipmentUsage> strengthEquipmentUsage);
}
