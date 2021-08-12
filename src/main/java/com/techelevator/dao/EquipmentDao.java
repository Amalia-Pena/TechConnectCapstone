package com.techelevator.dao;

import com.techelevator.model.Equipment;

import java.util.List;

public interface EquipmentDao {

    public List<Equipment> getAllEquipment();

    public Equipment getEquipment(Long equipment_id);

    public String getEquipmentMediaPath(Long equipment_id);
}
