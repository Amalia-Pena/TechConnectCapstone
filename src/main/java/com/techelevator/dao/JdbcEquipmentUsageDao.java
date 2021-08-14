package com.techelevator.dao;

import com.techelevator.model.EquipmentUsage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class JdbcEquipmentUsageDao implements EquipmentUsageDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcEquipmentUsageDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void logEquipmentUsage(List<EquipmentUsage> equipmentUsage) {
        String sql = "insert into equipment_usage (equipment_id, session_id, reps, weight_per_rep, distance, check_in, check_out) values (?,?,?,?,?,?,?);";
        for (int i = 0; i < equipmentUsage.size(); i++) {
            jdbcTemplate.update(sql, equipmentUsage.get(i).getEquipment_id(), equipmentUsage.get(i).getSession_id(), equipmentUsage.get(i).getReps(), equipmentUsage.get(i).getWeight_per_rep(), equipmentUsage.get(i).getDistance(), equipmentUsage.get(i).getCheck_in(), equipmentUsage.get(i).getCheck_out());
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
                equipmentUsage.setCheck_in(results.getDate("check_in").toLocalDate());
                equipmentUsage.setCheck_out(results.getDate("check_out").toLocalDate());
                return equipmentUsage;
            } catch (SQLException e) {
                return null;
            }
        }
    }
}
