package com.example.goi_store_procedures_tu_jdbc.service;

import com.example.goi_store_procedures_tu_jdbc.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> findAllUser();

    void update(int id, User user) throws SQLException;

    void delete(int id);

    void create(User user);
}
