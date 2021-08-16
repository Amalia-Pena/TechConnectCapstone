package com.techelevator.dao;

import com.techelevator.model.Assistance_Media;
import com.techelevator.model.Equipment;
import com.techelevator.model.EquipmentUsage;

import java.util.List;
import java.util.Map;

public interface EquipmentDao {

    public List<Equipment> getAllEquipment();

    public Equipment getEquipment(Long equipment_id);

    public List<Equipment> getAllCategoryEquipment(String category_name);

    public Map<String, EquipmentUsage> getEquipmentUsageList(List<EquipmentUsage> equipmentUsageList, String category);
}
