package com.techelevator.dao;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface SessionDao {

    public List<gymSession> getGymSessionData(String username);

}
