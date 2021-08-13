package com.techelevator.dao;

import com.techelevator.model.CardioEquipmentUsage;

import java.util.List;

public interface CardioDao {
    public List<CardioEquipmentUsage> getAllCardioEquipmentUsage ();

    public void logCardioEquipmentUsage(CardioEquipmentUsage cardioEquipmentUsage);
}
