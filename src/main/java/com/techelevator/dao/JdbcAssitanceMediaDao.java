package com.techelevator.dao;

import com.techelevator.model.Assistance_Media;
import com.techelevator.model.Exercise_Class;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class JdbcAssitanceMediaDao implements AssistanceMediaDao {
    private JdbcTemplate jdbcTemplate;


    @Override
    public Assistance_Media getAssistanceMedia(Long equipment_id) {
        String sql = "select * from assistance_media where equipment_id = ?;";
        try {
            return (Assistance_Media) jdbcTemplate.queryForObject(sql, new AssistanceMediaRowMapper(), equipment_id);
        }catch (EmptyResultDataAccessException e) {
            return null;
        }

        }


    private class AssistanceMediaRowMapper implements RowMapper {
        @Override
        public Assistance_Media mapRow(ResultSet results, int i) {
            try {
                Assistance_Media assistance_media = new Assistance_Media();

                assistance_media.setAssistance_id(results.getLong("assistance_id"));
                assistance_media.setEquipment_id(results.getLong("equipment_id"));
                assistance_media.setPhoto_link(results.getString("photo_link"));
                assistance_media.setPhoto_name(results.getString("photo_name"));
                assistance_media.setVideo_link(results.getString("video_link"));
                assistance_media.setVideo_name(results.getString("video_name"));
                assistance_media.setAnimation_link(results.getString("animation_link"));
                assistance_media.setAnimation_name(results.getString("animation_name"));
                return assistance_media;

            } catch (SQLException e) {
                return null;
            }

        }
    }
}
