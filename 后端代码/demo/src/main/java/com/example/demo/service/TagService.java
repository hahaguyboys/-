package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class TagService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void deleteTagAndRelatedRecords(int tagId) {
        String sql = "CALL deleteTagAndRelatedRecords(?)";
        jdbcTemplate.update(sql, tagId);
    }
}
