package com.techelevator.dao;

import com.techelevator.model.Exercise_Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;


import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;


@Component
public class JdbcExerciseClassDao implements ExerciseClassDao{

    private final String getAllSql = "select * from exercise_class";
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcExerciseClassDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }



    @Override
    public List<Exercise_Class> getAllClasses() {
        return jdbcTemplate.query(getAllSql, new ExerciseClassRowMapper());
    }


    private class ExerciseClassRowMapper implements RowMapper {
        @Override
        public Exercise_Class mapRow(ResultSet resultSet, int i){
            try {
                Exercise_Class exercise_class = new Exercise_Class();
                exercise_class.setClass_id(resultSet.getLong("class_id"));
                exercise_class.setInstructor_id(resultSet.getLong("instructor_id"));
                exercise_class.setClass_name(resultSet.getString("class_name"));
                exercise_class.setClass_description(resultSet.getString("class_description"));
                exercise_class.setClass_start_date(resultSet.getDate("class_start_date").toLocalDate());
                exercise_class.setClass_end_date(resultSet.getDate("class_end_date").toLocalDate());
                exercise_class.setClass_color(resultSet.getString("class_color"));


                //  Date classStartDate = resultSet.getDate("class_start_date");
                // Date classEndDate = resultSet.getDate("class_end_date");
                return exercise_class;
            } catch (SQLException e){
                return null;
            }
        }
    }
}
