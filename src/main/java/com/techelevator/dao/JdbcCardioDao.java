package com.techelevator.dao;

import com.techelevator.model.CardioEquipmentUsage;
import com.techelevator.model.StrengthEquipmentUsage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class JdbcCardioDao implements CardioDao{

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcCardioDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<CardioEquipmentUsage> getAllCardioEquipmentUsage () {
        String sql = "select * from cardio_equipment_usage join equipment on cardio_equipment_usage.equipment_id = equipment.equipment_id join equipment_categories  on equipment.category_id = equipment_categories.category_id where equipment_categories.name = 'cardio';";
        return (List<CardioEquipmentUsage>) jdbcTemplate.queryForObject(sql, new CardioRowMapper());
    }

    public void logCardioEquipmentUsage(CardioEquipmentUsage cardioEquipmentUsage) {
        String sql = "insert into cardio_equipment_usage (cardio_id, equipment_id, session_id, distance, check_in, check_out) values (?,?,?,?,?,?);";
        jdbcTemplate.update(sql, cardioEquipmentUsage.getCardio_id(), cardioEquipmentUsage.getEquipment_id(), cardioEquipmentUsage.getSession_id(), cardioEquipmentUsage.getDistance(), cardioEquipmentUsage.getCheck_in(), cardioEquipmentUsage.getCheck_out());

    }





    private class CardioRowMapper implements RowMapper {
        @Override
        public CardioEquipmentUsage mapRow(ResultSet results, int i) {
            try {
                CardioEquipmentUsage cardioEquipmentUsage = new CardioEquipmentUsage();
                cardioEquipmentUsage.setCardio_id(results.getLong("cardio_id"));
                cardioEquipmentUsage.setEquipment_id(results.getLong("equipment_id"));
                cardioEquipmentUsage.setSession_id(results.getLong("session_id"));
                cardioEquipmentUsage.setDistance(results.getString("distance"));
                cardioEquipmentUsage.setCheck_in(results.getDate("check_in").toLocalDate());
                cardioEquipmentUsage.setCheck_out(results.getDate("check_out").toLocalDate());

                return cardioEquipmentUsage;
            } catch (SQLException e) {
                return null;
            }
        }
    }
}
