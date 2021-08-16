package com.techelevator.dao;

import com.techelevator.authentication.PasswordHasher;
import com.techelevator.model.Assistance_Media;
import com.techelevator.model.Equipment;
import com.techelevator.model.EquipmentUsage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class JdbcEquipmentDao implements EquipmentDao{


    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcEquipmentDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Equipment> getAllEquipment(){
    String sql = "select * from equipment;";
    try{
        return (List<Equipment>) jdbcTemplate.query(sql, new EquipmentRowMapper());
    }catch (EmptyResultDataAccessException e) {
        return null;
    }
    }

    @Override
    public Equipment getEquipment(Long equipment_id) {
       String sql = "select * from equipment where equipment_id = ?;";
       try {
           return (Equipment) jdbcTemplate.queryForObject(sql, new EquipmentRowMapper(), equipment_id);
       }catch (EmptyResultDataAccessException e) {
           return null;
       }
    }

    public List<Equipment> getAllCategoryEquipment(String category_name) {
        String sql = "select * from equipment join equipment_categories on equipment.category_id = equipment_categories.category_id where equipment_categories.name = ? ;";
        try {
            return (List<Equipment>) jdbcTemplate.query(sql, new EquipmentRowMapper(), category_name);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public Map<String, EquipmentUsage> getEquipmentUsageList(List<EquipmentUsage> equipmentUsageList, String category) {
        String sql = "select * from equipment join equipment_categories on equipment.category_id = equipment_categories.category_id where equipment_categories.name = ? ;";
        Map<String, EquipmentUsage> output = new HashMap<>();
        try {
            List<Equipment> equipmentList = (List<Equipment>) jdbcTemplate.query(sql, new EquipmentRowMapper(), category);
            for (int i = 0; i < equipmentList.size(); i++) {
                for (int j = 0; j < equipmentUsageList.size(); j++) {
                    if (equipmentList.get(i).getEquipment_id() == equipmentUsageList.get(j).getEquipment_id()) {
                        output.put(equipmentList.get(i).getName(), equipmentUsageList.get(j));
                    }
                }
            }
            return output;
        } catch (EmptyResultDataAccessException e) {
            return new HashMap<>();
        }
    }

    private class EquipmentRowMapper implements RowMapper {
        @Override
        public Equipment mapRow(ResultSet results, int i) {
            try {
                Equipment equipment = new Equipment();

                equipment.setEquipment_id(results.getLong("equipment_id"));
                equipment.setCategory_id(results.getLong("category_id"));
                equipment.setName(results.getString("name"));
                equipment.setMet_Value(results.getDouble("met_value"));
                return equipment;

            } catch (SQLException e) {
                return null;
            }
        }
    }
}
