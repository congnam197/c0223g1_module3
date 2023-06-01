package com.example.quan_ly_user.repository;

import com.example.quan_ly_user.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void create(User user) throws SQLException;

    User find(String country);

    List<User> selectAllUser();

    void updateUser(int id, User user) throws SQLException;

    void delete(int id);

    List<User> oderBy();
}
