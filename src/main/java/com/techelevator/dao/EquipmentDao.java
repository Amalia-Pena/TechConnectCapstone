package com.techelevator.dao;

import com.techelevator.model.Assistance_Media;
import com.techelevator.model.Equipment;

import java.util.List;

public interface EquipmentDao {

    public List<Equipment> getAllEquipment();

    public Equipment getEquipment(Long equipment_id);

    public List<Equipment> getAllCategoryEquipment(String category_name);
}
