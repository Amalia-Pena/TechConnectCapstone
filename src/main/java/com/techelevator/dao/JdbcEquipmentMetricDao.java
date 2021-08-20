package com.techelevator.dao;

import com.techelevator.model.Equipment_Metric;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcEquipmentMetricDao implements EquipmentMetricDao{

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcEquipmentMetricDao(DataSource datasource) {
        this.jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public List<Equipment_Metric> getAllEquipmentMetricForEmployee(double check_in, double check_out) {
        List<Equipment_Metric> matchingEquipmentMetricForEmployee = new ArrayList<>();
        String sql = "select equipment.name, extract(epoch from sum(check_out - equipment_usage.check_in))/60 as equipment_usage from equipment_usage join equipment on equipment.equipment_id = equipment_usage.equipment_id where extract(month from check_in) >= ? and  extract(month from check_out) <= ? group by equipment.name order by equipment_usage desc;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, check_in, check_out);
        while(results.next()){
            matchingEquipmentMetricForEmployee.add(mapRowToEquipmentMetric(results));
        }
        return matchingEquipmentMetricForEmployee;
    }

    private Equipment_Metric mapRowToEquipmentMetric(SqlRowSet results) {
        Equipment_Metric equipment_metric = new Equipment_Metric();
        equipment_metric.setName(results.getString("name"));
        equipment_metric.setEquipmentUsage(results.getString("equipment_usage"));
        return equipment_metric;
    }



}
