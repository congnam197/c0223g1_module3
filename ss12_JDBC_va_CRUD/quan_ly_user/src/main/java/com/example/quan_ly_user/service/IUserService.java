package com.example.quan_ly_user.service;

import com.example.quan_ly_user.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void create(User user) throws SQLException;

    User find(String country);

    List<User> selectAllUser();

    void update(int id, User user) throws SQLException;

    void delete(int id);

    List<User> orderBy();
}
