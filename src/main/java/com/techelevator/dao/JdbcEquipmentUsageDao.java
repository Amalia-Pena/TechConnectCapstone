package com.techelevator.dao;

import com.techelevator.model.EquipmentUsage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcEquipmentUsageDao implements EquipmentUsageDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcEquipmentUsageDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public void logEquipmentUsage(EquipmentUsage equipmentUsage) {
        String sql = "insert into equipment_usage (equipment_id, session_id, reps, weight_per_rep, distance, check_in, check_out) values (?,?,?,?,?,?,?);";
        jdbcTemplate.update(sql, equipmentUsage.getEquipment_id(), equipmentUsage.getSession_id(), equipmentUsage.getReps(), equipmentUsage.getWeight_per_rep(), equipmentUsage.getDistance(), equipmentUsage.getCheck_in(), equipmentUsage.getCheck_out());
    }

    @Override
    public List<EquipmentUsage> getGymSessionEquipmentUsage(Long session_id) {
        String sql = "SELECT * FROM equipment_usage WHERE session_id = ?;";
        try {
            return (List<EquipmentUsage>) jdbcTemplate.query(sql, new EquipmentRowMapper(), session_id);
        } catch (NullPointerException e) {
            return new ArrayList<>();
        }
    }


    private class EquipmentRowMapper implements RowMapper {
        @Override
        public EquipmentUsage mapRow(ResultSet results, int i) {
            try {
                EquipmentUsage equipmentUsage = new EquipmentUsage();
                equipmentUsage.setEquipment_usage_id(results.getLong("equipment_usage_id"));
                equipmentUsage.setEquipment_id(results.getLong("equipment_id"));
                equipmentUsage.setSession_id(results.getLong("session_id"));
                equipmentUsage.setReps(results.getInt("reps"));
                equipmentUsage.setWeight_per_rep(results.getInt("weight_per_rep"));
                equipmentUsage.setDistance(results.getDouble("distance"));
                equipmentUsage.setCheck_in(results.getTimestamp("check_in"));
                equipmentUsage.setCheck_out(results.getTimestamp("check_out"));
                return equipmentUsage;
            } catch (SQLException e) {
                return null;
            }
        }
    }
}
