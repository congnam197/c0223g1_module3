package com.example.goi_store_procedures_tu_jdbc.service;

import com.example.goi_store_procedures_tu_jdbc.model.User;
import com.example.goi_store_procedures_tu_jdbc.repository.IUserRepository;
import com.example.goi_store_procedures_tu_jdbc.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> findAllUser() {
        return iUserRepository.findAllUser();
    }

    @Override
    public void update(int id, User user) throws SQLException {
        iUserRepository.update(id, user);
    }

    @Override
    public void delete(int id) {
        iUserRepository.delete(id);
    }

    @Override
    public void create(User user) {
        iUserRepository.create(user);
    }
}
