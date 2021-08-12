package com.techelevator.dao;

import com.techelevator.model.Assistance_Media;
import com.techelevator.model.Equipment;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class JdbcEquipmentDao implements EquipmentDao{
    private AssistanceMediaDao assistanceMediaDao;
    private JdbcTemplate jdbcTemplate;

    public List<Equipment> getAllEquipment(){
    String sql = "select * from equipment;";
    try{
        return (List<Equipment>) jdbcTemplate.queryForObject(sql, new EquipmentRowMapper());
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

    public String getEquipmentMediaPath(Long equipment_id) {
        return assistanceMediaDao.getAssistanceMedia(equipment_id).getPhoto_link();
    }


    private class EquipmentRowMapper implements RowMapper {
        @Override
        public Equipment mapRow(ResultSet results, int i) {
            try {
                Equipment equipment = new Equipment();

                equipment.setEquipment_id(results.getLong("equipment_id"));
                equipment.setName(results.getString("name"));
                equipment.setMet_Value(results.getDouble("met_value"));
                return equipment;

            } catch (SQLException e) {
                return null;
            }
        }
    }
}
