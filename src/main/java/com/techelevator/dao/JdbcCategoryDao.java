package com.techelevator.dao;

import com.techelevator.model.Category;
import com.techelevator.model.Equipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class JdbcCategoryDao implements CategoryDao{

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcCategoryDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public Category getCategory(Long category_id){
        String sql = "select * from equipment_categories where category_id = ?;";
        return (Category) jdbcTemplate.queryForObject(sql, new CategoryRowMapper(), category_id);
    }


    private class CategoryRowMapper implements RowMapper {
        @Override
        public Category mapRow(ResultSet results, int i) {
            try {
                Category category = new Category();
                category.setCategory_id(results.getLong("category_id"));
                category.setCategory_name(results.getString("category_name"));
                return category;

            } catch (SQLException e) {
                return null;
            }
        }
    }
}
