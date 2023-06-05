package com.example.goi_store_procedures_tu_jdbc.repository;

import com.example.goi_store_procedures_tu_jdbc.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    List<User> findAllUser();

    void update(int id, User user);

    void delete(int id);

    void create(User user);
}
