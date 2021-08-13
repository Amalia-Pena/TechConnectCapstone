package com.techelevator.dao;

import com.techelevator.model.StrengthEquipmentUsage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class JdbcStrengthDao implements StrengthDao{

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcStrengthDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<StrengthEquipmentUsage> getAllStrengthEquipmentUsage () {
        String sql = "select * from strength_equipment_usage join equipment e on strength_equipment_usage.equipment_id = e.equipment_id  join equipment_categories ec on e.category_id = ec.category_id  where ec.name = 'strength';";
        return (List<StrengthEquipmentUsage>) jdbcTemplate.queryForObject(sql, new StrengthRowMapper());
    }

    public void logStrengthEquipmentUsage(List<StrengthEquipmentUsage> strengthEquipmentUsage) {
        String sql = "insert into strength_equipment_usage (equipment_id, session_id, reps, weight_per_rep, check_in, check_out) values (?,?,?,?,?,?);";
        for (int i = 0; i < strengthEquipmentUsage.size(); i++) {
            jdbcTemplate.update(sql, strengthEquipmentUsage.get(i).getEquipment_id(), strengthEquipmentUsage.get(i).getSession_id(), strengthEquipmentUsage.get(i).getReps(), strengthEquipmentUsage.get(i).getWeight_per_rep(), strengthEquipmentUsage.get(i).getCheck_in(), strengthEquipmentUsage.get(i).getCheck_out());
        }

    }

    private class StrengthRowMapper implements RowMapper {
        @Override
        public StrengthEquipmentUsage mapRow(ResultSet results, int i) {
            try {
               StrengthEquipmentUsage strengthEquipmentUsage = new StrengthEquipmentUsage();
               strengthEquipmentUsage.setStrength_id(results.getLong("strength_id"));
               strengthEquipmentUsage.setEquipment_id(results.getLong("equipment_id"));
               strengthEquipmentUsage.setSession_id(results.getLong("session_id"));
               strengthEquipmentUsage.setReps(results.getInt("reps"));
               strengthEquipmentUsage.setWeight_per_rep(results.getInt("weight_per_rep"));
               strengthEquipmentUsage.setCheck_in(results.getDate("check_in").toLocalDate());
               strengthEquipmentUsage.setCheck_out(results.getDate("check_out").toLocalDate());
               return strengthEquipmentUsage;
            } catch (SQLException e) {
                return null;
            }
        }
    }
}
